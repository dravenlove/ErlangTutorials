1	设计思路及主要代码分析
1.1设计思路
在这次设计中定义的多个缓冲区不是环形循环的，并且不需要按序访问。其中生产者可以把产品放到某一个空缓冲区中，消费者只能消费被指定生产者生产的产品。本设计在测试用例文件中指定了所有生产和消费的需求，并规定当共享缓冲区的数据满足了所有有关它的消费需求后，此共享才可以作为空闲空间允许新的生产者使用。
本设计在为生产者分配缓冲区时各生产者之间必须互斥，此后各个生产者的具体生产活动可以并发。而消费者之间只有在对同一个产品进行消费时才需要互斥，它们在消费过程结束时需要判断该消费者对象是否已经消费完毕并释放缓冲区的空间。

1.2程序流程图


















1.3基本内容
在设计程序时主要有三个主体部分、三个辅助函数和一个数据结构。
其中主体部分为一个主函数main（），用于初始化缓冲区和各个同步对象，并完成线程信息的读入，最后根据该组的线程记录启动模拟线程，并等待所有线程的运行结束后退出程序；
生产者函数Produce（）和消费者函数Consume（），生产者和消费者函数运行于线程中完成对缓冲区的读、写动作，根据此处生产消费的模型的特点，生产者和消费者之间通过使用同步对象实现了生产和消费的同步与互斥，是本实验的核心所在。
另外三个辅助性函数被生产者和消费者函数调用，是上述生产和消费函数中对缓冲区进行的一系列处理。
定义一个数据结构，记录在测试文件中指定的每一个线程的参数。
1)	用一个整型数组Buffer_Critical来代表缓冲区。不管是生产产品还是对已有的产品的消费都需要访问该组缓冲区。
2)	进程信息ThreadInfo数据结构，包含线程的各个信息。
struct ThreadInfo
{
int serial;                            //线程序列号
char entity;                           //是P还是C
double delay;                          //线程延迟
int thread_request[MAX_THREAD_NUM];    //线程请求队列
int n_request;                         //请求个数
};
3)	在实现本程序的消费生产模型时，具体的通过如下同步对象实现互斥：
①	设一个互斥量h_mutex，以实现生产者在查询和保留缓冲区内的下一个位置时进行互斥。
②	每一个生产者用一个信号量与其消费者同步，通过设置h_Semaphore[MAX_THREAD_NUM]信号量
③	数组实现，该组信号量用于相应的产品已产生。同时用一个表示空缓冲区数目的信号量empty_semaphore进行类似的同步，只是缓冲区中是否存在空位置，以便开始生产下一个产品。
④	每一个缓冲区用一个同步对象实现该缓冲区上消费者之间的互斥，这通过设置临界区对象数组PC_Crilical[MAX_BUFFER_NUM]实现。
1.4程序代码

#include<stdafx.h>
#include<windows.h>
#include<fstream.h>
#include<stdio.h>
#include<string>
#include<conio.h>
#define MAX_BUFFER_NUM  10 
#define INTE_PER_SEC 1000
#define MAX_THREAD_NUM  64  

//定义一个结构，记录在测试文件中指定的每一个线程的参数
struct ThreadInfo 
{
	//进程信息ThreadInfo数据结构，包含线程的各个信息
	int  serial;                           //线程序列号
	char entity;                           //是P还是C
	int delay;                             //线程延迟
	int thread_request[MAX_THREAD_NUM];    //线程请求队列 
	int n_request;                         //请求个数
};
//每一个缓冲区用一个同步对象实现该缓冲区上消费者之间的互斥，这通过设置临界区对象数组PC_Crilical[MAX_BUFFER_NUM]实现。
CRITICAL_SECTION  PC_Critical [MAX_BUFFER_NUM]; 
//用一个整型数组Buffer_Critical来代表缓冲区。不管是生产产品还是对已有的产品的消费都需要访问该组缓冲区。
int Buffer_Critical[MAX_BUFFER_NUM];  
HANDLE   h_Thread[MAX_THREAD_NUM];
ThreadInfo Thread_Info[MAX_THREAD_NUM];
//设一个互斥量h_mutex，以实现生产者在查询和保留缓冲区内的下一个位置时进行互斥。
HANDLE h_mutex;          
//每一个生产者用一个信号量与其消费者同步，通过设置h_Semaphore[MAX_THREAD_NUM]信号量数组实现，该组信号量用于相应的产品已产生。
HANDLE h_Semaphore[MAX_THREAD_NUM]; 
//同时用一个表示空缓冲区数目的信号量empty_semaphore进行类似的同步，只是缓冲区中是否存在空位置，以便开始生产下一个产品。
HANDLE empty_semaphore; 
DWORD n_Thread=0; 
DWORD n_Buffer_or_Critical;
void Produce(void *p);
void Consume(void *p);
bool IfInOtherRuquest(int);
int FindProducePosition();
int FindBufferPosition(int);

//函数 输入数据，提取线程信息到数据结构中，初始化临界区，创建信号量，创建线程
int main(void)
{  


	//声明所需变量
	DWORD     wait_for_all;
	ifstream inFile;
	//初始化缓冲区
	for(int i=0;i<MAX_BUFFER_NUM;i++)
		Buffer_Critical[i]=-1;  
	//初始化每个线程的请求序列
	for(int j=0;j<MAX_THREAD_NUM;j++)
	{
		for(int k=0;k<MAX_THREAD_NUM;k++)
			Thread_Info[j].thread_request[k]=-1;
		Thread_Info[j].n_request=0;
	} 
	//初始化临界段对象
	for(i=0;i<MAX_BUFFER_NUM;i++)
		InitializeCriticalSection(&PC_Critical[i]);
	//打开输入文件，按照规定的格式提取线程等信息
	inFile.open("test.txt"); 
	//从文件中获取实际的缓冲区的数目
	inFile>>n_Buffer_or_Critical;
	inFile.get();
	printf("输入文件是:\n");  
	//显示获得的缓冲区数目信息
    printf(" %d个缓冲区 \n",(int)n_Buffer_or_Critical);
	//提取每个线程信息到相应的数据结构中
	while(inFile)
	{
		inFile>>Thread_Info[n_Thread].serial;
		inFile>>Thread_Info[n_Thread].entity;
		inFile>>Thread_Info[n_Thread].delay;
		char c;
		inFile.get(c);   
		while(c!='\n'&& !inFile.eof())
		{
			inFile>>Thread_Info[n_Thread].thread_request[Thread_Info[n_Thread].n_request++];
			inFile.get(c); 
		}
		n_Thread++;
	}
	 //显示获得的线程信息，便于确认正确性
	for(j=0;j<(int)n_Thread;j++)
	{
		int Temp_serial=Thread_Info[j].serial;
		char Temp_entity=Thread_Info[j].entity;
		int Temp_delay=Thread_Info[j].delay;
		printf(" 线程%2d  %c  %d  ", Temp_serial,Temp_entity,Temp_delay);
		int Temp_request=Thread_Info[j].n_request;
		for(int k=0;k<Temp_request;k++)
			printf(" %d   ",Thread_Info[j].thread_request[k]);
		cout<<endl;
	}
	cout<<"------------------------------------------------------"<<endl;         
	empty_semaphore=CreateSemaphore(NULL,n_Buffer_or_Critical,n_Buffer_or_Critical,"semaphore_for_empty");
	//创建在模拟过程中的几个信号量
	h_mutex=CreateMutex(NULL,FALSE,"mutex_for_update"); 
	//用线程的ID号来为相应的生产线程的产品读写时所使用的同步信号量命名
	for(j=0;j<(int)n_Thread;j++)
	{
		std::string lp ="semaphore_for_produce_";
		int temp=j;
		while(temp)
		{
			//转换为字符
			char c=(char)(temp%10);
			lp+=c;
			temp/=10;
		}
		h_Semaphore[j+1]=CreateSemaphore(NULL,0,n_Thread,lp.c_str());
	}
	//生产者消费者线程
	for(i=0;i<(int)n_Thread;i++)
	{  
		if(Thread_Info[i].entity=='P')
			h_Thread[i]=CreateThread(NULL,0,(LPTHREAD_START_ROUTINE)(Produce),&(Thread_Info[i]),0,NULL);
		else
			h_Thread[i]=CreateThread(NULL,0,(LPTHREAD_START_ROUTINE)(Consume),&(Thread_Info[i]),0,NULL);
	}
	//主线程等待各个线程结束
	wait_for_all=WaitForMultipleObjects(n_Thread,h_Thread,TRUE,-1);
	cout<<"------------------------------------------------------"<<endl;  
	printf("所有的生产者和消费者已经完成了他们的工作。\n");
	printf("请按任意键退出!\n");
	_getch();
	return 0;
}
//确认是否还有对同一产品的消费请求未执行
bool IfInOtherRequest(int req)
{
	for(int i=0;i<n_Thread;i++)
		for(int j=0;j<Thread_Info[i].n_request;j++)
			if(Thread_Info[i].thread_request[j]==req)
				return TRUE;
			return FALSE;
}                             
//找出当前可以进行产品生产的空缓冲区位置；
int FindProducePosition()
{
	//用下面这个特殊值表示本缓冲区正处于被写状态；
	int EmptyPosition;
	for(int i=1;i<=n_Buffer_or_Critical;i++)
		if(Buffer_Critical[i]==-1)
		{
			EmptyPosition=i;
			Buffer_Critical[i]=-2;
			break;
		}
		return EmptyPosition;
}
int FindBufferPosition(int ProPos)
{
	int TempPos;
	for(int i=1;i<=n_Buffer_or_Critical;i++)
		if(Buffer_Critical[i]==ProPos)
		{
			TempPos=i;
			break;
		}
		return TempPos;
}
//生产者进程
void Produce(void *p) 
{
	DWORD wait_for_semaphore,wait_for_mutex,m_delay;
	int m_serial;
	//获得本线程信息
	m_serial=((ThreadInfo*)(p))->serial;
	m_delay=(DWORD)(((ThreadInfo*)(p))->delay*INTE_PER_SEC);
	Sleep(m_delay);
	//开始请求生产
	printf("生产者 %2d 请求生产\n",m_serial);
	//确认有缓冲区可以生产，同时将空位置数empty减1；用于生产者和消费者之间的同步;
	wait_for_semaphore=WaitForSingleObject(empty_semaphore,-1);
	//互斥访问下一个可用于生产的空临界区，实现写写互斥
	wait_for_mutex=WaitForSingleObject(h_mutex,-1);
	int ProducePos=FindProducePosition();
	ReleaseMutex(h_mutex);
	//生产者在获得自己的空位置并做上标记后，以下写操作在生产者之间可以并发
	//在核心生产步骤中，程序将生产者的ID作为产品编号放入，方便消费者识别
	printf("生产者 %2d 开始生产在位置 %2d\n",m_serial,ProducePos);
	Buffer_Critical[ProducePos]=m_serial;
	printf("生产者 %2d 完成生产\n",m_serial);
	printf("位置[%2d]:%3d 的产品 \n",ProducePos,Buffer_Critical [ProducePos]);
	//使生产者写的缓冲区可以被多个消费者使用，实现读写同步
	ReleaseSemaphore(h_Semaphore[m_serial],n_Thread,NULL);
}
//消费者进程
void Consume(void*p)
{
	DWORD wait_for_semaphore,m_delay;
	//消费者的序列号和请求的数目
	int m_serial,m_requestNum;
	//本消费线程的请求队列
	int m_thread_request[MAX_THREAD_NUM];
	//提取本线程信息到本地
	m_serial=((ThreadInfo*)(p))->serial;
	m_delay=(DWORD)(((ThreadInfo*)(p))->delay*INTE_PER_SEC);
	m_requestNum=((ThreadInfo*)(p))->n_request;
	for(int i=0;i<m_requestNum;i++)
		m_thread_request[i]=((ThreadInfo*)(p))->thread_request[i];
	Sleep(m_delay);
	for(i=0;i<m_requestNum;i++)
	{
		printf("消费者 %2d 请求消费 %2d 的产品 \n",m_serial,m_thread_request[i]);
		//请求下一个产品
		//如果对应生产者没有生产，则等待；
		//如果生产了，允许消费者数目为-1；实现了读写同步
		wait_for_semaphore=WaitForSingleObject(h_Semaphore[m_thread_request[i]],-1);
	    //查询所需产品放到缓冲区的号
		int BufferPos=FindBufferPosition(m_thread_request[i]);
		//开始进行具体缓冲区处理，读和读在改缓冲区上仍然是互斥的
		//进入临界区后执行消费动作，并在完成此次请求后，通知另外的消费者本处请求已经满足；
		//同时如果对应的产品使用完毕，就做相应处理，并给出相应动作的界面提示；
		//该相应处理指将相应缓冲区清空，并增加代表空缓冲区得信号量
		EnterCriticalSection(&PC_Critical[BufferPos]);
		printf("消费者 %2d 开始消费 %2d 的产品 \n",m_serial,m_thread_request[i]);
		((ThreadInfo*)(p))->thread_request[i]=-1;
		if(!IfInOtherRequest(m_thread_request[i]))
		{
			//标记缓冲区为空
			Buffer_Critical[BufferPos]=0;
			printf("消费者 %2d 消费完成 %2d \n",m_serial,m_thread_request[i]);
			printf("位置[%2d]:%3d\n",BufferPos,Buffer_Critical[BufferPos]);
			//离开临界区
			ReleaseSemaphore(empty_semaphore,1,NULL);
		}
		else
		{
			printf("消费者 %2d 消费完产品 %2d \n",m_serial,m_thread_request[i]);
		}
		LeaveCriticalSection(&PC_Critical[BufferPos]);
	}
}
2	实验结果及问题分析
2.1	测试结果
测试文件内容为：
5
1 P 3
2 P 4
3 C 4 1
4 P 1
5 C 2 1 2 4
运行程序如下图主菜单页面所示：
 
2.2	结果分析        
由于我们在一个循环中创建了这五个线程，所以认为它们是同时开始运转的。根据第三列的延迟时间，最早开动作的是thread 4生产产品。它5个缓冲区的位置[1]中生产了产品。接下来是线程 5和1，消费者 5要求消费线程 1生产的产品，线程 1还没有生产，所以先阻塞，然后, 线程 1发送生产请求，线程 1生产完产品放入位置[2]，消费者5才能够消费，接着消费者5要求消费线程 2的产品，此产品还没生产，5线程被阻塞。到第4秒时，线程 2要求生产，产品放入位置[3]，消费者3消费线程 1的产品.此时线程 5所要求消费的产品已经都就绪，所以线程 5消费被激活，顺利消费线程 1,2,4生产者得产品。所以，由于对每个产品的都是对它的最后一次消费，所以，消费完产品后随即释放该产品所占缓冲区空间。

