using PyPlot
ts_length = 100
epsilon_values = Array(Float64, ts_length)
i = 1
while true
    epsilon_values[i] = randn()
    i = i + 1
    if i == ts_length
        break
    end
end
plot(epsilon_values, "b-")

