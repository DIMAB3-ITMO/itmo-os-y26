import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('csvs/process_info.csv')

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
