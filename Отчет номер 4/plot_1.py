import matplotlib.pyplot as plt
import os

if __name__ == "__main__":
    fig, ax = plt.subplots()

    files = os.listdir("./postproc_data/")
    for file in files:
        if not file.startswith("data_sorted_"):
            continue

        # read data
        data = []
        with open(f"./postproc_data/{file}", "r") as f:
            data = [[float(num) for num in line.split(' ')] for line in f]

        # get x
        x = [row[0] for row in data]

        # get y
        y = [row[1] for row in data]

        ax.plot(x, y, label=f'{file}', marker='o')

    ax.set_xlabel("Amount of elements")
    ax.set_ylabel("Time")
    ax.set_title("Graph 1")
    ax.legend()
    ax.grid(True)
    plt.savefig("./graph/plot_1.svg")
    plt.show()
