function [row_marque,col_marque,listrow_marque,listcol_marque] = barrer(i,row_marque,col_marque,zeros_enc,zeros_bar,listrow_marque,listcol_marque,n,k,l)
for j=1:n
    if zeros_bar(i,j)==1
        col_marque(1,j)=1;
        listcol_marque(1,l)=j;
        l=l+1;
        for m=1:n
            if zeros_enc(m,j)==1
                row_marque(m,1)=1;
                listrow_marque(k,1)=m;
                k=k+1;
                [row_marque,col_marque,listrow_marque,listcol_marque]=barrer(m,row_marque,col_marque,zeros_enc,zeros_bar,listrow_marque,listcol_marque,n,k,l);
                break;
            else
                continue;
            end
        end
    end
end
end