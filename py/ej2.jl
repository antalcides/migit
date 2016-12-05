using PyPlot
ts_length = 100
epsilon_values = randn(ts_length)
plot(epsilon_values, "b-")
typeof(epsilon_values)
epsilon_values
x = [10, "foo", false]
typeof(x[1])
typeof(x[2])
typeof(x[3])
length(x)
pop!(x)
x
push!(x, "bar")
