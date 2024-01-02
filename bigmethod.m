function [X1,zeros_enc] = bigmethod(M,n)
nbzeros_row=zeros(n,1);
zeros_location=zeros(n,n);
for j=1:n
    for i=1:n
        if M(i,j)==0
            nbzeros_row(i,1)=nbzeros_row(i,1)+1;
            zeros_location(i,j)=1;
        end
    end
end
zeros_enc=zeros_location;
zeros_bar=zeros(n,n);
[nbzeros_row, zeros_enc, zeros_bar] = ZerosEncadres(nbzeros_row, zeros_enc, zeros_bar, n);
row_marque=zeros(n,1);
listrow_marque=zeros(n,1);
k=1;
for i=1:n
    c=0;
    for j=1:n
        if zeros_enc(i,j)==1
            break;
        else
            c=c+1;
        end
    end
    if c==n
        row_marque(i,1)=1;
        listrow_marque(k,1)=i;
        k=k+1;
    end
end

col_marque=zeros(1,n);
listcol_marque=zeros(1,n);
l=1;
for i=1:n
    if row_marque(i,1)==0
        continue;
    else
        [row_marque,col_marque,listrow_marque,listcol_marque]=barrer(i,row_marque,col_marque,zeros_enc,zeros_bar,listrow_marque,listcol_marque, n,k,l);
    end
end
min=sum(M(:));
aux=M;
for i=1:n
    if ~ismember(i,listrow_marque)
        continue;
    else
        for j=1:n
            if ismember(j,listcol_marque)
                continue;
            else
                if aux(i,j)<min
                    min=aux(i,j);
                end
            end
        end
    end
end
for i=1:n
    if ~ismember(i,listrow_marque)
        continue;
    else
        for j=1:n
            if ismember(j,listcol_marque)
                continue;
            else
                aux(i,j)=aux(i,j)-min;
            end
        end
    end
end
for i=1:n
    if ismember(i,listrow_marque)
        continue;
    else
        for j=1:n
            if ~ismember(j,listcol_marque)
                continue;
            else
                aux(i,j)=aux(i,j)+min;
            end
        end
    end
end


nbzeros_row=zeros(n,1);
zeros_location=zeros(n,n);
for j=1:n
    for i=1:n
        if aux(i,j)==0
            nbzeros_row(i,1)=nbzeros_row(i,1)+1;
            zeros_location(i,j)=1;
        end
    end
end
zeros_enc=zeros_location;
zeros_bar=zeros(n,n);
[nbzeros_row, zeros_enc, zeros_bar] = ZerosEncadres(nbzeros_row, zeros_enc, zeros_bar, n);
row_marque=zeros(n,1);
listrow_marque=zeros(n,1);
k=1;
for i=1:n
    c=0;
    for j=1:n
        if zeros_enc(i,j)==1
            break;
        else
            c=c+1;
        end
    end
    if c==n
        row_marque(i,1)=1;
        listrow_marque(k,1)=i;
        k=k+1;
    end
end
if row_marque==zeros(n,1)
    X1=aux;
else
    [X1,zeros_enc]=bigmethod(aux,n);
end