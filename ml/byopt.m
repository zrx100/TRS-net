% clear all
% load('a_00001_10m.mat')
load ionosphere
rng default
% load('2DGP_T.mat')

r = size(sigD,1)
batch_n = floor(r/100)
batch_i = [1:batch_n]*100
m_batch = [batch_i(
% sigD(1,:) = smoothdata(sigD(1,:),'loess')
Tao = cell(1,100)

for i = [1:100]
omega = optimizableVariable('omega',[3,6],'Type','real');
% theta = optimizableVariable('theta',[0.95,1],'Type','real')
initial = optimizableVariable('initial',[0.001,0.01],'Type','real')
% lamda = optimizableVariable('lamda',[0.99,1],'Type','real')
fun = @(X)lassoloss3(X,time,sigD(i,:)+0.1);
results = bayesopt(fun,[omega,initial],'Verbose',0,...
    'AcquisitionFunctionName','expected-improvement-plus','PlotFcn',[],'NumSeedPoints',...
    10,'MaxObjectiveEvaluations',20,'ExplorationRatio',0.5)


z = bestPoint(results)
zbest(i,:) = table2array(z)
[re_n,Tao{i}] = genTao_M(zbest(i,1),zbest(i,2),0.2);
%
x = zeros(re_n,252);
for j = [1:252]
for k = [1:1:re_n]
% % %syms p;
% % %x(i,j) = int(dirac(p-Tao(1,i))*exp(-p*time(1,j)),p,Taomin,Taomax);
% % %x(i,j) = (exp(-Tao(1,i)*time(j,1))- exp(-Tao(1,i+1)*time(j,1)))/time(j,1)
x(k,j) = exp(-Tao{i}(1,k)*time(1,j));
end
end
% % 
% % %%[b,fitinfo] = lasso(x',y','CV',10,'Alpha',1,'RelTol',1e-7); % 参数初始化
% % %%axTrace = lassoPlot(b,fitinfo); 
% % %%axCV = lassoPlot(b,fitinfo,'PlotType','CV');
% % %lam = fitinfo.IndexMinMSE;  % 最小MSE对应lambda
% % %mat = b(:,lam);             % 最优lambda对应的稀疏系数
% % %%[row, ] = find(b(:,lam)~=0);% 非零系数对应的行

mat{i} = lasso2(x',(sigD(i,:)+0.1)',1,1);
% %  
% 
end
% 
save('result_train_1');