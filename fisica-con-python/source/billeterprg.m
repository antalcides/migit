% ICM00794-Fundamentos de Computación - FCNM-ESPOL
% 3ra Evaluación 2009. Tema 2.Billetes de cajero automático
% Propuesta programa. edelros@espol.edu.ec.
cantidad=input('Cantidad solicitada: ');
% Procedimiento
billete50=fix(cantidad/50);
saldo=cantidad-50*(billete50);
billete20=fix(saldo/20);
saldo=saldo-20*(billete20);
billete10=fix(saldo/10);
saldo=saldo-10*(billete10);
billete05=fix(saldo/05);
billete01=saldo-05*(billete05);
% Salida
fprintf('billetes 50: %d\n',billete50);
fprintf('billetes 20: %d\n',billete20);
fprintf('billetes 10: %d\n',billete10);
fprintf('billetes 05: %d\n',billete05);
fprintf('billetes 01: %d\n',billete01);
