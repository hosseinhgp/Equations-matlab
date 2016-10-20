clear all
clc
%Specify the range X and Y
xin=input('Please enter the range of x as[num num]:   ');
yin=input('Please enter the range of y as[num num]:   ');
h=input('Please enter h :                           h=');
k=h;
n=(xin(2)-xin(1))/h;
m=(yin(2)-yin(1))/h;

U=sym ('U',[(m+3) n+3]);
T=sym ('U',[(m+3) n+3]);
if k==h
   syms  x y
    syms FX1 FX2 FY1 FY2
    st=0;
    while 1==1
        d1=input('If a boundary condition is derived from the value 1, otherwise enter 0?    ');
        if(d1==0)
            FX1(x)=input('Please enter the boundary conditions u(x,0) in terms of x:  u(x,0)=');
            bound=input('Please enter reng as [num,num]:                              ');
            %U((m+3),:)=[];
            step=(bound(2)-bound(1))/h;
            for i=st:(floor(step)+st)
                U((m+2),(i+1))=FX1(i*h);
            end
            if bound(2)>=xin(2)
                break;
            end
            if step==floor(step)
                st=floor(step);
            else
                st=floor(step)+1;
            end
        else
            FX1(x)=input('Please enter the boundary conditions u(x,0) in terms of x:  Un=');
            bound=input('Please enter reng as [num,num]:                              ');
            step=(bound(2)-bound(1))/h;
            for i=st:(floor(step)+st)
                T((m+2),(i+1))=FX1(i*h);
            end
            for i=st:(floor(step)+st)
                U((m+3),(i+1))=(2*h*T((m+2),(i+1)))+U((m+1),(i+1));
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
    end
    %%%%%%
    st=0;
    while 1==1
        d2=input('If a boundary condition is derived from the value 1, otherwise enter 0?    ');
        if(d2==0)
            FX2(x)=input('Please enter the boundary conditions u(x,l) in terms of x:  u(x,l)=');
            bound=input('Please enter reng as [num,num]:                              ');
            %U(1,:)=[];
            step=(bound(2)-bound(1))/h;    
            for i=st:(floor(step)+st)
                U(2,(i+1))=FX2(i*h);
            end
            if bound(2)>=xin(2)
                break;
            end
            if step==floor(step)
                st=floor(step);
            else
                st=floor(step)+1;
            end
        else
            FX1(x)=input('Please enter the boundary conditions u(x,l) in terms of x:  Un=');
            bound=input('Please enter reng as [num,num]:                              ');
            step=(bound(2)-bound(1))/h;
            for i=st:(floor(step)+st)
                T(2,(i+1))=FX1(i*h);
            end
            for i=st:(floor(step)+st)
                U(1,(i+1))=(2*h*T(2,(i+1)))+U(3,(i+1));
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
        
    end
      %%%%%%
    st=0;
    while 1==1
        d3=input('If a boundary condition is derived from the value 1, otherwise enter 0?    ');
        if(d3==0)
            FY2(y)=input('Please enter the boundary conditions u(l,y) in terms of y:  u(l,y)=');
            bound=input('Please enter reng as [num,num]:                              ');
            %U(:,(n+3))=[];
            step=(bound(2)-bound(1))/k;
            for i=st:(floor(step)+st)
                U((i+1),(n+2))=FY2(i*k);
            end
            if bound(2)>=yin(2)
                break;
            end        
            if step==floor(step)
                st=floor(step);
            else
                st=floor(step)+1;
            end
        else
            FY1(x)=input('Please enter the boundary conditions u(l,y) in terms of x:  Un=');
            bound=input('Please enter reng as [num,num]:                              ');
            step=(bound(2)-bound(1))/h;
            for i=st:(floor(step)+st)
                T((i+1),(n+2))=FY1(i*h);
            end
            for i=st:(floor(step)+st)
                U((i+1),(n+3))=(2*h*T((i+1),(n+2)))+U((i+1),(n+1));
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
     end
    %%%%%%
    st=0;
    while 1==1
        d4=input('If a boundary condition is derived from the value 1, otherwise enter 0?    ');
        if(d4==0)
            FY1(y)=input('Please enter the boundary conditions u(0,y) in terms of y:  u(0,y)=');
            bound=input('Please enter reng as [num,num]:                              ');
            %U(:,1)=[];
            step=(bound(2)-bound(1))/k;
            for i=st:(floor(step)+st)
                U((i+1),2)=FY1(i*k);
            end
            if bound(2)>=yin(2)
                break;
            end
            if step==floor(step)
                st=floor(step);
            else
                st=floor(step)+1;
            end
        else
            FX1(x)=input('Please enter the boundary conditions u(0,y) in terms of x:  Un=');
            bound=input('Please enter reng as [num,num]:                              ');
            step=(bound(2)-bound(1))/h;
            for i=st:(floor(step)+st)
                T((i+1),2)=FX1(i*h);
            end
            for i=st:(floor(step)+st)
                U((i+1),1)=(2*h*T((i+1),2))+U((i+1),3);
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
    end
    U%%%%%%%%%%%%%%%%%%%%%%
    P=sym('P',[(m+3) (n+3)]);
    for i=(3-d2):(m+2-d1-d2)
        for j=(3-d3):(n+2-d3-d4)
            P(i,j)=4*U(i,j)-(U(i-1,j)+U(i+1,j)+U(i,j+1)+U(i,j-1));
        end
    end
    P
    P(k1,:)=[];
    P(1,:)=[];
    P(:,k2)=[];
    P(:,1)=[];
    [k1,k2]=size(U);
    P%%%%%%%%%%%%%%%%%%%%%%
    s=((k1-2)*(k2-2));
    A=zeros(s,s);
    z1=0;
    A
    P
    Y=P;
    for r1=1:(k1-2)
        for r2=1:(k2-2)
            z1=z1+1;
            z2=0;
            for r3=(2):(3)
                for r4=(3):(4)
                    z2=z2+1;
                    A(z1,z2)=diff(Y(r1,r2),U(r3,r4));
                end
            end
        end
    end
    A
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    C=zeros(s,1);
    P2=sym('c',[k1 k2]);
    for d1=2:(k1-1)
        for d2=2:(k2-1)
            U(d1,d2)=0;
        end
    end
    for i=2:(k1-1)
        for j=2:(k2-1)
            P2(i,j)=4*U(i,j)-(U((i-1),j)+U(i,(j-1))+U((i+1),j)+U(i,(j+1)));
        end
    end
    P2(1,:)=[];
    P2((k1-1),:)=[];
    P2(:,1)=[];
    P2(:,(k2-1))=[];
    s1=0;
    for i=1:(k1-2)
        for j=1:(k2-2)
            s1=s1+1;
            C(s1,1)=-P2(i,j);
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    X=(A^-1)*C;
    s1=0;
    for i=2:(k1-1)
        for j=2:(k2-1)
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
