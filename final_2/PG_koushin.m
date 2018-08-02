function out = PG_koushin(A, mu, w, eta, lambda)
    out = zeros(size(mu));
    %disp(size(mu));
    tmp = w - eta*nabura(A, mu, w);
    %disp(tmp);
    hoge = lambda*eta;
    for i = 1: size(mu)
        if tmp(i) > hoge
            out(i) = tmp(i)-hoge;
        elseif tmp(i) < -hoge
            out(i) = hoge + tmp(i);
        else
            out(i) = 0;
        end
    end
end

function out = nabura(A, mu, w)
    out = 2*A*w - 2*A*mu;
end