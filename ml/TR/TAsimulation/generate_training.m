% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Generates the simulated TPSF voxel data (FLIM) using functions included along with 
% IRF (deconvolved via software) and MNIST data.
% 
% Jason T. Smith, Rensselaer Polytechnic Institute, August 23, 2019
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

load FLIM_IRF;
% load Ti3C2;

% Number of TPSF voxels to create
N_total = 300;

k = 1;
% nTG = 69;
while k <= N_total
% Take 1162 subset of random 1163 MNIST image
    im_binary = ones(100,1);
% Make sure it is not too sparse (we want voxels with more TPSFs than
% less)
    
% Generate intensity image map
    inten = generate_intensity(im_binary);
% Generate t1, t2 and AR image maps
    [tau1,tau2,ratio1,cat] = generate_lifetime_smile(im_binary);
    [data,snr,back_n] = generate_tpsfs(inten, tau1, tau2, ratio1,irf_whole);
    snr_a = mean(snr)
    m = size(im_binary,1);
   
    
    t1 = tau1;
    t2 = tau2;
    
    rT1 = ratio1;
    rT2 = -ratio1+1;
    
    
    sigD = data;
    I = inten.*im_binary;
        
% Making sure sample numbers are assigned like 00001, 00002,.... 01001,
% 01002, etc.
    if k >=0 && k < 10
        n = ['0000' num2str(k)];
    elseif k >=10 && k<100
        n = ['000' num2str(k)];
    elseif k >=100 && k<1000
        n = ['00' num2str(k)];
    elseif k >=1000 && k<10000
        n = ['0' num2str(k)];
    else
        n = num2str(k);
    end
        
% Assign path along with file name.
    pathN = 'G:\train';
    filenm = [pathN '\' 'a_' n '_k'];

% Save .mat file. It is important to note the end '-v7.3' - this is one
% of the more convenient ways to facillitate easy python upload of 
% matlab-created data.

    save(filenm, 'sigD', 'I', 't1','t2','rT1','cat','-v7.3');
    k = k+1;
end

