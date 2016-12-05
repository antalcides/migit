# Learn about API authentication here: https://plot.ly/julia/getting-started
# Find your api_key here: https://plot.ly/settings/api

using Plotly

x = randn(500)


data = [
  [
    "x" => x,
    "type" => "histogram"
  ]
]
response = Plotly.plot(data, ["filename" => "basic-histogram", "fileopt" => "overwrite"])
plot_url = response["url"]

