
[b,fitinfo] = lasso(x',y,'CV',10,'Alpha',1); % 参数初始化
%%axTrace = lassoPlot(b,fitinfo); 
axCV = lassoPlot(b,fitinfo,'PlotType','CV');
lam = fitinfo.IndexMinMSE;  % 最小MSE对应lambda
mat = b(:,lam);             % 最优lambda对应的稀疏系数
[row, ] = find(b(:,lam)~=0);% 非零系数对应的行
