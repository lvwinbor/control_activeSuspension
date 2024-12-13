clc;
clear;
narvs = 6; % 变量个数
x_lb = [1, 1, 1, 1, 1, 1 * 10^(-5)]; % x的下界
x_ub = [10^3, 10^3, 10^3, 1 * 10^3, 1 * 10^3, 1 * 10^(-4)]; % x的上界
load('../data/par.mat');
[x, fval, exitflag, output] = particleswarm(@obj_fun, narvs, x_lb, x_ub);