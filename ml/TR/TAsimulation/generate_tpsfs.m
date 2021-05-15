function [full_data0,snr,back_n] = generate_tpsfs(intensity, tau1, tau2,ratio1,irf_whole)
% dimension: image * time gate (1162xnTG)
% irf: unit Instrumental Response Function (sum=1)

M = size(intensity, 1);
% Number of time-points/gates
nTG = 200;


width = 4.89e-1; % Different time-point durations for different apparatus settings
time = [1:1:nTG]*width;
% Pre-allocate memory for each TPSF voxel
full_data0 = zeros(M,nTG);
% Pre-allocate memory for each IRF voxel
irf_full = zeros(M,nTG);
% Loop over all pixels spatially
for i=1:M
%         Only loop at locations from which TPSFs can be created.
        if tau1(i)~=0
%             Create initial bi-exponential given the tau1, tau2 and ratio
%             values at the image position (i,j)

            decay = ratio1(i)*exp(-time./tau1(i))+(1-ratio1(i))*exp(-time./tau2(i));
% %             Grab IRF from library
%             delta = 0.7% %             Grab IRF from library
%             irf = irf_whole(:,round(rand()*(size(irf_whole,2)-1))+1);     
%             irf = irf_smooth(irf);
%             Convolve IRF with our exp. decay
%             decay = conv(decay,irf/sum(irf));
% % 
            delta = 0.7
            delta_ = delta/(2*sqrt(2*log(2)))
            irf = 1/(delta_*sqrt(2*pi))*exp(-log(2)*power(2*time/delta,2))
            
            
%             Convolve IRF with our exp. decay
            decay = conv(decay,irf'/sum(irf));
%             Sample back to the original number of time-points by including random
%             effects due to laser-jitter (point of TPSF ascent).
%             r = rand();
%             if r > .75
                decay = decay(1:nTG);
%             elseif r < .25
%                 rC = round(rand().*3);
%                 decay = [zeros(rC,1); decay(1:nTG-rC)];
%             else
%                 rC = round(rand().*3);
%                 decay = decay(1+rC:nTG+rC);
%             end
         count =500
            decay = decay*count;
           
   
            cur = round(poissrnd(decay));
            
            back_n(i,1) = mean(abs(cur-decay).*abs(cur-decay))
            snr(i,1) =10*log10( mean(decay.*decay)/back_n(i,1))
%             Assign the decay to its corresponding pixel location
             full_data0(i,:) = cur/max(cur);
%              full_data0(i,:) = decay;
        end
    end
    
end
