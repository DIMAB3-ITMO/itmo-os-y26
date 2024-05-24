import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('csvs/process_info.csv')

iterations = range(1, len(df) + 1)

max_time = df['time']
cpu = df['cpu']
mem = df['mem']
virt = df['virt']

fig, (ax1, ax2, ax3) = plt.subplots(nrows=3, ncols=1, figsize=(10, 8))

ax1.plot(iterations, mem, label='Mem')
ax1.set_xlabel('Iterations')
ax1.set_ylabel('Memory (MB)')
ax1.set_title('Mem usage over time')
ax1.legend()
ax1.grid(True)

ax2.plot(iterations, cpu, label='CPU')
ax2.set_xlabel('Iterations')
ax2.set_ylabel('CPU Usage (%)')
ax2.set_title('CPU Usage Over Time')
ax2.legend()
ax2.grid(True)

ax3.plot(iterations, virt, label='Virt')
ax3.set_xlabel('Iterations')
ax3.set_ylabel('Memory(MB)')
ax3.set_title('Virual Memory usage over time')
ax3.legend()
ax3.grid(True)

plt.subplots_adjust(hspace=0.5)

plt.savefig('pictures/mem_virt_cpu.png')

plt.tight_layout()