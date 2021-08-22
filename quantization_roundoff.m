clear all
m=2;
loop1 = (2^m);
loop2 = loop1-1;
f=1;
fs=12*f;
T=1/fs;
nT=1:T:4;
y=cos(2*pi*f*nT);
L=2.^m
ymax=max(y);
ymin=min(y);
R=(ymax-ymin)./(L-1);
quantlevel=ymin:R:ymax;
 

%this finds the mid-level between 2 levels and then store in a vector form
for i= 1:loop2
    T(i) =(quantlevel(i)+quantlevel(i+1))/2 % T = [T1 T2 ... Tn] (becomes vector)
end

for n=1:length(y)
    
    if(y(n)<T(1))
        yq(n)=quantlevel(1);
    end
    
%this checks conditions from T(2) to T(n-1) where n-1 = 2nd last mid point
    for i = 1:(loop1-2) %minus 2 ==> First and Last condition which is not included in loop
        if(y(n)>=T(i)&&y(n)<T(i+1)) %for iteration 1 : T(i) = T(1). T(i+1) = T(2)
            yq(n) = quantlevel(i+1)
        end
    end
    if(y(n)>=T(loop2)) %where T(3) is last mid point of quantization for 2 bit.
        yq(n)=quantlevel((loop1)); %loop1 = final value
    end
end
figure
stem(nT,y,'r','linewidth',3)
hold on
stem(nT,yq,'b')
