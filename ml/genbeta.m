
[b,fitinfo] = lasso(x',y,'CV',10,'Alpha',1); % ������ʼ��
%%axTrace = lassoPlot(b,fitinfo); 
axCV = lassoPlot(b,fitinfo,'PlotType','CV');
lam = fitinfo.IndexMinMSE;  % ��СMSE��Ӧlambda
mat = b(:,lam);             % ����lambda��Ӧ��ϡ��ϵ��
[row, ] = find(b(:,lam)~=0);% ����ϵ����Ӧ����
