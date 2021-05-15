% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Useful for debugging, visualization or other purposes post-generation of
% a simulation TPSF voxel.
% 
% Jason T. Smith, Rensselaer Polytechnic Institute, August 22, 2019
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%% Plot a specific TPSF and display the parameters used for generation in the command-window.
yC = 12;
figure;
plot(squeeze(sigD(yC,:)));
display(['Intensity:' num2str(I(yC))]);
display(['Tau1:' num2str(t1(yC))])
display(['Tau2:' num2str(t2(yC))])
display(['A1:' num2str(rT(yC))])

% Plot all TPSFs from non-zero pixels for display.
figure;
for i = 1:1162
        cS = squeeze(sigD(i,:));
        if sum(cS) == 0
            continue
        end
        hold on;
        plot(cS)
    end

        