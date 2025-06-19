clear;
clc;
close all;
%%


addpath('./biodata');
addpath('./tool');
load('local.mat');
load('global.mat');
X2=local;
% X1=normalize(globals);
X1 = globals;
alldata{1}=X1;
alldata{2} = X2;
DATA={alldata{1},alldata{2}};
nclass = 4;
opts.clusternum=nclass;
opts.beta=4;
gamma=6;
[S,w] = MVMLV(DATA,opts);
group = SpectralClustering(S,nclass);% Extract group information using spectral clustering method
save('C:\\Users\\admin\\Desktop\\postgraduate\\matlab toolbox\\simtb-master\\simulated_data\\high order\\all_similarity.mat', "S");
save('C:\\Users\\admin\\Desktop\\postgraduate\\matlab toolbox\\simtb-master\\simulated_data\\high order\\group.mat', "group");

