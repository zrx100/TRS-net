function [B] = lassoloss (X,time,y)
re_n = 30
Tao = genTao(X.omega,0.005,re_n);
double x

for j = [1:1:40]
for i = [1:1:re_n]
%syms p;
%x(i,j) = int(dirac(p-Tao(1,i))*exp(-p*time(1,j)),p,Taomin,Taomax);
%x(i,j) = (exp(-Tao(1,i)*time(j,1))- exp(-Tao(1,i+1)*time(j,1)))/time(j,1)
x(i,j) = exp(-Tao(1,i)*time(j,1));
end
end

%%[b,fitinfo] = lasso(x',y','CV',10,'Alpha',1,'RelTol',1e-7); % ������ʼ��
%%axTrace = lassoPlot(b,fitinfo); 
%%axCV = lassoPlot(b,fitinfo,'PlotType','CV');
%lam = fitinfo.IndexMinMSE;  % ��СMSE��Ӧlambda
%mat = b(:,lam);             % ����lambda��Ӧ��ϡ��ϵ��
%%[row, ] = find(b(:,lam)~=0);% ����ϵ����Ӧ���� 

%[b,fitinfo] = lasso(x',y_1','CV',8,'Alpha',X.theta); % ������ʼ��
%axTrace = lassoPlot(b,fitinfo); 
%axCV = lassoPlot(b,fitinfo,'PlotType','CV');
%lam = fitinfo.IndexMinMSE;  % ��СMSE��Ӧlambda
%mat = b(:,lam);

mat = lasso2(x',y,1)

B = mse(y-(mat(1:re_n,1)'*x+mat(re_n+1)));


