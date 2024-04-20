#define _POSIX_C_SOURCE 199309L

#include <time.h>
#include <sys/time.h>
#include <inttypes.h>
#include <x86gprintrin.h>

#include <stdio.h>

#define N_EXP 4 // N experiments

/**
 * @brief Timeit with gettimeofday
 *
 * @return millisecond
 */
unsigned long long timeit_gettimeofday(void)
{
    struct timeval val;

    if (gettimeofday(&val, NULL))
    {
        printf("gettimeofday failed\n");
        return (unsigned long long)-1;
    }

    return val.tv_sec * 1000ULL + val.tv_usec / 1000ULL;
}

/**
 * @brief Timeit with clock_gettime
 *
 * @return millisecond
 */
unsigned long long timeit_clock_gettime(void)
{
    struct timespec val;

    if (clock_gettime(CLOCK_REALTIME, &val))
    {
        printf("clock_gettime failed\n");
        return (unsigned long long)-1;
    }

    return val.tv_sec * 1000ULL + val.tv_nsec / 1000000ULL;
}

/**
 * @brief Timeit with clock
 *
 * @return millisecond
 */
unsigned long long timeit_clock(void)
{
    clock_t val;

    if ((val = clock()) == -1)
    {
        printf("clock failed\n");
        return (unsigned long long)-1;
    }

    return val / CLOCKS_PER_SEC * 1000ULL;
}

/**
 * @brief Timeit with __rdtsc
 *
 * @return tick // TODO return millisecond
 */
unsigned long long timeit_rdtsc(void)
{
    return __rdtsc();
}

int get_cpu_speed(void)
{
    unsigned long long tick_beg, tick_end;
    unsigned long long time_beg, time_end;
    struct timespec val;
    struct timespec req = {0, 100000000};

    clock_gettime(CLOCK_MONOTONIC, &val);
    time_beg = val.tv_sec * 1000ULL + val.tv_nsec / 1000000ULL;
    tick_beg = timeit_rdtsc();

    nanosleep(&req, NULL);

    clock_gettime(CLOCK_MONOTONIC, &val);
    time_end = val.tv_sec * 1000ULL + val.tv_nsec / 1000000ULL;
    tick_end = timeit_rdtsc();

    return (tick_end - tick_beg) / (time_end - time_beg);
}

int main(void)
{
    int cpu_speed = get_cpu_speed();
    // printf("cpu_speed: %d\n", cpu_speed);
    struct timespec req;
    // time in nanosecond: 1s, 100ms, 50ms, 10ms
    long time[N_EXP] = {1000000000, 100000000, 50000000, 10000000};
    // time in second: 1s, 2s, 3s, 5s
    // long time[N_EXP] = {1, 2, 3, 5};

    unsigned long long beg, end;
    int REPEAT = 10;
    unsigned long long sum = 0;

    for (int i = 0; i < N_EXP; i++)
    {
        printf("TIMEIT with nanosleep=%ld\n", time[i]);
        req.tv_nsec = time[i];
        // req.tv_sec = time[i];

        // timeit_gettimeofday
        sum = 0;
        for (int j = 0; j < REPEAT; j++)
        {
            beg = timeit_gettimeofday();
            nanosleep(&req, NULL);
            end = timeit_gettimeofday();
            sum += end - beg;
        }

        printf("timeit_gettimeofday: %llu\n", sum / REPEAT);

        // timeit_clock_gettime
        sum = 0;
        for (int j = 0; j < REPEAT; j++)
        {
            beg = timeit_clock_gettime();
            nanosleep(&req, NULL);
            end = timeit_clock_gettime();
            sum += end - beg;
        }

        printf("timeit_clock_gettime: %llu\n", sum / REPEAT);

        // timeit_clock
        sum = 0;
        for (int j = 0; j < REPEAT; j++)
        {
            beg = timeit_clock();
            nanosleep(&req, NULL);
            end = timeit_clock();
            sum += end - beg;
        }

        printf("timeit_clock: %llu\n", sum / REPEAT);

        // timeit_rdtsc
        sum = 0;
        for (int j = 0; j < REPEAT; j++)
        {
            beg = timeit_rdtsc();
            nanosleep(&req, NULL);
            end = timeit_rdtsc();
            sum += (end - beg) / cpu_speed;
        }

        printf("timeit_rdtsc: %llu\n", sum / REPEAT);

        //
        printf("\n");
    }

    return 0;
}