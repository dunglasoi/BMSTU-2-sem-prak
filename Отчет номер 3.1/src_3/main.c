#include <stdio.h>

int main()
{
    int arr[5] = {6, 7, 8, 9, 10};
    int *ptr = arr; // указатель на начало массива

    printf("Address of arr[0]: %p\n", &arr[0]);
    printf("Value of arr[0]: %d\n\n", arr[0]);

    printf("Address of arr[1]: %p\n", &arr[1]);
    printf("Value of arr[1]: %d\n\n", arr[1]);

    printf("Address of arr[2]: %p\n", &arr[2]);
    printf("Value of arr[2]: %d\n\n", arr[2]);

    printf("Address of arr[3]: %p\n", &arr[3]);
    printf("Value of arr[3]: %d\n\n", arr[3]);

    printf("Address of arr[4]: %p\n", &arr[4]);
    printf("Value of arr[4]: %d\n\n", arr[4]);

    printf("Address of ptr: %p\n", ptr);
    printf("Value of ptr: %d\n\n", *ptr);

    ptr += 2; // сдвиг указателя на 2 элемента вправо

    printf("Address of ptr after addition: %p\n", ptr);
    printf("Value of ptr after addition: %d\n\n", *ptr);

    return 0;
}
