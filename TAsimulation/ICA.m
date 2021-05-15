q= 2
y = 0.2*exp(-0.1*t')+0.8*exp(-0.01*t')
S(:,[1:q]) = [0.2*exp(-0.1*t'),0.8*exp(-0.01*t')]

mixdata = y
Mdl = rica(mixdata,q);
unmixed = transform(Mdl,mixdata,'GradientTolerance',1e-12,'IterationLimit',100);

;for i = 1:q
    subplot(2,q,i)
    plot(S(:,i))
    title(['Sound ',num2str(i)])
    subplot(2,q,i+q)
    plot(unmixed(:,i))
    title(['Unmix ',num2str(i)])
end