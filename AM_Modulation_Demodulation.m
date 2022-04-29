%>>>>>>>>>>>>>>>>>>>> AM Modulation Experiment<<<<<<<<<<<<<<<<<<<<<<<<<<
clc;
close all;
clear all;
%XXXXXXXXXXXXXXXXXXXXXXXXXXX Define AM modulation Index XXXXXXXXXXXXXXXXXXX
disp(' example: m=1 means 100% modulation');
%m=input(' Enter the value of modulation index (m) = ');
m=1; % for 100% modulation
%XXXXXXXXXXXXXXXXX modulating signal generation XXXXXXXXXXXXXXXXXXXXXXXXXX
Am=10; % Amplitude of modulating signal
fm=1000; % Frequency of modulating signal
Tm=1/fm; % Time period of modulating signal
t=0:Tm/999:5*Tm; % Total time for simulation
ym=Am*sin(2*pi*fm*t); % Eqation of modulating signal
figure(1)
subplot(4,1,1);
plot(t,ym), grid on;% Graphical representation of Modulating signal
title ( ' Modulating Signal ');
xlabel ( ' time(sec) ');
ylabel (' Amplitude(volt) ');
%XXXXXXXXXXXXXXXXXXXXX carrier signal generation XXXXXXXXXXXXXXXXXXXXXXXXXX
Ac=Am/m;% Amplitude of carrier signal [ where, modulation Index (m)=Am/Ac ]
fc=fm*20;% Frequency of carrier signal
Tc=1/fc;% Time period of carrier signal
yc=Ac*sin(2*pi*fc*t);% Eqation of carrier signal
subplot(4,1,2);
plot(t,yc), grid on;% Graphical representation of carrier signal
title ( ' Carrier Signal ');
xlabel ( ' time(sec) ');
ylabel (' Amplitude(volt) ');
%XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX AM Modulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
y=Ac*(1+m*sin(2*pi*fm*t)).*sin(2*pi*fc*t); % Equation of Amplitude
%modulated signal
subplot(4,1,3);
plot(t,y);% Graphical representation of AM signal
title ( ' Amplitude Modulated signal ');
xlabel ( ' time(sec) ');
ylabel (' Amplitude(volt) ');
grid on;
%XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX AM Demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
d=(1/pi)*(Ac+ym);%using envelope detector
subplot(4,1,4);
plot(t,d);% Graphical representation of AM signal
title ( ' Amplitude Demodulated signal ');
xlabel ( ' time(sec) ');
ylabel (' Amplitude(volt) ');
grid on;
%>>>>>>>>>> end of program <<<<<<<<<<<