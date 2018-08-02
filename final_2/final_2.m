%% PG
%makedata
N_iteration = 50;

A = [3 0.5; 0.5 1];
mu = [1;2];
eta = 1/max(eig(2*A));


%lambda = 2;
lambda = 2;
w_hat = [0.82; 1.09];

w_n = zeros(2,N_iteration);
w_norm1 = zeros(1,N_iteration);
w_norm1(1) = norm(w_n(:,1)-w_hat);
w_n(:,1) = [3 -1];
for i = 1:N_iteration-1
    w_n(:,i+1) = PG_koushin(A, mu, w_n(:,i), eta, lambda);
    w_norm1(i+1) = norm(w_n(:,i+1)-w_hat);
end

%draw graph of conv
figure(1);
semilogy(w_norm1, '-*');
%f_conv = arrayfun(@(w) J([w;1], x, y, N), w_n);
%plot(w_n, f_conv, '-*');
ylabel('$$||w^{(t)}-\hat{w}||$$','Interpreter','Latex');
xlabel('iteration');
title('\lambda = 2');
legend('PG');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%lambda = 4;
lambda = 4;
w_hat = [0.64; 0.18];

w_n = zeros(2,N_iteration);
w_norm2 = zeros(1,N_iteration);
w_norm2(1) = norm(w_n(:,1)-w_hat);
w_n(:,1) = [3 -1];
for i = 1:N_iteration-1
    w_n(:,i+1) = PG_koushin(A, mu, w_n(:,i), eta, lambda);
    w_norm2(i+1) = norm(w_n(:,i+1)-w_hat);
end

%draw graph of conv
figure(2);
semilogy(w_norm2, '-*');
%f_conv = arrayfun(@(w) J([w;1], x, y, N), w_n);
%plot(w_n, f_conv, '-*');
ylabel('$$||w^{(t)}-\hat{w}||$$','Interpreter','Latex');
xlabel('iteration');
title('\lambda = 4');
legend('PG');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%lambda = 6;
lambda = 6;
w_hat = [0.33; 0];

w_n = zeros(2,N_iteration);
w_norm3 = zeros(1,N_iteration);
w_norm3(1) = norm(w_n(:,1)-w_hat);
w_n(:,1) = [3 -1];
for i = 1:N_iteration-1
    w_n(:,i+1) = PG_koushin(A, mu, w_n(:,i), eta, lambda);
    w_norm3(i+1) = norm(w_n(:,i+1)-w_hat);
end

%draw graph of conv
figure(3);
semilogy(w_norm3, '-*');
%f_conv = arrayfun(@(w) J([w;1], x, y, N), w_n);
%plot(w_n, f_conv, '-*');
ylabel('$$||w^{(t)}-\hat{w}||$$','Interpreter','Latex');
xlabel('iteration');
title('\lambda = 6');
legend('PG');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% APG
%makedata
N_iteration = 50;

A = [3 0.5; 0.5 1];
mu = [1;2];
eta = 1/max(eig(2*A));


%lambda = 2;
lambda = 2;
w_hat = [0.82; 1.09];

w_n = zeros(2,N_iteration);
w_norm4 = zeros(1,N_iteration);
w_norm4(1) = norm(w_n(:,1)-w_hat);
w_n(:,1) = [3 -1];
w_n(:,2) = [3 -1];
for i = 2:N_iteration-1
    w_n(:,i+1) = APG_koushin(A, mu, w_n(:,i), w_n(:,i-1), eta, lambda, i-1);
    w_norm4(i+1) = norm(w_n(:,i+1)-w_hat);
end

%draw graph of conv
figure(4);
semilogy(w_norm1, '-*');
hold on;
semilogy(w_norm4, '-*');
hold off;
%f_conv = arrayfun(@(w) J([w;1], x, y, N), w_n);
%plot(w_n, f_conv, '-*');
ylabel('$$||w^{(t)}-\hat{w}||$$','Interpreter','Latex');
xlabel('iteration');
legend('PG','APG');
title('\lambda = 2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%lambda = 4;
lambda = 4;
w_hat = [0.64; 0.18];

w_n = zeros(2,N_iteration);
w_norm5 = zeros(1,N_iteration);
w_norm5(1) = norm(w_n(:,1)-w_hat);
w_n(:,1) = [3 -1];
w_n(:,2) = [3 -1];
for i = 2:N_iteration-1
    w_n(:,i+1) = APG_koushin(A, mu, w_n(:,i), w_n(:,i-1), eta, lambda, i-1);
    w_norm5(i+1) = norm(w_n(:,i+1)-w_hat);
end

%draw graph of conv
figure(5);
semilogy(w_norm2, '-*');
hold on;
semilogy(w_norm5, '-*');
hold off;
%f_conv = arrayfun(@(w) J([w;1], x, y, N), w_n);
%plot(w_n, f_conv, '-*');
ylabel('$$||w^{(t)}-\hat{w}||$$','Interpreter','Latex');
xlabel('iteration');
legend('PG','APG');
title('\lambda = 4');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%lambda = 6;
lambda = 6;
w_hat = [0.33; 0];

w_n = zeros(2,N_iteration);
w_norm6 = zeros(1,N_iteration);
w_norm6(1) = norm(w_n(:,1)-w_hat);
w_n(:,1) = [3 -1];
w_n(:,2) = [3 -1];
for i = 2:N_iteration-1
    w_n(:,i+1) = APG_koushin(A, mu, w_n(:,i), w_n(:,i-1), eta, lambda, i-1);
    w_norm6(i+1) = norm(w_n(:,i+1)-w_hat);
end

%draw graph of conv
figure(6);
semilogy(w_norm3, '-*');
hold on;
semilogy(w_norm6, '-*');
hold off;
%f_conv = arrayfun(@(w) J([w;1], x, y, N), w_n);
%plot(w_n, f_conv, '-*');
ylabel('$$||w^{(t)}-\hat{w}||$$','Interpreter','Latex');
xlabel('iteration');
legend('PG','APG');
title('\lambda = 6');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AdaGrad
%makedata
N_iteration = 30;

A = [250 15; 15 4];
mu = [1;2];
eta = 500/max(eig(2*A));


%lambda = 0.89;
lambda = 0.89;
delta = 0.02;
w_hat = [1.01; 1.9];

w_n = zeros(2,N_iteration);
w_norm = zeros(1,N_iteration);
w_norm(1) = norm(w_n(:,1)-w_hat);
w_n(:,1) = [3 -1];

G = zeros(2);
for i = 1:N_iteration-1
    [w_n(:,i+1), G] = AdaGrad(A, mu, w_n(:,i), eta, lambda, G, delta);
end

eta = 1/max(eig(2*A));
w_n2 = zeros(2,N_iteration);
w_n2(:,1) = [3 -1];
for i = 1:N_iteration-1
    w_n2(:,i+1) = PG_koushin(A, mu, w_n2(:,i), eta, lambda);
end

w_n3 = zeros(2,N_iteration);
w_n3(:,1) = [3 -1];
w_n3(:,2) = [3 -1];
for i = 2:N_iteration-1
    w_n3(:,i+1) = APG_koushin(A, mu, w_n3(:,i), w_n3(:,i-1), eta, lambda, i-1);
end


%disp(w_n(:,100));

%draw graph of conv
figure(7);
%semilogy(w_norm1, '-*');
plot(w_n(1,:), w_n(2,:), '-*');
hold on;
plot(w_n2(1,:), w_n2(2,:), '-*');
plot(w_n3(1,:), w_n3(2,:), '-o');
hold off;
%f_conv = arrayfun(@(w) J([w;1], x, y, N), w_n);
%plot(w_n, f_conv, '-*');
ylabel('w_2');
xlabel('w_1');
title('\lambda = 0.89');
legend('AdaGrad','PG','APG');