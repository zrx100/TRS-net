 clear all
 x0 = [0.01,10];
%����΢�ַ�����
 fdeath = @(t,x)[0.45*0.5*x(2)*x(1)/(0.006+x(2))-0.015*x(1);-0.5*x(2)*x(1)/(0.006+x(2));]
 fnodeath = @(t,x)[0.45*0.5*x(2)*x(1)/(0.006+x(2));-0.5*x(2)*x(1)/(0.006+x(2));]
 %��Cxͼ
 figure(1);
 [t,death] = ode45(fdeath,[2,30.75],x0);
 plot (t,death(:,1),'-o');
 hold on;
 [t,nodeath] = ode45(fnodeath,[2,29.1],x0);
 plot (t,nodeath(:,1),'-o')
 
 %��Csͼ
 figure(2);
 [t,death] = ode45(fdeath,[2,30.75],x0);
 plot (t,death(:,2),'-o');
 hold on;
 [t,nodeath] = ode45(fnodeath,[2,29.1],x0);
 plot (t,nodeath(:,2),'-o')
 
 
 %death��nodeath�����ĵ�һ����Cx���ڶ�����Cs