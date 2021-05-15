function y = gentao(omega,deta0,j);
for i= [2:1:j] 
y(i) =deta0*exp(i*pi/omega);
end
y(1) = deta0;