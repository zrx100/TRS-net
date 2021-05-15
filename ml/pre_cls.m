fid = importdata ('MXene_CTAB.csv');
time = fid (31:70,1);
intensity = fid (31:70,100:1163);

for i = [1:size(intensity,2)]
    scaler = max(intensity(:,i))
    intensity(:,i) = intensity(:,i)/scaler
end

