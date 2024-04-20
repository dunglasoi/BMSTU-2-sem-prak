import sys
from statistics import mean, quantiles, stdev

if __name__ == "__main__":
    # read data
    with open(sys.argv[1], "r") as f:
        data = f.read().splitlines()
    data = [float(i) for i in data]

    # calculate stats
    s_mean = mean(data)
    s_max = max(data)
    s_min = min(data)
    s_quan = quantiles(data)
    s_rrse = stdev(data)/s_mean * 100 if s_mean != 0 else s_mean

    # write data
    with open(sys.argv[2], "a") as f:
        f.write(
            f"{s_mean:.2f} {s_max:.2f} {s_min:.2f} {s_quan[0]:.2f} {s_quan[1]:.2f} {s_quan[2]:.2f} {s_rrse:.2f}\n")
