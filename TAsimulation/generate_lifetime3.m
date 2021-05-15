function [tau1, tau2, tau3,ratio1,ratio2,ratio3] = generate_lifetime( image )
% generate random lifetime values for the 28x28 binary image
  
  m = size(image,1);
%     Create randomly generated value matrices for the tau1 and tau2
%     thresholds of interest.

    tau1 = 5*randn(m,1)+100; % t1 values between 0.2-0.6 ns
    tau2 = 0.5*randn(m,1)+10; % t2 values between 2-3 
    tau3 = 50*randn(m,1)+1000
    for i = [1:m]
    x = rand(3,1)
    y = sum(x)
    r = x/y
    ratio1(i,1) = r(1)
    ratio2(i,1) = r(2)
    ratio3(i,1) = r(3)
    end
    
    end

  
      
