 clear all
 x0 = [0.01,10];
%定义微分方程组
 fdeath = @(t,x)[0.45*0.5*x(2)*x(1)/(0.006+x(2))-0.015*x(1);-0.5*x(2)*x(1)/(0.006+x(2));]
 fnodeath = @(t,x)[0.45*0.5*x(2)*x(1)/(0.006+x(2));-0.5*x(2)*x(1)/(0.006+x(2));]
 %画Cx图
 figure(1);
 [t,death] = ode45(fdeath,[2,30.75],x0);
 plot (t,death(:,1),'-o');
 hold on;
 [t,nodeath] = ode45(fnodeath,[2,29.1],x0);
 plot (t,nodeath(:,1),'-o')
 
 %画Cs图
 figure(2);
 [t,death] = ode45(fdeath,[2,30.75],x0);
 plot (t,death(:,2),'-o');
 hold on;
 [t,nodeath] = ode45(fnodeath,[2,29.1],x0);
 plot (t,nodeath(:,2),'-o')
 
 
 %death和nodeath变量的第一列是Cx，第二列是Cs