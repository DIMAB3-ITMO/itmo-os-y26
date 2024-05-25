import plotly.express as px
import pandas as pd

# Data from the CSV file
data = {
    'Process': ['first', 'second', 'third', 'fourth', 'fifth'],
    'Memory Usage (%)': [87.5, 0.0, 0.0, 0.0, 0.0]
}

df = pd.DataFrame(data)

# Create a bar chart using Plotly
fig = px.bar(df, x='Process', y='Memory Usage (%)', title='Memory Usage of Processes')
fig.show()
