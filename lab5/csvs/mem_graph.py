import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('mem.csv')

total = df['total']
free = df['free']
used = df['used']
buff = df['buff']

plt.figure(figsize=(10, 6))
plt.plot(dates, total, label='Total')
plt.plot(dates, free, label='Free')
plt.plot(dates, used, label='Used')
plt.plot(dates, buff, label='Buff')
plt.xlabel('Dates')
plt.ylabel('Memory (MB)')
plt.title('Memory Usage Over Time')
plt.legend()
plt.grid(True)
plt.show()
