function [K1, K2] = calculate_lqr(Q0, r, A, B, E, C, D, H)
% 计算控制系数矩阵

Q = C' * Q0 * C;
R = C' * Q0 * D;
S = C' * Q0 * H;
T = D' * Q0 * H;
W = H' * Q0 * H;
V = r + D' * Q0 * D;
[~, P] = lqr(A, B, Q, V, R);

K1 = V^(-1) * (R' + B' * P);
K2 = V^(-1) * T + V^(-1) * B' * (A' - R * V^(-1) * B' - P * B * V^(-1) * B')^(-1) * (R * V^(-1) * T - S + P * B * V^(-1) * T - P * E);
end
