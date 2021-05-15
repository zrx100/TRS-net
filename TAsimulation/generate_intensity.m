function intensity = generate_intensity( image )
% generate random intensity for input binary image
    m = size(image, 1);
%     random matrix of intensity values possessing values within maximum
%     photon count threshold.
    int1 = rand(m,1) * 250 + 50; % 50 - 300 p.c.
    intensity = int1;
end