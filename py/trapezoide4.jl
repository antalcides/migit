function trapz{T<:Number}(x::ArrayT, y::ArrayT)
local n = length(x)
if length(y) != n
error("Vectors ’x’, ’y’ must be of same length")
end
r = zero(T)
if n == 1 return r end
for i in 2:n
@inbounds r += (x[i] - x[i-1]) * (y[i] + y[i-1])
end
r / 2
end
 @time [trapz(x, y) for i in 1:1000];
