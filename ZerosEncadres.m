function [nbzeros_row1, zeros_enc1, zeros_bar1] = ZerosEncadres(nbzeros_row, zeros_enc, zeros_bar, n)
imin=-1;
counter=0;
k=1;
imin_list=zeros(1,n);
while imin~=0
    min=n+1;imin=0;
    for i=1:n
        if nbzeros_row(i,1)<min && nbzeros_row(i,1)~=0 && ~ismember(i, imin_list)
            min=nbzeros_row(i,1);
            imin=i;
        end
    end
    counter=counter+1; %for debug
    if(imin==0)
        break;
    end
    imin_list(1,k)=imin;
    k=k+1;
    for j=1:n
        if zeros_enc(imin,j)==1
            j1=j;
            break;
        end
    end
    for j=1:n
        if zeros_enc(imin,j)==1 && j~=j1
            zeros_enc(imin,j)=0;
            zeros_bar(imin,j)=1;
        end
    end
    for i=1:n
        if zeros_enc(i,j1)==1 && i~=imin
            zeros_enc(i,j1)=0;
            zeros_bar(i,j1)=1;
        end
    end
    nbzeros_row=zeros(n,1);
    for j=1:n
        for i=1:n
            if zeros_enc(i,j)==1
                nbzeros_row(i,1)=nbzeros_row(i,1)+1;
            end
        end
    end
end
nbzeros_row1=nbzeros_row;
zeros_enc1=zeros_enc;
zeros_bar1=zeros_bar;
end