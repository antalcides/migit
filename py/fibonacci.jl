function fib(n)
    if( n == 0)
    resultado = 0
    end
    if(n ==1 || n==2)
    resultado = 1
    elseif(n > 2)
    resultado = fib(n-1) + fib(n-2)
    end
  return resultado
end
