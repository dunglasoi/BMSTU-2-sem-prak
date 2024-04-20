#include <stdio.h>

#pragma pack(1)
struct test
{
    short a;
    int b;
    char c;
};

int main(void)
{
    struct test t1;
    printf("a %p %p\n", (void *)&t1.a, (char *)&t1.a + sizeof(t1.a));
    printf("b %p %p\n", (void *)&t1.b, (char *)&t1.b + sizeof(t1.b));
    printf("c %p %p\n", (void *)&t1.c, (char *)&t1.c + sizeof(t1.c));
    printf("sizeof t1: %zu\n", sizeof(t1));
    printf("t1 %p %p\n", (void*) &t1, (char*) &t1 + sizeof(t1));
    return 0;
}