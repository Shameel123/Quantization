clc;
clear all;
close all;
m=2;
loop = (2^m)-1 %Number of Levels  - 1 = Times Loop will run!
f=1;
fs=12*f;
T=1/fs;
nT=1:T:4;
y=cos(2*pi*f*nT);
L=2.^m; %Number of Levels
ymax=max(y)
ymin=min(y)
R=(ymax-ymin)./(L-1)
quantlevel=ymin:R:ymax;
for n=1:length(y)
    for i=1:loop %developed by Shameel ^_^
       if(y(n)<quantlevel(i+1)&&y(n)>=quantlevel(i));
            yq(n)=quantlevel(i)
       end
    end
    if(y(n)>=quantlevel(loop+1))
          yq(n)=quantlevel(loop+1)
    end
end
figure
stem(nT,y,'r','linewidth',2) % shows sampled signal
hold on
stem(nT,yq,'b') % shows quantized
