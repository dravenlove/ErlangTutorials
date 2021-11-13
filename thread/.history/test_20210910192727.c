#include <stdio.h>  
#include <pthread.h>  
#include <semaphore.h>

#define MAX_THREAD_NUM 4  //最大线程数为4

typedef struct thread_info 
{
    size_t id;                     //进程序列号
    size_t max_thread;             //最大线程数
    char entity;                   //判断是生产者还是消费者
    char status;                   //判断线程状态
    double delay;                  //线程延迟
    
    
    void (*outputinfo)();
}all_thread_info;


void 

sem_t empty1,full1,empty2,full2,empty3,full3,empty4,full4;////定义四个缓存区 
pthread_mutex_t mutex1 /*,mutex2,mutex3,mutex4 */;   //定义两个个全局互斥量
int message1=0;                  //定义三个个全局变量用来收发信息
int message2=0;
int message3=0;

void *producer1( void *arg );    //生产者1线程声明
//void *(*func)(void *):是个指向函数地址的指针，此函数地址是线程开始执行的起始函数地址。起始函数的地址由func确定。
void *producer2( void *arg );    //生产者2线程声明
void *consumerr1( void *arg );    //消费者1线程声明
void *consumerr2( void *arg );    //消费者2线程声明

void *producer1( void *arg )     //死循环让进程一直运行
{

    while(1)
    {
        //int abc=0;
        //sem_getvalue(&empty1,&abc);
        //while(abc == 2){
        sem_wait(&empty1);  //empty1-1
        pthread_mutex_lock( &mutex1 );   //加锁,因为一个进程只能有一个线程有锁所以只有他单独操作这个互斥量,接下来进行消息生产
        all_thread_info.id=1;
        
        printf("producer1:input_message1:\r\n");


        //scanf("%d",&message1);
        pthread_mutex_unlock( &mutex1 ); //解锁
        sem_post(&full1);

        sem_post(&empty2);          //full1+1 
       // }
    }
};

void *producer2( void *arg )     //死循环让进程一直运行
{
    while(1)
    {
        //int abc1=0;
        //int abd1=0;
        //sem_getvalue(&empty1,&abc1);
        //sem_getvalue(&empty2,&abd1);
        //while((abc1 == 1) /*& (abd1 ==1)*/ ){
        sem_wait(&empty2);  //empty1-1
        pthread_mutex_lock( &mutex1 );   //加锁,因为一个进程只能有一个线程有锁所以只有他单独操作这个互斥量,接下来进行消息生产
        all_thread_info.id=2;

        printf("producer2:input_message2:");
        //scanf("%d",&message2);
        pthread_mutex_unlock( &mutex1 ); //解锁
        sem_post(&full2);          //full1+1 
        //}
    }
};


void *consumerr1( void *arg )     //死循环让进程一直运行
{
    while(1)
    {
        //int abc12=0;
        //int abd1=0;
        //sem_getvalue(&full1,&abc12);
        //sem_getvalue(&empty2,&abd1);
        //while((abc12 == 2) & (abd1 == 1)){
        sem_wait(&full1);  //full1-1
        pthread_mutex_lock( &mutex1 );   //加锁,因为一个进程只能有一个线程有锁所以只有他单独操作这个互斥量,接下来进行消息生产
        all_thread_info.id=3;
        printf("consumerr1:ouput_message1:%d",&message1);
        pthread_mutex_unlock( &mutex1 ); //解锁
         sem_post(&empty3);        //full2+1
         //sem_post(&empty4);

        sem_wait(&empty3);  //empty2-1
        //pthread_mutex_lock( &mutex2 );   //加锁,因为一个进程只能有一个线程有锁所以只有他单独操作这个互斥量,接下来进行消息生产
        printf("consumerr1:input_message2:");
        message3=message1;

        pthread_mutex_unlock( &mutex1 ); //解锁
        sem_post(&full3);        //full1+1 
        
        //}
    }
};


void *consumerr2( void *arg )     //死循环让进程一直运行
{
    while(1)
    {
        //int abc123=0;
        //sem_getvalue(&full1,&abc123);
        //while(abc123 == 1){
        sem_wait(&full2);  //empty2-1
        pthread_mutex_lock( &mutex1 );   //加锁,因为一个进程只能有一个线程有锁所以只有他单独操作这个互斥量,接下来进行消息生产
         all_thread_info.id=4;
       printf("consumerr2:ouput_message1:%d",&message3);

              // sem_post(&empty2);        //empty+1 
        pthread_mutex_unlock( &mutex1 ); //解锁
        sem_wait(&full3);  //empty-1
        pthread_mutex_lock( &mutex1 );   //加锁,因为一个进程只能有一个线程有锁所以只有他单独操作这个互斥量,接下来进行消息生产
        printf("consumerr2:ouput_message1:%d",&message2);
        pthread_mutex_unlock( &mutex1 ); //解锁
        //}
        sem_post(&empty1);        //empty+1 
    }
};



int main(char argc,char* argv[])
{
    pthread_t producter1,producter2,consumer1,consumer2;//创建四个对象两个生产者两个消费者
    pthread_mutex_init(&mutex1,NULL);//初始两个化互斥量
    sem_init (&empty1, 0, 1);            //初始化empty1信号量//(信号对象,0多线程同步1多进程共享,初始值)
    sem_init (&full1, 0, 0);            //初始化full1信号量
    //pthread_mutex_init(&mutex2,NULL);
    sem_init (&empty2, 0, 0);            //初始化empty2信号量
    sem_init (&full2, 0, 0);            //初始化full2信号量
    //pthread_mutex_init(&mutex3,NULL);
    sem_init (&empty3, 0, 0);            //初始化empty2信号量
    sem_init (&full3, 0, 0);            //初始化full2信号量
        //pthread_mutex_init(&mutex4,NULL);
    sem_init (&empty4, 0, 0);            //初始化empty2信号量
    sem_init (&full4, 0, 0);            //初始化full2信号量
      
    if( pthread_create( &producter1 , NULL, producer1 ,  //创建生产者和消费者线程
                NULL ) != 0 )  
        printf( "thread create failed." ); 
    if( pthread_create( &producter2 , NULL, producer2 ,  
                NULL ) != 0 )  
        printf( "thread create failed." ); 

    if( pthread_create( &consumer1 , NULL, consumerr1 ,  
                NULL ) != 0 )  
        printf( "thread create failed." );  
    if( pthread_create( &consumer2 , NULL, consumerr2 ,  
                NULL ) != 0 )  
        printf( "thread create failed." );  


//等待线程结束  
    if( pthread_join( producter1 , NULL ) != 0 )  
        printf( " wait thread failed.");  
    if( pthread_join( producter2 , NULL ) != 0 )  
        printf( " wait thread failed.");  
            if( pthread_join( consumer1 , NULL ) != 0 )  
        printf( " wait thread failed.");  
    if( pthread_join( consumer2 , NULL ) != 0 )  
        printf( " wait thread failed."); 
      sem_destroy (&full1);               //释放同步量
      sem_destroy(&empty1);            //释放同步量
      sem_destroy (&full2);               //释放同步量
      sem_destroy(&empty2);            //释放同步量
      sem_destroy(&empty3);
      sem_destroy(&full3);
    sem_destroy(&empty4);
      sem_destroy(&full4);
    pthread_mutex_destroy( &mutex1 );        //关闭互斥量  
    //pthread_mutex_destroy( &mutex2 );        //关闭互斥量  
    return 0;  
}

