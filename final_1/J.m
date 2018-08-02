function out = J(w, x, y, N)
    l = 0.01;
    out=1/N.*sum(log(1+exp(-y.*(w'*x)))) + l*(w'*w);
end