function [tau1, tau2, ratio,cat] = generate_lifetime( image )
% generate random lifetime values for the 28x28 binary image
  
  m = size(image,1);
  cat = zeros(m,2)
  game = rand(m,1)
  x = [0:m]
  y1 = -1*x(1:(m)*2/5+1).^2/20+2*x(1:(m)*2/5+1)+80
  y2 = -1*(x((m)*3/5+1:m)-(m)*3/5).^2/20+2*(x((m)*3/5+1:m)-(m)*3/5)+80
  y3 = 0.0444*x((m)*1/5+1:(m)*4/5+1).^2-4.4444*x((m)*1/5+1:(m)*4/5+1)+121.1111
  
  t1 = [y1,y2]
  t2 = y3
  
  tau1 = [y1,zeros((m)/5,1)',y2]
  tau2 = [zeros((m)/5,1)',y3,zeros((m)/5,1)']
  
  for i = [1:m]
      if (i>=21&&i<=41||i>=61&&i<=81)
      ratio(i,1)= rand(1,1)
      cat(i,:) = [0,1]
      else
          ratio(i,1) = 1
          cat(i,:) = [1,0]
      end
  end
 
  
  
  
% %   
%   for i = [1:m]
%   
%       if game(i)
%           
% 
% %     Create randomly generated value matrices for the tau1 and tau2
% %     thresholds of interest.
%     tau1(i,1) = 0.5*randn(1,1)+100; % t1 values between 0.2-0.6 ns
%     tau2(i,1) = 0.5*randn(1,1)+10; % t2 values between 2-3 
%     
%     ratio(i,1) = rand(1,1);
%     cat(i,:) = [0,1]
%       else
%           choice = rand(1)
%           if (choice>=0.5)
%           tau1(i,1) = 5*randn(1,1)+100
%           else
%               tau1(i,1) = 0.25*randn(1,1)+10
%           end
%           tau2(i,1) =  0.25*randn(1,1)+5
%           ratio(i,1) = 1;
%           cat(i,:) = [1,0]
%       end
  end
  
      
