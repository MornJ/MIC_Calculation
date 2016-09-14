/*
 * =====================================================================================
 *
 *       Filename:  host.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  08/01/16 14:15:26
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <sys/ioctl.h>
#include <scif.h>
#include <sys/time.h>
#include <vector>
typedef struct msg_t{
    int msg;
    int msgs[2];
}msg;

using namespace std;
int main(int argc, char **argv){
    scif_epd_t epd;
    int err = 0;
    int req_pn = 3000;
    int con_pn;
    struct scif_portID portID;
    int i, num_loops = 0, total_loop = 10;
    char* senddata;
    char* recvdata;
    int msg_size;
    int block;
    int node;
    struct timeval tv, tv1;
    if (argc != 4){
        exit(1);
    }
    msg_size = atoi(argv[1]);
    block = atoi(argv[2]);
    node = atoi(argv[3]);
    portID.node = node;
    portID.port = 3010;
    printf("Ope the scif\n");
    if ((epd = scif_open()) < 0){
        printf("scif_open failed\n");
        exit(1);

    }
    printf("scif_bind to port 11\n");
    if ((con_pn = scif_bind(epd,req_pn)) < 0){
        printf("scif_bind failed with error %d\n",con_pn);
        exit(2);
    }
    printf("req_pn = %d\n",req_pn);
retry:
    if ((scif_connect(epd, &portID)) < 0){
        if (ECONNREFUSED == errno){
            printf("scif_connect failed with error %d retrying\n", errno);
            goto retry;
        }
        printf("scif_connect failed with error %d\n", errno);
        exit(3);
    }
    printf("scif_connect success\n");
    printf("ndoe = %d, port= %d\n", portID.node, portID.port);
    vector< msg> tmp;
    while (num_loops < total_loop){
        msg a;
        a.msg = num_loops;
        a.msgs[0] = num_loops/2;
        a.msgs[1] = num_loops*2;
        senddata = (char *)malloc(msg_size);
        if (!senddata){
            perror("malloc failed");
            err = ENOMEM;
        }
        memset(senddata, 0x25, msg_size);
        err = 0;
        gettimeofday(&tv, 0);
        int length;
        if (err = scif_send(epd, &length, sizeof(length), block) <=0 ){
            if (err < 0){
                printf("scif_send failed with err %d\n", errno);
                fflush(stdout);
                free(senddata);
                goto close;
            }

        }
        while ((err = scif_send(epd, senddata, msg_size, block)) <= 0){
            if (err < 0){
                printf("scif_send failed with err %d\n", errno);
                fflush(stdout);
                free(senddata);
                goto close;
            }
        }
        gettimeofday(&tv1, 0);
        printf("err = %d\n", err);
        printf("total = %f\n", (tv1.tv_sec-tv.tv_sec)*1e6+(tv1.tv_usec-tv.tv_usec));
        err = 0;
        free(senddata);
        num_loops++;

    }
close:
    printf("Close the scif driver\n");
    close(epd);
    if (!err){
        printf("Test success\n");

    }else
        printf("Test failed\n");
    return(err);
}

