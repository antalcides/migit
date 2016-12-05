function factorial1(n)
    if(n == 0 || n == 1)
    resultado = 1
    elseif(n > 1)
    resultado = n * factorial(n-1)
    end
  return resultado
end
# si n>13 hay que usar la funcion de la forma factorial1(BigInt("15"))
