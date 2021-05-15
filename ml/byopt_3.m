
load('2DGP_T.mat')
for i = [1:1000]
load ionosphere
rng default
omega = optimizableVariable('omega',[15,32],'Type','real');
% theta = optimizableVariable('theta',[0.95,1],'Type','real')
initial = optimizableVariable('initial',[0.001,0.01],'Type','real')
lamda = optimizableVariable('lamda',[0.9,1],'Type','real')
fun = @(X)lassoloss3(X,time(1,21:200),intensity(i,:)+0.1);
results = bayesopt(fun,[omega,initial,lamda],'Verbose',0,...
    'AcquisitionFunctionName','expected-improvement-plus','PlotFcn',[],'NumSeedPoints',...
    40,'MaxObjectiveEvaluations',40)

re_n = 45
z = bestPoint(results)
zbest(i,:) = table2array(z)
Tao(i,:) = genTao(zbest(i,1),zbest(i,2),re_n);

for j = [21:1:200]
for k = [1:1:re_n]
%syms p;
%x(i,j) = int(dirac(p-Tao(1,i))*exp(-p*time(1,j)),p,Taomin,Taomax);
%x(i,j) = (exp(-Tao(1,i)*time(j,1))- exp(-Tao(1,i+1)*time(j,1)))/time(j,1)
x(k,j-20) = exp(-Tao(1,k)*time(1,j));
end
end

%%[b,fitinfo] = lasso(x',y','CV',10,'Alpha',1,'RelTol',1e-7); % 参数初始化
%%axTrace = lassoPlot(b,fitinfo); 
%%axCV = lassoPlot(b,fitinfo,'PlotType','CV');
%lam = fitinfo.IndexMinMSE;  % 最小MSE对应lambda
%mat = b(:,lam);             % 最优lambda对应的稀疏系数
%%[row, ] = find(b(:,lam)~=0);% 非零系数对应的行 

mat(:,i) = lasso2 (x',(intensity(i,:)+0.1)',zbest(i,3),1);


end

save('results');