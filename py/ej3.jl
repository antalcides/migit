using PyPlot
ts_length = 100
epsilon_values = Array(Float64, ts_length)
for i in 1:ts_length
    epsilon_values[i] = randn()
end
plot(epsilon_values, "b-")
