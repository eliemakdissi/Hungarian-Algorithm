function X1= HungarianMethod(M)
M2=M;
n = length(M);
min_val = M(1,1); %#ok<NASGU> 
for i = 1:n
    min_val = M(i,1);
    for j = 1:n
        if M(i,j) < min_val
            min_val = M(i,j);
        end
    end
    for j = 1:n
        M(i,j) = M(i,j) - min_val;
    end
end
for j = 1:n
    min_val = M(1,j);
    for i = 1:n
        if M(i,j) < min_val
            min_val = M(i,j);
        end
    end
    for i = 1:n
        M(i,j) = M(i,j) - min_val;
    end
end


[aux,zeros_enc]=bigmethod(M,n);

X1=aux;

cost=0;
for i=1:n
    for j=1:n
        if zeros_enc(i,j)==1
            fprintf('row %d --> col %d \n',i,j);
            cost=cost+M2(i,j);
        end
    end
end
fprintf('\n%f',cost);

end