clc; 
clear; 
x=input('Please enter X domain :                        x='); 
t=input('Please ener T domain  :                        t='); 
n=input('Please enter nodes nUmber:                     n='); 
m=input('Plese enter total step of time:                m='); 
c=1;
h=x/n; 
k=t/m; 
y=(c*k)/h; 
U=zeros(m+1,n+1); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:m+1 
    U(m+2-j,1)=0; 
end 
for i=1:n+1 
    U(m+1,i)=sin((i-1)*pi*h); 
end 
for j=1:m+1 
    U(m+2-j,n+1)=0; 
end 
for i=2:n 
    U(m,i)=((y^2)/2)*(U(m+1,i+1)+U(m+1,i-1))+(1-(y^2))*(U(m+1,i)); 
end 
for j=2:m 
    for i=2:n 
        U(m+2-(j+1),i)=(y^2)*U(m+2-j,i+1)+2*(1-(y^2))*U(m+2-j,i)+(y^2)*U(m+2-j,i-1)-U(m+2-(j-1),i); 
    end 
end 
U 
contour(U) 
figure
surf(U) 
 
 
 
 
 
 