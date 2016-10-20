clc; 
clear all; 
Xin= [0 3 6 8]; 
Yin= [0 3 6 9]; 
n= length (Xin); 
m= length (Yin); 
U=zeros(n,m); 
k1=(n-2)*(m-2); 
R1=zeros(k1); 
R2=zeros(k1,k1); 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:n 
    U(m,i)=Xin(1,i)^3; 
end; 
for i=2:n-2 
        U(1,i)=Xin(1,i)^3 - 243*Xin(1,i); 
end; 
for j=1:m 
    U(m+1-j,1)=0; 
 end; 
 for j=2:m-2 
     U(m+1-j,n)=512-24*Yin(1,i)^2; 
 end; 
 U(1,n-1)= 4*Xin(1,n-1)^3 - 300*Xin(1,n-1); 
 U(2,m)= 4*Xin(1,n)^3 - 300*Xin(1,n); 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
for i=2:n-1 
    for j=2:m-1 
        U(j,i)=1; 
    end 
end 
for i=2:n-1 
    for j=2:m-1 
        while(norm(U(j,i)-R2(j,i))~=0) 
            for i=2:n-1 
                for j=2:m-1 
                    R2(j,i)=U(j,i); 
                end 
            end 
            for i=2:m-1 
                for j=2:n-1 
                    a=(Xin(n+2-j)-Xin(n+1-j))/(Xin(n+1-j)-Xin(n-j)); 
                    b=(Yin(m+2-i)-Yin(m+1-i))/(Yin(m+1-i)-Yin(m-i)); 
                    a1=1/(1+a); 
                    a2=1/(a*(a+1)); 
                    b1=1/(1+b); 
                    b2=1/(b*(b+1)); 
                    U(n+1-j,i)=((a*b)/(a+b))*(a2*U(n+1-j,i+1)+b1*U(n-j,i)+a1*U(n+1-j,i-1)+b2*U(n+2-j,i)); 
                end 
            end 
        end 
    end 
end 
U 
contour(U) 
%surf(U) 
   
 
 
 
 
 