clear; clc;

num = 30;
% matlabpool open local 2;

n = matlabpool('size')


tic
i = loop(num);
toc

tic
j = loopPar(num);
toc


matlabpool close