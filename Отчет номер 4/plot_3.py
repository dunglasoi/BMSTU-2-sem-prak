import matplotlib.pyplot as plt
import os

if __name__ == "__main__":
    fig, ax = plt.subplots()

    files = os.listdir("./postproc_data/")
    for file in files:
        if not file.startswith("data_O2_"):
            continue

        # read data
        data = []
        with open(f"./postproc_data/{file}", "r") as f:
            data = [[float(num) for num in line.split(' ')] for line in f]

        # get x
        x = [row[0] for row in data]

        # get y
        y = [row[1] for row in data]
        y_max = [row[2]-row[1] for row in data]
        y_min = [row[1]-row[3] for row in data]

        ax.errorbar(x, y, yerr=(y_min, y_max),
                    label=f'{file}', marker='o', capsize=3, capthick=3)

    ax.set_xlabel("Amount of elements")
    ax.set_ylabel("Time")
    ax.set_title("Graph 3")
    ax.legend()
    ax.grid(True)
    plt.savefig("./graph/plot_3.svg")
    plt.show()
