#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int monthwoffset(int, int, int);
extern int monthlen(int, int);
extern int mk1cal(int, int, char *);


#define IW          (7)
#define CW          (3)
#define OW          (21)
#define OH          (6)
#define MAX_CANVAS  (OW*OH)

char canvas[MAX_CANVAS];

void
printcal(void)
{
    int i, j;
    for(i=0;i<MAX_CANVAS;i++) {
        if(canvas[i]) {
            printf("%c", canvas[i]);
        }
        if(i%OW==OW-1) {
            printf("\n");
        }
    }
}

int main(int argc, char *argv[])
{
    int y;  //year
    int m;  //month
    if(argc==3) {
        y = atoi(argv[1]);
        m = atoi(argv[2]);
    }
    else {
        printf("usage: %s y m              - one month\n",
            argv[0]);
        exit(9);
    }
    
    memset(canvas, ' ', sizeof(canvas));
    mk1cal(y, m, canvas);
    printcal();
    exit(0);
}
