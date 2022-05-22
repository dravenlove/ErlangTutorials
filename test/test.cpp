
#include <unistd.h>
#include <windows.h>
#include <cstdlib>
#include <condition_variable>
#include <iostream>
#include <mutex>
#include <thread>

static const int kItemRepositorySize  = 4; // Item buffer size.
static const int kItemsToProduce  = 10;   // How many items we plan to produce.

struct ItemRepository {                   //声明结构体
    int item_buffer[kItemRepositorySize]; //项目缓存区[数组大小]配合写入和读取位置组成环形队列
    size_t read_position;                 //数据大小(0~2^64) 读取位置
    size_t write_position;                //写入位置
    size_t produced_item_counter;         //生产者项目计数器
    size_t consumed_item_counter;         //消费者项目计数器
    std::mutex mtx;                       //全局互斥锁,保护项目缓冲区
    std::mutex produced_item_counter_mtx; 
    std::mutex consumed_item_counter_mtx; 
    std::condition_variable repo_not_full;//全局条件变量,一种同步机制, 要和mutex以及lock一起,产品缓冲区不为满
    std::condition_variable repo_not_empty; //产品缓冲区不为空
} gItemRepository;//                          //声明结构体的时候直接创建一个结构体对象,项目库全局变量,生产者和消费者操作这个变量

typedef struct ItemRepository ItemRepository;//声明为ItemRepository取名为ItemRepository


void ProduceItem(ItemRepository *ir, int item)//函数写入项目(传入对象ir,写入的项目)
{
    std::unique_lock<std::mutex> lock(ir->mtx);//上互斥锁
    while(((ir->write_position + 1) % kItemRepositorySize)
        == ir->read_position) { //判断ir对象的缓存区是不是满了,如果满了执行以下语句
        std::cout << "Producer is waiting for an empty slot...\n";//输出生产者等待空的位置存入
        (ir->repo_not_full).wait(lock);//堵塞当前进程,生产者等待"项目库缓冲区不为空
    }

    (ir->item_buffer)[ir->write_position] = item;//缓冲区的写入位置变为item
    (ir->write_position)++;                      //缓冲区写入位置加1

    if (ir->write_position == kItemRepositorySize)//判断写入位置是不是4,如果是4将写入位置赋值为0
        ir->write_position = 0;

    (ir->repo_not_empty).notify_all();            //唤醒所有进程(通知消费者,项目库不为空)
    lock.unlock();                                //解锁
}

int ConsumeItem(ItemRepository *ir)//函数读取项目
{
    int data=0;                     //初始化date为0
    std::unique_lock<std::mutex> lock(ir->mtx);//上互斥锁
    // item buffer is empty, just wait here.
    while(ir->write_position == ir->read_position) {//当读取位置和写入位置相等时说明项目缓冲区已经空了(当项目缓冲区空了)
        std::cout << "Consumer is waiting for items...\n";//输出消费者等待项目
        (ir->repo_not_empty).wait(lock);//堵塞当前进程,消费者等待项目缓冲区不为空
    }

    data = (ir->item_buffer)[ir->read_position];//将缓冲区的读取项目位置的项目赋值给项目变量
    (ir->read_position)++;//读取位置+1

    if (ir->read_position >= kItemRepositorySize)//如果读取位置大于或等于缓冲区最大大小将其归位为0
        ir->read_position = 0;

    (ir->repo_not_full).notify_all();//通知全部进程项目缓冲区不是满的
    lock.unlock();//解锁

    return data;//返回读取数据
}

void ProducerTask()//生产者任务
{
    bool ready_to_exit = false;
    while(1) {//一旦到这里程序就一直循环括号里面的代码
        Sleep(1000);//程序在这里停止1ms
        std::unique_lock<std::mutex> lock(gItemRepository.produced_item_counter_mtx);//上互斥锁
        if (gItemRepository.produced_item_counter < kItemsToProduce) {//如果生产者项目计数器小于目标项目生产数量
            ++(gItemRepository.produced_item_counter);//给生产者项目计数器+1
            ProduceItem(&gItemRepository, gItemRepository.produced_item_counter);//将生产者的项目计数器写入到对象中
            std::cout << "Producer thread " << std::this_thread::get_id()
                << " is producing the " << gItemRepository.produced_item_counter
                << "^th item" << std::endl;//输出生产者进程"%ID"正在生产第"N"个项目
        } else ready_to_exit = true;//如果生产者项目计数器大于目标项目生产数量,将准备离开置于true
        lock.unlock();//解锁
        if (ready_to_exit == true) break;//如果准备离开为真,跳出死循环
    }
    std::cout << "Producer thread " << std::this_thread::get_id()//输出生产者进程ID已经离开
                << " is exiting..." << std::endl;
}

void ConsumerTask()//消费者任务
{
    bool ready_to_exit = false;
    while(1) {
        Sleep(1000);
        std::unique_lock<std::mutex> lock(gItemRepository.consumed_item_counter_mtx);
        if (gItemRepository.consumed_item_counter < kItemsToProduce) {
            int item = ConsumeItem(&gItemRepository);//给变量项目赋值为读取数据
            ++(gItemRepository.consumed_item_counter);
            std::cout << "Consumer thread " << std::this_thread::get_id()
                << " is consuming the " << item << "^th item" << std::endl;//输入消费者进程"ID"正在读取第N个项目
        } else ready_to_exit = true;//
        lock.unlock();
        if (ready_to_exit == true) break;
    }
    std::cout << "Consumer thread " << std::this_thread::get_id()
                << " is exiting..." << std::endl;//这个消费进程正在结束
}

void InitItemRepository(ItemRepository *ir)//初始化项目仓库 
{
    ir->write_position = 0;                //初始化写入位置
    ir->read_position = 0;
    ir->produced_item_counter = 0;
    ir->consumed_item_counter = 0;
}

int main()
{
    
    InitItemRepository(&gItemRepository);
    std::thread producer1(ProducerTask);        //创建进程
    std::thread producer2(ProducerTask);
    std::thread producer3(ProducerTask);
    std::thread producer4(ProducerTask);

    std::thread consumer1(ConsumerTask);
    std::thread consumer2(ConsumerTask);
    std::thread consumer3(ConsumerTask);
    std::thread consumer4(ConsumerTask);

    producer1.join();                           //调用了join函数的线程对象必须等线程对象的方法执行完后才返回,指等到这个对象的函数执行完全才进行下一段代码
    producer2.join();
    producer3.join();
    producer4.join();

    consumer1.join();
    consumer2.join();
    consumer3.join();
    consumer4.join();
}