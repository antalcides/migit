function x = Secante(f,x,xAnt)

tol = 0.001;

while 1
   xTemp = x;
   fx = feval(f,x);
   fAnt = feval(f,xAnt);
   [x xAnt fx fAnt]
   pause
   x = x - fx*(x-xAnt)/(fx-fAnt)
   xAnt = xTemp;
   if abs(x-xAnt) < tol || fx==0
      break
   end
end