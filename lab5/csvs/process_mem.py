import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('csvs/process_info.csv')

iterations = range(1, len(df) + 1)

mem = df['cpu']

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