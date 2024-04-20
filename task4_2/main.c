#define _POSIX_C_SOURCE 199309L

#include <sys/time.h>
#include <time.h>

#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

// {n > 1}
#ifndef NMAX
#error NMAX not defined
#endif

// {no transpose, with transpose}
#if DP == 0
#define DOT_PRODUCT dotproduct0
#elif DP == 1
#define DOT_PRODUCT dotproduct1
#else
#error DOT_PRODUCT not defined
#endif

typedef double matrix_t[NMAX][NMAX];

void transpose(matrix_t m, size_t n);
void init(matrix_t m, size_t n);
unsigned long long timeit_clock_gettime(void);

void dotproduct0(matrix_t a, matrix_t b, matrix_t c, size_t n);
void dotproduct1(matrix_t a, matrix_t b, matrix_t c, size_t n);

matrix_t a, b, c;
size_t len = NMAX;

int main(void)
{
    assert(len > 1);

    unsigned long long beg, end;
    int REPEAT = 10;
    unsigned long long sum = 0;

    init(a, len);
    init(b, len);

    // timeit_clock_gettime
    for (int i = 0; i < REPEAT; i++)
    {
        beg = timeit_clock_gettime();
        DOT_PRODUCT(a, b, c, len);
        end = timeit_clock_gettime();
        sum += end - beg;
    }

    printf("%llu\n", sum / REPEAT);

    a[0][0] = a[0][1];
    a[0][1] = a[1][1];

    b[0][0] = b[0][1];
    b[0][1] = b[1][1];

    c[0][0] = c[0][1];
    c[0][1] = c[1][1];

    return 0;
}

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

void dotproduct0(matrix_t a, matrix_t b, matrix_t c, size_t n)
{
    for (size_t i = 0; i < n; i++)
        for (size_t j = 0; j < n; j++)
        {
            c[i][j] = 0.0;
            for (size_t k = 0; k < n; k++)
                c[i][j] += a[i][k] * b[k][j];
        }
}

void dotproduct1(matrix_t a, matrix_t b, matrix_t c, size_t n)
{
    transpose(b, n);
    for (size_t i = 0; i < n; i++)
        for (size_t j = 0; j < n; j++)
        {
            c[i][j] = 0.0;
            for (size_t k = 0; k < n; k++)
                c[i][j] += a[i][k] * b[j][k];
        }
    transpose(b, n);
}

void init(matrix_t m, size_t n)
{
    for (size_t i = 0; i < n; i++)
        for (size_t j = 0; j < n; j++)
            m[i][j] = sin(i + j + cos(i));
}

void transpose(matrix_t m, size_t n)
{
    for (size_t i = 0; i < n; i++)
        for (size_t j = i + 1; j < n; j++)
        {
            double buf = m[i][j];
            m[i][j] = m[j][i];
            m[j][i] = buf;
        }
}