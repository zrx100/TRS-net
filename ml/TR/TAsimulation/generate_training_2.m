% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Generates the simulated TPSF voxel data (FLIM) using functions included along with 
% IRF (deconvolved via software) and MNIST data.
% 
% Jason T. Smith, Rensselaer Polytechnic Institute, August 23, 2019
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

load FLIM_IRF;
% load Ti3C2;

% Number of TPSF voxels to create
N_total = 1;

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
    [tau1, tau2,ratio1,cat] = generate_lifetime(im_binary);
    data = generate_tpsfs_2(inten, tau1, tau2,ratio1,irf_whole);
    m = size(im_binary,1);
   
    
    t1_a = tau1;
    t2_a = tau2;
    
    rT1_a = ratio1;
   
    
    
    sigD_a = data;
    I_a = inten.*im_binary;
        
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
    pathN = 'C:\Users\hp\Desktop\matlab\ml\TR\TPSFsimulation_FLIM';
    filenm = [pathN '\' 'smile_face'];

% Save .mat file. It is important to note the end '-v7.3' - this is one
% of the more convenient ways to facillitate easy python upload of 
% matlab-created data.
  

    save(filenm, 'sigD_a', 'I_a', 't1_a','t2_a','rT1_a', '-v7.3');

    k = k+1;

end

