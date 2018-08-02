function out = J_bibun_w(w, x, y, N)
    l=0.01;
    out = 1/N.*sum((-y.*x).*(1-p(w,x,y,N)), 2) + 2*l*w;
end

function out = p(w, x, y, N)
    out = 1./(ones(2,N)+exp(-y.*(w'*x)));
end