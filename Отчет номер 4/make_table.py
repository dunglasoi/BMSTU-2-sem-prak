import os
import pandas as pd
from numpy import log


def table_1():
    data = pd.DataFrame({'n': [x for x in range(500, 10001, 500)]})
    columns = ['n', 'mean', 'max', 'min', 'quan_1', 'median', 'quan_3', 'rrse']

    files = os.listdir("./postproc_data/")
    for file in files:
        if not file.startswith("data_sorted_"):
            continue

        prefix = file[5:-4]
        df = pd.read_csv(
            f"./postproc_data/{file}", sep=" ", header=None, usecols=[1, 7],
            names=[f"{prefix}: {x}" for x in columns])

        data = pd.concat([data, df], axis=1)

    data.to_excel("./graph/plot_1.xlsx")


def table_2():
    data = pd.DataFrame({'n': [x for x in range(500, 10001, 500)]})
    columns = ['n', 'mean', 'max', 'min', 'quan_1', 'median', 'quan_3', 'rrse']

    files = os.listdir("./postproc_data/")
    for file in files:
        if not file.startswith("data_random_"):
            continue

        prefix = file[5:-4]
        df = pd.read_csv(
            f"./postproc_data/{file}", sep=" ", header=None, usecols=[1, 7],
            names=[f"{prefix}: {x}" for x in columns])

        data = pd.concat([data, df], axis=1)

    data.to_excel("./graph/plot_2.xlsx")


def table_3():
    data = pd.DataFrame({'n': [x for x in range(500, 10001, 500)]})
    columns = ['n', 'mean', 'max', 'min', 'quan_1', 'median', 'quan_3', 'rrse']

    files = os.listdir("./postproc_data/")
    for file in files:
        if not file.startswith("data_O2_"):
            continue

        prefix = file[5:-4]
        df = pd.read_csv(
            f"./postproc_data/{file}", sep=" ", header=None, usecols=[1, 2, 3],
            names=[f"{prefix}: {x}" for x in columns])

        data = pd.concat([data, df], axis=1)

    data.to_excel("./graph/plot_3.xlsx")


def table_4():
    data = pd.DataFrame({'n': [x for x in range(500, 10001, 500)]})
    columns = ['n', 'mean', 'max', 'min', 'quan_1', 'median', 'quan_3', 'rrse']

    files = os.listdir("./postproc_data/")
    for file in files:
        if not file.startswith("data_a_O2_"):
            continue

        prefix = file[5:-4]
        df = pd.read_csv(
            f"./postproc_data/{file}", sep=" ", header=None, usecols=[1, 2, 3, 4, 5, 6],
            names=[f"{prefix}: {x}" for x in columns])

        data = pd.concat([data, df], axis=1)

    data.to_excel("./graph/plot_4.xlsx")


def table_5():
    data = pd.DataFrame({'n': [x for x in range(500, 10001, 500)]})
    columns = ['n', 'mean', 'max', 'min', 'quan_1', 'median', 'quan_3', 'rrse']

    files = os.listdir("./postproc_data/")
    for file in files:
        if not file.startswith("data_a_O2_"):
            continue

        prefix = file[5:-4]
        df = pd.read_csv(
            f"./postproc_data/{file}", sep=" ", header=None, usecols=[1],
            names=[f"{prefix}: {x}" for x in columns])

        data = pd.concat([data, df], axis=1)

        col = f"{prefix}: mean"
        data[f"{prefix}: ln"] = (log(data[col]) - log(data[col].shift(-1))) /\
            (log(data['n']) - log(data['n'].shift(-1)))

    data.to_excel("./graph/plot_5.xlsx")


if __name__ == "__main__":
    table_1()
    table_2()
    table_3()
    table_4()
    table_5()
