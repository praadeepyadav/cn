%Soham Kundu 20192025 EE2

clc;
clear all;
close all;

fc = 150;
fm = fc/10;
fs = fc*100;
t = 0:1/fs:1; %Simulation Time

%Message Signal
Am = cos(2*pi*fm*t);
figure(1)
subplot(4,1,1);
plot(t,Am);
title('Message Signal');
xlabel('Time Period');
ylabel('Amplitude');

%Carrier Signal
Ac = 0.5*square(2*pi*fc*t)+0.5;
subplot(4,1,2);
plot(t,Ac);
title('Carrier Signal');
xlabel('Time Period');
ylabel('Amplitude');

%Pulse Amplitude Modulated Signal
Apam = Am.*Ac; 
subplot(4,1,3);
plot(t,Apam);
title('Pulse Amplitude Modulated Signal');
xlabel('Time Period');
ylabel('Amplitude');

%Pulse Demodulated Signal
filter=fir1(200,fm/fs,'low');
original_signal=conv(filter,Apam);
t1=0:1/(length(original_signal)-1):1;
subplot (4,1,4)
plot(t1,original_signal);
title('Demodulated signal ');
xlabel('Timeperiod');
ylabel('Amplitude');