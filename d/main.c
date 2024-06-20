#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int mk1cal(int, int, char*, int);


#define IW          (7)
#define CW          (3)
#define OW          (21)
#define OH          (6)
#define MAX_CANVAS  (OW*OH)

void
printcal(char *canvas, int n)
{
    int i, j;
    for(i=0;i<MAX_CANVAS * n;i++) {
        if(canvas[i]) {
            printf("%c", canvas[i]);
        }
        if(i%OW==OW-1) {
            printf("\n");
        }
    }
}

int
main(int argc, char *argv[])
{
    int y1, y2;
    int m1, m2;
    int n;

    if(argc==5) {
        y1 = atoi(argv[1]);
        m1 = atoi(argv[2]);
        y2 = atoi(argv[3]);
        m2 = atoi(argv[4]);
        n = (y2 - y1) * 12 + (m2 - m1) + 1;
    }
    else {
        printf("usage: %s y m              - one month\n",
            argv[0]);
        exit(9);
    }
    char canvas[MAX_CANVAS*n];
    memset(canvas, ' ', sizeof(canvas));
    mk1cal(y1, m1, canvas, n);
    printcal(canvas, n);
    exit(0);
}
