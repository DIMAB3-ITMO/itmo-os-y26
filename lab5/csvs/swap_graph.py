import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('csvs/swap.csv')

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
