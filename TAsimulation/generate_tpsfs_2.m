function [full_data0] = generate_tpsfs(intensity, tau1, tau2,ratio1,irf_whole)
% dimension: image * time gate (1162xnTG)
% irf: unit Instrumental Response Function (sum=1)

M = size(intensity, 1);
% Number of time-points/gates
nTG = 90;


width = 9.78e-2; % Different time-point durations for different apparatus settings
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
            decay = ratio1(i)*exp(-time./tau1(i))+(1-ratio1(i))*exp(-time./tau2(i))
%             Grab IRF from library
            irf = irf_whole(:,round(rand()*(size(irf_whole,2)-1))+1);     
            irf = irf_smooth(irf);
%             Convolve IRF with our exp. decay
            decay = conv(decay,irf/sum(irf));
%             Sample back to the original number of time-points by including random
%             effects due to laser-jitter (point of TPSF ascent).
            r = rand();
            if r > .75
                decay = decay(1:nTG);
            elseif r < .25
                rC = round(rand().*3);
                decay = [zeros(rC,1); decay(1:nTG-rC)];
            else
                rC = round(rand().*3);
                decay = decay(1+rC:nTG+rC);
            end
%             Multiple the decay by its corresponding intensity value
%             (maximum photon count)
            decay = decay*3000;
%             decay = decay+0.01*poissrnd(decay)-0.01*poissrnd(decay)
%             Add poisson noise
            cur = round(poissrnd(decay));
%             Assign the decay to its corresponding pixel location
             full_data0(i,:) = cur/max(cur);
%              full_data0(i,:) = decay;
        else
%             Create initial bi-exponential given the tau1, tau2 and ratio
%             values at the image position (i,j)
            decay = ratio1(i)*exp(-time./tau2(i))
%             Grab IRF from library
            irf = irf_whole(:,round(rand()*(size(irf_whole,2)-1))+1);     
            irf = irf_smooth(irf);
%             Convolve IRF with our exp. decay
            decay = conv(decay,irf/sum(irf));
%             Sample back to the original number of time-points by including random
%             effects due to laser-jitter (point of TPSF ascent).
            r = rand();
            if r > .75
                decay = decay(1:nTG);
            elseif r < .25
                rC = round(rand().*3);
                decay = [zeros(rC,1); decay(1:nTG-rC)];
            else
                rC = round(rand().*3);
                decay = decay(1+rC:nTG+rC);
            end
%             Multiple the decay by its corresponding intensity value
%             (maximum photon count)
            decay = decay*3000;
%             decay = decay+0.01*poissrnd(decay)-0.01*poissrnd(decay)
%             Add poisson noise
            cur = round(poissrnd(decay));
%             Assign the decay to its corresponding pixel location
             full_data0(i,:) = cur/max(cur);
%              full_data0(i,:) = decay;
    end
end
