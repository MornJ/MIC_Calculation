/*
 * =====================================================================================
 *
 *       Filename:  server.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  08/01/16 14:43:10
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
int main(int argc, char **argv){
    int epd;
    int newepd;
    int err = 0;
    int req_pn = 3010;
    int con_pn;
    int backlog = 16;
    struct scif_portID portID;
    int i, num_loops = 0, total_loop = 10;
    char* senddata;
    char* recvdata;
    int msg_size;
    int block;
    if (argc != 3){
        exit(1);
    }
    msg_size = atoi(argv[1]);
    block = atoi(argv[2]);
    portID.node = 2;
    portID.port = 3000;
    if ((epd = scif_open()) < 0){
        printf("scif_open fialed with error %d\n", errno);
        exit(1);
    }
    printf("scif_bind to port %d\n",req_pn);
    if ((con_pn = scif_bind(epd, req_pn)) < 0){
        printf("scif_bind failed with erro %d\n", errno);
        exit(2);
    }
    printf("scif_listen with backlog of 16\n");
    if ((scif_listen(epd, backlog)) < 0){
        printf("scif_listen faield with error %d\n", errno);
        exit(3);
    }
    printf("scif_accept in syncronous model\n");
    if (((scif_accept(epd, &portID, &newepd, SCIF_ACCEPT_SYNC))<0) && (errno != EAGAIN)){
        printf("scif_accept failed with errno %d\n", errno);
        exit(4);
    }
    printf("scif_accept complete\n");
    printf("node = %d, port = %d\n", portID.node, portID.port);
    while (num_loops < total_loop) {
        recvdata = (char*) malloc(msg_size);
        if (!recvdata){
            free(senddata);
            perror("malloc failed");
            err = ENOMEM;
        }
        memset(recvdata, 0x00, msg_size);
        err = 0;
        while ((err = scif_recv(newepd, recvdata, msg_size, block)) <= 0){
            if (err < 0){
                printf("scif_recv failed err %d\n", errno);
                fflush(stdout);
                free(senddata);
                free(recvdata);
                goto close;
            }
        }
        printf("err = %d\n", err);
        err = 0;
        free(recvdata);
        num_loops++;
    }
close:
    printf("Connection is complete\n");
    fflush(stdout);
    scif_close(newepd);
    fflush(stdout);
    if (!err){
        printf("Test success\n");
    }else 
        printf("Test failed\n");
    scif_close(epd);
    return(err);

}
