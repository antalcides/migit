function trapz1(x, y)
local n = length(x)
if length(y) != n
error("Vectors must be of same length")
end
sum((x[2:end]-x[1:end-1]).*(y[2:end]+y[1:end-1]))/2
end
 x = linspace(0, pi, 100); y = sin(x);
 println(trapz1(x, y)); gc()

 @time [trapz1(x, y) for i in 1:1000];
