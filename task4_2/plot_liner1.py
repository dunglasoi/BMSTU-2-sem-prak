import matplotlib.pyplot as plt
import os
import numpy as np
if __name__ == "__main__":
    fig, ax = plt.subplots()
    file_prefix = "data_O"
    data_dir = "./postproc_data/"

    colors = plt.cm.tab20(np.linspace(0, 1, 20))
    markers = ['o', 'x', '*', '+', 's', 'd', 'v', '^', '>', '<', 'p', 'h']


    for i, file in enumerate(os.listdir(data_dir)):
        if not file.startswith(file_prefix):
            continue

        # read data
        data = np.loadtxt(os.path.join(data_dir, file))

        # get x
        x = data[:, 0]

        # get y
        y = data[:, 1]
        color = colors[i % len(colors)]
        marker = markers[i % len(markers)] # выбираем маркер из списка

        ax.plot(x, y, label=f'{file}', marker=marker)

    ax.set_xlabel("Amount of elements")
    ax.set_ylabel("Time")
    ax.set_title("Graph 1")
    ax.legend()
    ax.grid(True)
    plt.savefig("./graph/liner_plot_1.svg")
    plt.show()
