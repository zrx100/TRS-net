

z = bestPoint(results)
zbest = table2array(z)


[re_n,Tao] = genTao_M(zbest(1)+0.3,0.001,0.2)
x = zeros(re_n,176)
for j = [1:176]
for i = [1:1:re_n]
%syms p;
%x(i,j) = int(dirac(p-Tao(1,i))*exp(-p*time(1,j)),p,Taomin,Taomax);
%x(i,j) = (exp(-Tao(1,i)*time(j,1))- exp(-Tao(1,i+1)*time(j,1)))/time(j,1)
x(i,j) = exp(-Tao(1,i)*time(1,j));
end
end

[re_n1,Tao1] = genTao_M(zbest(1)+0.56,0.001,0.2)
x1 = zeros(re_n1,176)
for j = [1:176]
for i = [1:1:re_n1]
%syms p;
%x(i,j) = int(dirac(p-Tao(1,i))*exp(-p*time(1,j)),p,Taomin,Taomax);
%x(i,j) = (exp(-Tao(1,i)*time(j,1))- exp(-Tao(1,i+1)*time(j,1)))/time(j,1)
x1(i,j) = exp(-Tao1(1,i)*time(1,j));
end
end
 
%%[b,fitinfo] = lasso(x',y','CV',10,'Alpha',1,'RelTol',1e-7); % 参数初始化
%%axTrace = lassoPlot(b,fitinfo); 
%%axCV = lassoPlot(b,fitinfo,'PlotType','CV');
%lam = fitinfo.IndexMinMSE;  % 最小MSE对应lambda
%mat = b(:,lam);             % 最优lambda对应的稀疏系数
%%[row, ] = find(b(:,lam)~=0);% 非零系数对应的行 

mat = lasso2 (x',(sigD(5,:)+0.1)',1,1);
y2 = mat(1:re_n,1)'*x+mat(end);

mat1 = lasso2(x1',(sigD(5,:)+0.1)',1,1)
y3 = mat1(1:re_n1,1)'*x1+mat1(end);
% row = find(mat~=0);
 
subplot(2,1,[1])
plot (time(1,:),sigD(5,:)+0.1);
hold on
plot(time(1,:),y2);

subplot(2,1,[2])
plot(time(1,:),sigD(5,:)+0.1)
hold on
plot(time(1,:),y3)





