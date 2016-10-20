clear all
clc
%Specify the range X and Y
xin=input('Please enter the range of x as[num num]:   ');
yin=input('Please enter the range of y as[num num]:   ');
n=input('Please enter n :                           n=');
m=n;
h=(xin(2)-xin(1))/n;
k=(yin(2)-yin(1))/m;

U=sym ('U',[(m+1) n+1]);
if k==h
   syms  x y
    syms FX1 FX2 FY1 FY2
    st=0;
    while 1==1
        FX1(x)=input('Please enter the boundary conditions u(x,0) in terms of x:  u(x,0)=');
        bound=input('Please enter rang as [num,num]:                              ');
        step=(bound(2)-bound(1))/h;
        for i=st:(floor(step)+st)
            U((m+1),(i+1))=FX1(i*h);
        end
        if bound(2)>=xin(2)
            break;
        end
        if step==floor(step)
            st=floor(step);
        else
            st=floor(step)+1;
        end
    end
    %%%%%%
    st=0;
    while 1==1
        FX2(x)=input('Please enter the boundary conditions u(x,l) in terms of x:  u(x,l)=');
        bound=input('Please enter rang as [num,num]:                              ');
        step=(bound(2)-bound(1))/h;    
        for i=st:(floor(step)+st)
            U(1,(i+1))=FX2(i*h);
        end
        if bound(2)>=xin(2)
            break;
        end
        if step==floor(step)
            st=floor(step);
        else
            st=floor(step)+1;
        end
        
     end
    %%%%%%
    st=0;
    while 1==1
        FY1(y)=input('Please enter the boundary conditions u(0,y) in terms of y:  u(0,y)=');
        bound=input('Please enter rang as [num,num]:                              ');
        step=(bound(2)-bound(1))/k;
        for i=st:(floor(step)+st)
            U((i+1),1)=FY1(i*k);
        end
        if bound(2)>=yin(2)
            break;
        end
        if step==floor(step)
            st=floor(step);
        else
            st=floor(step)+1;
        end
     end
    %%%%%%
    st=0;
    while 1==1
        FY2(y)=input('Please enter the boundary conditions u(l,y) in terms of y:  u(l,y)=');
        bound=input('Please enter rang as [num,num]:                              ');
        step=(bound(2)-bound(1))/k;
        for i=st:(floor(step)+st)
            U((i+1),(n+1))=FY2(i*k);
        end
        if bound(2)>=yin(2)
            break;
        end        
        if step==floor(step)
            st=floor(step);
        else
            st=floor(step)+1;
        end
     end
    %%%%%%
    P=sym('P',[m+1 n+1]);
    for i=2:m
        for j=2:n
            P(i,j)=4*U(i,j)-(U(i-1,j)+U(i+1,j)+U(i,j+1)+U(i,j-1));
        end
    end
    P(1,:)=[];
    P(m,:)=[];
    P(:,1)=[];
    P(:,n)=[];
    s=((n-1)*(m-1));
    A=zeros(s,s);
    z1=0;
    for r1=1:(m-1)
        for r2=1:(n-1)
            z1=z1+1;
            z2=0;
            for r3=2:(m)
                for r4=2:(n)
                    z2=z2+1;
                    A(z1,z2)=diff(P(r1,r2),U(r3,r4));
                end
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    C=zeros(s,1);
    P2=sym('c',[m+1 n+1]);
    for d1=2:m
        for d2=2:n
            U(d1,d2)=0;
        end
    end
    for i=2:m
        for j=2:n
            P2(i,j)=4*U(i,j)-(U((i-1),j)+U(i,(j-1))+U((i+1),j)+U(i,(j+1)));
        end
    end
    P2(1,:)=[];
    P2(m,:)=[];
    P2(:,1)=[];
    P2(:,n)=[];
    s1=0;
    for i=1:(m-1)
        for j=1:(n-1)
            s1=s1+1;
            C(s1,1)=-P2(i,j);
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    X=(A^-1)*C;
    s1=0;
    for i=2:m
        for j=2:n
            s1=s1+1;
            U(i,j)=X(s1,1);
        end
    end
    %%%%%%%%%%%%%%%%%%%
    U=double(U);
    U
    [X2,Y2]=meshgrid(xin(1):h:xin(2),yin(2):-k:yin(1));

figure;
contourf(X2,Y2,U,'DisplayName','X,Y,U');figure(gcf)
figure;
surf(X2,Y2,U,'DisplayName','X,Y,U');figure(gcf)
else
    output=('This program is not capable of solving the equations k!=h ')
end
