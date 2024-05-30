import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def mem_graph(filename): # csvs/mem.csv
    df = pd.read_csv(filename)

    iterations = np.arange(1.0, len(df) + 1, dtype=float)

    free = df['free']
    used = df['used']

    plt.figure(figsize=(10, 6))
    plt.plot(iterations, free, label='Free')
    plt.plot(iterations, used, label='Used')
    plt.xlabel('Iterations')
    plt.ylabel('Memory (MB)')
    plt.title('Memory Usage Over Time')
    plt.legend()
    plt.grid(True)
    plt.savefig('pictures/mem_free_used')
    plt.tight_layout()

def process_mem(filename): # csvs/process_info.csv
    df = pd.read_csv(filename)

    iterations = range(1, len(df) + 1)

    mem = df['mem']

    plt.figure(figsize=(10, 6))
    plt.plot(iterations, mem, label='mem', linestyle='-')
    plt.xlabel('Iterations')
    plt.ylabel('Memory (MB)')
    plt.title('Memory Usage Over Time')
    plt.legend()
    plt.grid(True)
    plt.savefig('pictures/process_mem.png')
    plt.tight_layout()
    plt.show()

def process_virt(filename): # csvs/process_info.csv
    df = pd.read_csv(filename)

    iterations = range(1, len(df) + 1)

    virt = df['virt']

    plt.figure(figsize=(10, 6))
    plt.plot(iterations, virt, label='virt')
    plt.xlabel('Iterations')
    plt.ylabel('Memory (MB)')
    plt.title('Virtual Memory Usage Over Time')
    plt.legend()
    plt.grid(True)
    plt.savefig('pictures/process_virt')
    plt.tight_layout()

def swap_graph(filename): # csvs/swap.csv
    df = pd.read_csv(filename)

    iterations = range(1, len(df) + 1)

    free = df['free']
    used = df['used']

    plt.figure(figsize=(10, 6))
    plt.plot(iterations, free, label='Free')
    plt.plot(iterations, used, label='Used')
    plt.xlabel('Iterations')
    plt.ylabel('Swap Memory (MB)')
    plt.title('Swap Memory Usage Over Time')
    plt.legend()
    plt.grid(True)
    plt.savefig('pictures/swap_free_used')
    plt.tight_layout()

def top5_graph(filename): # csvs/top5.csv
    df = pd.read_csv(filename)

    iterations = range(1, len(df) + 1)

    first_mem = df['first_mem']
    second_mem = df['second_mem']
    third_mem = df['third_mem']
    fourth_mem = df['fourth_mem']
    fifth_mem = df['fifth_mem']

    fig, (ax1, ax2, ax3, ax4, ax5) = plt.subplots(nrows=5, ncols=1, figsize=(10, 15))
    fig.suptitle('Mem distribution on first 5 process for whole experiment')
    plt.xlabel('Iterations')
    plt.ylabel('Memory (MB)')

    ax1.plot(iterations, first_mem, label='first_process')
    ax1.legend()
    ax1.grid(True)

    ax2.plot(iterations, second_mem, label='second_process')
    ax2.legend()
    ax2.grid(True)

    ax3.plot(iterations, third_mem, label='third_process')
    ax3.legend()
    ax3.grid(True)

    ax4.plot(iterations, fourth_mem, label='fourth_process')
    ax4.legend()
    ax4.grid(True)

    ax5.plot(iterations, fifth_mem, label='fifth_process')
    ax5.legend()
    ax5.grid(True)

    plt.tight_layout()
    plt.savefig('pictures/top5_info')
    plt.show()

mem_graph('csvs/1mem.csv')
#mem_graph('csvs/2mem.csv')

process_mem('csvs/1process_info.csv')
#process_mem('csvs/2process_info.csv')

swap_graph('csvs/1swap.csv')
#swap_graph('csvs/2swap.csv')

top5_graph('csvs/1top5.csv')
#top5_graph('csvs/2top5.csv')