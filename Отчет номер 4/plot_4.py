import matplotlib.pyplot as plt
import os

if __name__ == "__main__":
    fig, ax = plt.subplots()

    files = os.listdir("./postproc_data/")
    for file in files:
        if not file.startswith("data_a_O2_"):
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
        quan_2 = [row[5] for row in data]
        quan_1 = [row[5]-row[4] for row in data]
        quan_3 = [row[6]-row[5] for row in data]

        color = next(ax._get_lines.prop_cycler)['color']
        ax.errorbar(x, y, yerr=(y_min, y_max), color=color,
                    label=f'{file}', fmt='o-', capsize=3, capthick=2)

        markers, caps, bars = ax.errorbar(
            x, quan_2, yerr=(quan_1, quan_3), color=color,
            fmt='_', capsize=2, capthick=3, zorder=2.5, elinewidth=5)
        [bar.set_alpha(0.5) for bar in bars]

    ax.set_xlabel("Amount of elements")
    ax.set_ylabel("Time")
    ax.set_title("Graph 4")
    ax.legend()
    ax.grid(True)
    plt.savefig("./graph/plot_4.svg")
    plt.show()
