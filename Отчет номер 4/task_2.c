#define _POSIX_C_SOURCE 199309L

#include <time.h>
#include <sys/time.h>

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// {n > 1}
#ifndef NMAX
#error NMAX not defined
#endif

// {sorted, random}
#if INIT == 0
#define INIT_ARRAY init_sorted
#elif INIT == 1
#define INIT_ARRAY init_random
#else
#error INIT array method not defined
#endif

// {a, b, c}
#if ACCESS == 0
#define ACCESS_ARRAY insert_into_sorted_array_a
#elif ACCESS == 1
#define ACCESS_ARRAY insert_into_sorted_array_b
#elif ACCESS == 2
#define ACCESS_ARRAY insert_into_sorted_array_c
#else
#error ACCESS array method not defined
#endif

typedef int array_t[NMAX];
array_t arr;
int len = NMAX;

/**
 * @brief Timeit with clock_gettime
 *
 * @return microsecond
 */
unsigned long long timeit_clock_gettime(void)
{
    struct timespec val;

    if (clock_gettime(CLOCK_REALTIME, &val))
    {
        printf("clock_gettime failed\n");
        return (unsigned long long)-1;
    }

    // nanosecond
    // return val.tv_sec * 1000000000ULL + val.tv_nsec;
    // microsecond
    return val.tv_sec * 1000000ULL + val.tv_nsec / 1000ULL;
    // millisecond
    // return val.tv_sec * 1000ULL + val.tv_nsec / 1000000ULL;
}

/**
 * @brief Вставить элемент в отсортированном массиве
 *
 * Передвигаем элементы больше key на одну позицию вправо.
 * Вставляем key в освободившее место слева.
 *
 * @param key Элемент, который нужно вставить
 * @param a Отсортированный массив
 * @param n До n-ого элемента массив отсортирован
 * @return int
 */
int insert_into_sorted_array_a(int key, int *a, size_t *n)
{
    // использование операции индексации a[i]
    int j = *n - 1;
    while (j >= 0 && a[j] > key)
    {
        a[j + 1] = a[j];
        j -= 1;
    }
    a[j + 1] = key;
    (*n)++;

    return 0;
}

int insert_into_sorted_array_b(int key, int *a, size_t *n)
{
    // использование операции индексации *(a+i)
    int j = *n - 1;
    while (j >= 0 && *(a + j) > key)
    {
        *(a + j + 1) = *(a + j);
        j -= 1;
    }
    *(a + j + 1) = key;
    (*n)++;

    return 0;
}

int insert_into_sorted_array_c(int key, int *a, size_t *n)
{
    // Tìm vị trí chèn key trong mảng a
    size_t i = *n;
    while (i > 0 && a[i - 1] > key)
    {
        a[i] = a[i - 1];
        i--;
    }
    a[i] = key;
    (*n)++;

    return 0;
}


/**
 * @brief Сортировка вставками
 */
int insertion_sort(int *a, size_t n)
{
    size_t i = 1;
    while (i < n)
    {
        ACCESS_ARRAY(a[i], a, &i);
    }

    return 0;
}

int init_sorted(array_t arr, int n)
{
    for (int i = 0; i < n; i++)
        arr[i] = i;
    return 0;
}

int init_random(array_t arr, int n)
{
    // random number [0;1000]
    for (int i = 0; i < n; i++)
        arr[i] = rand() % 1000;
    return 0;
}

int main(void)
{
    assert(len > 1);

    unsigned long long beg, end;
    int REPEAT = 10;
    unsigned long long sum = 0;

    // timeit_clock_gettime
    for (int i = 0; i < REPEAT; i++)
    {
        INIT_ARRAY(arr, len);
        beg = timeit_clock_gettime();
        insertion_sort(arr, len);
        end = timeit_clock_gettime();
        sum += end - beg;
    }

    printf("%llu\n", sum / REPEAT);

    // no optimization
    arr[0] = arr[1];
    arr[1] = 1234;

    return 0;
}