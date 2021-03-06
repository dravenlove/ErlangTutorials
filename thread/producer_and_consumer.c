
#include <stdio.h>  
#include <pthread.h>  
#include <semaphore.h>
#include <windows.h>

sem_t empty,full;                //定义全局同步信号量empty，full
pthread_mutex_t mutex;          //定义一个全局互斥量，在不同函数中  
int buffer_count=0;             //定义一个全局变量，表示管道内得产品数目  
  
void *producer( void *arg );    //生产者线程  
void *consumer( void *arg );    //消费者线程  
  
int main(int argc , char *argv[]){  
    pthread_t thrd_prod , thrd_cons;  
  
    pthread_mutex_init( &mutex , NULL );    //初始化互斥量  
      sem_init (&empty, 0, 5);            //初始化empty信号量
    sem_init (&full, 0, 0);            //初始化full信号量
    //创建生产者和消费者线程  
    if( pthread_create( &thrd_prod , NULL, producer ,  
                NULL ) != 0 )  
        printf( "thread create failed." ); 
    if( pthread_create( &thrd_cons , NULL, consumer ,  
                NULL ) != 0 )  
        printf( "thread create failed." );  
  
    //等待线程结束  
    if( pthread_join( thrd_prod , NULL ) != 0 )  
        printf( " wait thread failed.");  
    if( pthread_join( thrd_cons , NULL ) != 0 )  
        printf( " wait thread failed.");  
      sem_destroy (&full);               //释放同步量
      sem_destroy(&empty);            //释放同步量
    pthread_mutex_destroy( &mutex );        //关闭互斥量  
    return 0;  
}  
  
void *producer( void *arg){  
    while(1){  
        Sleep(1);
        sem_wait(&empty);  //empty-1 
        pthread_mutex_lock( &mutex );   //加锁  
        //成功占有互斥量，接下来可以对缓冲区（仓库）进行生产  
        //操作  
        scanf("producer1:%d", &buffer_count);/////////////////////////////////
        printf( "producer1: %d, &buffer_count"); 
        pthread_mutex_unlock( &mutex ); //解锁
        sem_post(&full);          //full+1 
    }  
}  
void *consumer( void *arg ){  
    while(1)
        {
        Sleep(1);
        sem_wait(&full); //full-1
        pthread_mutex_lock( &mutex );   //加锁  
        //成功占有互斥量，接下来可以对缓冲区（仓库）进行取出  
        //操作  
        printf("producer2:the buffer_count is %d\n",buffer_count) ;
        pthread_mutex_unlock( &mutex ); //解锁  
        sem_post(&empty);        //empty-1 
      }
}