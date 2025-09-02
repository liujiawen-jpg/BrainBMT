clear;
clc;
close all;
%%



addpath('./tool');
str2 = '.mat';
save_dir = 'high order\\';
for i=0:3
    str1 = num2str(i);
    data_dir = strcat(str1,str2);
    load(data_dir);
    alldata{1}=data;
    DATA={alldata{1}};
    nclass = 4; %Number of classes, set to 1 if unsure
    if i==2
        nclass=4;
    end
    opts.clusternum=nclass;
    opts.beta=4;
    gamma=6;
    ksk=ConstructA_3order_NaN(DATA,gamma,nclass);% Construct the high order similarity matrices 
    [S,w] = MVMLV(ksk,opts);% Calculate the fusion similarity matrix
    save_dirs = strcat(save_dir,data_dir);
    save(save_dirs, "S");

end
