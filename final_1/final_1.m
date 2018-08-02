%% Data1
%makedata
n = 100;
X = 3 * (rand(n, 2) - 0.5);
radius = [X(:, 1).^2 + X(:, 2).^2];
Y = (radius > 0.7 + 0.1 * randn(n, 1)) & (radius < 2.2 + 0.1 * randn(n, 1));
Y = 2 * Y -1;
N=n;
x=X';
y=Y';

step = 0.1;

%try conv steepest gradient
N_C = 1000;
w_n = zeros(1,N_C+1);
w_n(1) = 3;
for i = 1:N_C
    w_n(i+1) = w_n(i) - [step 0]*J_bibun_w([w_n(i);1], x, y, N);
end

%try Newton
Nw_n = zeros(1,N_C+1);
Nw_n(1) = 3;
%step = 0.1;
for i = 1:N_C
    Nw_n(i+1) = Nw_n(i) - [step 0]*inv(J_nabura([Nw_n(i);1], x, y, N))*J_bibun_w([Nw_n(i);1], x, y, N);
end

%draw graph of conv
figure(1);
f_conv = arrayfun(@(w) J([w;1], x, y, N), w_n);
plot(w_n, f_conv, '-*');
ylabel('J(w^{(t)})');
xlabel('w_{1}^{(t)}');
legend('steepest');

figure(2);
Nf_conv = arrayfun(@(Nw) J([Nw;1], x, y, N), Nw_n);
plot(Nw_n, Nf_conv, 'r-*');
ylabel('J(w^{(t)})');
xlabel('w_{1}^{(t)}');
legend('Newton');

figure(3);
plot(w_n, f_conv, '-*');
hold on;
plot(Nw_n, Nf_conv, 'r-*');
hold off;
ylabel('J(w^{(t)})');
xlabel('w_{1}^{(t)}');
legend('steepest','Newton');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Data2%%%%%%%%%%%%%%%%%%%%%%%
%makedata1
n = 40;
omega = randn(1, 1);
noise = 0.8 * randn(n, 1);
X = randn(n, 2);
Y = 2 * (omega * X(:, 1) + X(:, 2) + noise > 0) - 1;
N=n;
x=X';
y=Y';

step = 0.1;

%try conv steepest gradient
N_C = 1000;
w_n = zeros(1,N_C+1);
w_n(1) = 3;
for i = 1:N_C
    w_n(i+1) = w_n(i) - [step 0]*J_bibun_w([w_n(i);1], x, y, N);
end

%try Newton
Nw_n = zeros(1,N_C+1);
Nw_n(1) = 3;
%step = 0.1;
for i = 1:N_C
    Nw_n(i+1) = Nw_n(i) - [step 0]*inv(J_nabura([Nw_n(i);1], x, y, N))*J_bibun_w([Nw_n(i);1], x, y, N);
end

%draw graph of conv
figure(4);
f_conv = arrayfun(@(w) J([w;1], x, y, N), w_n);
plot(w_n, f_conv, '-*');
ylabel('J(w^{(t)})');
xlabel('w_{1}^{(t)}');
legend('steepest');

figure(5);
Nf_conv = arrayfun(@(Nw) J([Nw;1], x, y, N), Nw_n);
plot(Nw_n, Nf_conv, 'r-*');
ylabel('J(w^{(t)})');
xlabel('w_{1}^{(t)}');
legend('Newton');

figure(6);
plot(w_n, f_conv, '-*');
hold on;
plot(Nw_n, Nf_conv, 'r-*');
hold off;
ylabel('J(w^{(t)})');
xlabel('w_{1}^{(t)}');
legend('steepest','Newton');
