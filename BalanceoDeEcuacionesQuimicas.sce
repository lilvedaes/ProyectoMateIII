clc
A=[15 -0.2 -0.4 0;-2 8.22 -0.02 0;5 -0.02 8.44 -0.02;0 0 -0.02 8.02];
x=[0,0,0,0];
b=[15;0;0;0];
f=0;
t=0.00001;
[m,n]=size(A);
o=1;
R=1;
f(1,1:m+1)=[0 x];
o=o+1;
while R>t
    for i=1:m;
        sum=0;
        for j=1:m
            if j<=i-1
                sum=sum+A(i,j)*f(o,j+1);
            elseif j>=i+1
                sum=sum+A(i,j)*f(o-1,j+1);
            end
        end
        x(1,i)=(1/A(i,i))*(b(i,1)-sum);
        f(o,1)=o-1;f(o,i+1)=x(1,i);
        
      end
      R=max(abs((f(o,2:m+1)-f(o-1,2:m+1))));
      o=o+1;
      if R>1 & o>1000;
          disp('Erase this');
          break
      end
end
disp(f);
ans=f(o-1,2:n+1);
disp(ans);
