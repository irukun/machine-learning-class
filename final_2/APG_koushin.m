function out = APG_koushin(A, mu, w, w_b, eta, lambda, t)
    out = zeros(size(mu));
    
    v=acceralte(w, w_b, t);
    
    tmp = v - eta*nabura(A, mu, v);
    
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

function out = acceralte(w, w_b, t)
    out = w + q(t)*(w-w_b);
end

function out = q(t)
    out = (t-1)/(t+2);
end