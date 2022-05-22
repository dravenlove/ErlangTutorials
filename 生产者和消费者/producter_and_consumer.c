#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

sem_t empty1,full1,empty2,full2,empty3,full3,empty4,full4;
pthread_mutex_t mutex1 ;

void *producer1( void *arg );
void *producer2( void *arg );
void *consumerr1( void *arg );
void *consumerr2( void *arg );

struct thread_info
{
    int thread_id;
    char Type;
    int status;
    int message;
};

struct thread_info produ1,produ2,comsu1,comsu2;



void *producer1( void *arg )
{
    while(1)
    {   sleep(1);
        sem_wait(&empty1);
        pthread_mutex_lock( &mutex1 );
        printf("producer1:input_message1:");
        int message=scanf("%d",&produ1.message);
        int id=1;
        produ1.thread_id=1;
        char Type='p';
        produ1.Type='p';
        int status=1;
        produ1.status=1;
        printf("id=%d \n\r Type=%c \n\r status=%d \n\r ",id,Type,status);
        pthread_mutex_unlock( &mutex1 );
        status=0;
        produ1.status=0;
        printf("id=%d \n\r Type=%c \n\r status=%d \n\r ",id,Type,status);
        sem_post(&full1);

        sem_post(&empty2);

    }
};

void *producer2( void *arg )
{
    while(1)
    {
        sleep(1);
        sem_wait(&empty2);
        pthread_mutex_lock( &mutex1 );
        printf("producer2:input_message2:");
        int message=scanf("%d",&produ2.message);
        int id=2;
        produ2.thread_id=2;
        char Type='p';
        produ2.Type='p';
        int status=1;
        produ2.status=1;
        printf("id=%d \n\r Type=%c \n\r status=%d \n\r",id,Type,status);
        pthread_mutex_unlock( &mutex1 );
        status=0;
        produ2.status=0;
         printf("id=%d \n\r Type=%c \n\r status=%d \n\r",id,Type,status);

        pthread_mutex_unlock( &mutex1 );
        sem_post(&full2);

    }
};

void *consumerr1( void *arg )
{
    while(1)
    {
        sleep(1);
        sem_wait(&full1);
        pthread_mutex_lock( &mutex1 );
        int message=produ1.message;
        printf("consumerr1:ouput_message1:%d\n\r",message);
        int id=3;
        comsu1.thread_id=3;
        char Type='c';
        comsu1.Type='c';
        int status=1;
        comsu1.status=1;
        printf("id=%d \n\r Type=%c \n\r status=%d \n\r",id,Type,status);
        pthread_mutex_unlock( &mutex1 );
        status=0;
        comsu1.status=0;
         printf("id=%d \n\r Type=%c \n\r status=%d \n\r",id,Type,status);
        sem_post(&empty3);


        sem_wait(&empty3);
        printf("consumerr1:input_message2:%d\n\r",message);
        status=1;
        comsu1.message=message;
        printf("id=%d \n\r Type=%c \n\r status=%d \n\r",id,Type,status);

        status=0;
        comsu1.status=0;
        printf("id=%d \n\r Type=%c \n\r status=%d \n\r",id,Type,status);
        pthread_mutex_unlock( &mutex1 );
        sem_post(&full3);


    }
};

void *consumerr2( void *arg )
{
    while(1)
    {
        sleep(1);
        sem_wait(&full2);
        pthread_mutex_lock( &mutex1 );
        int message1=produ2.message;
        printf("consumerr2:ouput_message1:%d\n\r",message1);
        int id=4;
        comsu2.thread_id=4;
        char Type='c';
        comsu2.Type='c';
        int status=1;
        comsu2.status=1;
        printf("id=%d \n\r Type=%c \n\r status=%d \n\r",id,Type,status);
        pthread_mutex_unlock( &mutex1 );

        status=0;
        comsu2.status=status;
         printf("id=%d \n\r Type=%c \n\r status=%d \n\r",id,Type,status);

        sem_wait(&full3);  //empty-1
        pthread_mutex_lock( &mutex1 );
        int message2=comsu1.message;
        printf("consumerr2:ouput_message2:%d \n\r",message2);
        status=1;
        comsu2.status=status;
        printf("id=%d \n\r Type=%c \n\r status=%d \n\r",id,Type,status);
        status=0;
        comsu2.status=status;
        printf("id=%d \n\r Type=%c \n\r status=%d \n\r",id,Type,status);
        pthread_mutex_unlock( &mutex1 );
        sem_post(&empty1);
    }
};


int main(char argc,char* argv[])
{
    pthread_t producter1,producter2,consumer1,consumer2;
    pthread_mutex_init(&mutex1,NULL);
    sem_init (&empty1, 0, 1);
    sem_init (&full1, 0, 0);
    sem_init (&empty2, 0, 0);
    sem_init (&full2, 0, 0);
    sem_init (&empty3, 0, 0);
    sem_init (&full3, 0, 0);
    sem_init (&empty4, 0, 0);
    sem_init (&full4, 0, 0);

    if( pthread_create( &producter1 , NULL, producer1 ,                NULL ) != 0 )
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

    if( pthread_join( producter1 , NULL ) != 0 )
        printf( " wait thread failed.");
    if( pthread_join( producter2 , NULL ) != 0 )
        printf( " wait thread failed.");
            if( pthread_join( consumer1 , NULL ) != 0 )
        printf( " wait thread failed.");
    if( pthread_join( consumer2 , NULL ) != 0 )
        printf( " wait thread failed.");
      sem_destroy (&full1);
      sem_destroy(&empty1);
      sem_destroy (&full2);
      sem_destroy(&empty2);
      sem_destroy(&empty3);
      sem_destroy(&full3);
    sem_destroy(&empty4);
      sem_destroy(&full4);
    pthread_mutex_destroy( &mutex1 );
        return 0;
}
