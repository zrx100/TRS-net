%%
function mat = genx(imax,jmax)

global Tao;
global time;
global intensity;
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵����
fid = importdata ('MXene_CTAB.csv');

Tao = genTao (9,0.01,imax);
time = fid (31:70,1);
intensity = fid (31:70,100:1163);

double x;
for j = [1:1:jmax]
for i = [1:1:imax]
%syms p;
%x(i,j) = int(dirac(p-Tao(1,i))*exp(-p*time(1,j)),p,Taomin,Taomax);
x(i,j) = exp(-Tao(1,i)*time(j,1));
end
end
%%

%for count = [1:1064]
%[b,fitinfo] = lasso(x',y_1','CV',8,'Alpha',1); % ������ʼ��
%axTrace = lassoPlot(b,fitinfo); 
%axCV = lassoPlot(b,fitinfo,'PlotType','CV');
%lam = fitinfo.IndexMinMSE;  % ��СMSE��Ӧlambda
%mat(:,count) = b(:,lam);             % ����lambda��Ӧ��ϡ��ϵ��
%mat(:,1) = b(:,lam);
%end
