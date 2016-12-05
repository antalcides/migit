function res = combinaciones(s,k)
% Regresa las combinaciones de s tomando k, donde s puede ser no entera
res = 1;
if k==0
   return
end
for i=1:k
   res = res*(s-i+1)/i;
end