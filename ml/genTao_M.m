function [j,y] = gentao_M(omega,deta_0,deta_n)
j = ceil((omega/pi)*log(deta_n/deta_0));
for i= [2:1:j] 
y(i) =deta_0*exp(i*pi/omega);
end
y(1) = deta_0;
end