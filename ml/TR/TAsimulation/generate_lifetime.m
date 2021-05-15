function [tau1, tau2, ratio] = generate_lifetime( image )
% generate random lifetime values for the 28x28 binary image
    
 
    m = size(image,1);
%     Create randomly generated value matrices for the tau1 and tau2
%     thresholds of interest.
    tau1 = 5*randn(m,1)+100; % t1 values between 0.2-0.6 ns
    tau2 = 0.5*randn(m,1)+10; % t2 values between 2-3 
    ratio = rand(m,1);
end