import sys
import math

if __name__ == "__main__":
    # read data
    f = open(sys.argv[1], "r")
    data = f.read().splitlines()
    data = [float(i) for i in data]
    f.close()

    # calculate stats
    n = len(data)
    s_mean = sum(data) / n
    s_max = max(data)
    s_min = min(data)
    sorted_data = sorted(data)
    s_quan = [
        sorted_data[int(n * p / 100)]
        for p in [25, 50, 75]
    ]

    # calculate standard deviation manually
    s_sum_sq_diff = sum((x - s_mean) ** 2 for x in data)
    s_variance = s_sum_sq_diff / n
    s_std_dev = math.sqrt(s_variance)
    
    s_rrse = s_std_dev / s_mean * 100

    # write data
    f = open(sys.argv[2], "a")
    f.write(
        "{:.2f} {:.2f} {:.2f} {:.2f} {:.2f} {:.2f} {:.2f}\n".format(
            s_mean, s_max, s_min, s_quan[0], s_quan[1], s_quan[2], s_rrse
        )
    )
    f.close()
