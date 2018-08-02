function out = J_nabura(w, x, y, N)
    l=0.01;
    out=zeros(size(x,1));
    for i = 1 : N
        out = out + (p(w,x(:,i),y(i),N).*(1-p(w,x(:,i),y(i),N))).*(x(:,i)*x(:,i)');
    end
    out = 1/N.*out + 2*l.*eye(size(x,1));
    %out = sum(p(w,x,y,N).*(1-p(w,x,y,N)).*(x*x'), 3) + 2*l.*eye(N);
end

function out = p(w, x, y, N)
    out = 1/(1+exp(-y.*(w'*x)));
end