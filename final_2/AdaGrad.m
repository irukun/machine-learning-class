function [out, out2] = AdaGrad(A, mu, w, eta, lambda, G, delta)
    out = zeros(size(mu));
    tmp = g(A, mu, w);
    %disp(tmp);
    %disp(G);
    for i = 1: size(mu)
        %disp(G(i));
        G(i,i) = G(i,i) + tmp(i)^2;
    end
    out2 = G;
    %disp(G);
    H = sqrt(G) + delta * eye(size(mu));

    tmp = w - eta*inv(H)*tmp;
    hoge = lambda*eta*inv(H);
    
    for i = 1: size(mu)
        if tmp(i) > hoge(i)
            out(i) = tmp(i)-hoge(i);
        elseif tmp(i) < -hoge(i)
            out(i) = hoge(i) + tmp(i);
        else
            out(i) = 0;
        end
    end
end

function out = g(A, mu, w)
    out = 2*A*w - 2*A*mu;
end