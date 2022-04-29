%>>>>>>>>>>>>>>>>>>>> AM Modulation Experiment<<<<<<<<<<<<<<<<<<<<<<<<<<
clc;
close all;
clear all;
%XXXXXXXXXXXXXXXXXXX Define AM modulation Index XXXXXXXXXXXXXXXXXXX
disp(' example: m=1 means 100% modulation');
%m=input(' Enter the value of modulation index (m) = ');
m = input('Enter modulation index(m):'); 
if (m<0)     error('Value of m must lie between 0 and inf')
elseif ((0<m) && (m<1))  disp('Under Modulation');
elseif (m>1) disp ('Over Modulation');
elseif (m==1) disp ('Exact or 100% Modulation');
    end 

%XXXXXXXXXXXXXXXX modulating signal generation XXXXXXXXXXXXXXXXXXXXXXXXXX
Am=10; 
fm=1000;
Tm=1/fm; 
t=0:Tm/1000:5*Tm; 
ym=Am*sin(2*pi*fm*t); % Eqation of modulating signal
figure(1)
subplot(4,1,1);
plot(t,ym), grid on;
title ( ' Modulating Signal ');
xlabel ( ' time(sec) ');
ylabel (' Amplitude(volt) ');
%XXXXXXXXXXXXXXXX carrier signal generation XXXXXXXXXXXXXXXXXXXXXXXXXX
Ac=Am/m;
fc=fm*20;
Tc=1/fc;
yc=Ac*sin(2*pi*fc*t);
subplot(4,1,2);
plot(t,yc), grid on;
title ( ' Carrier Signal ');
xlabel ( ' time(sec) ');
ylabel (' Amplitude(volt) ');
%XXXXXXXXXXXXXXXXXXXXXXXXX AM Modulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
y=Ac*(1+m*sin(2*pi*fm*t)).*sin(2*pi*fc*t);
subplot(4,1,3);
plot(t,y);
title ( ' Amplitude Modulated signal ');
xlabel ( ' time(sec) ');
ylabel (' Amplitude(volt) ');
grid on;
%XXXXXXXXXXXXXXXXXXXXXXXX AM Demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
d=(1/pi)*(Ac+ym);%using envelope detector
subplot(4,1,4);
plot(t,d);
title ( ' Amplitude Demodulated signal ');
xlabel ( ' time(sec) ');
ylabel (' Amplitude(volt) ');
grid on;
%>>>>>>>>>> end of program <<<<<<<<<<<