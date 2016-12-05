using PyPlot
ts_length = 100
epsilon_values = Array(Float64, ts_length)
i = 1
while i <= ts_length
    epsilon_values[i] = randn()
    i = i + 1
end
plot(epsilon_values, "b-")
