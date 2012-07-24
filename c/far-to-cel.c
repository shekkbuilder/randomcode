#include <stdio.h>
main()
{
int far, cel;
int upper, lower, step;
lower = 0;
upper = 300;
step = 20;
far = lower;
while ( far <= upper )
{
cel=5*(far - 32)/9;
printf("%d\t%d\n",far,cel);
far = far + step;
}
}
