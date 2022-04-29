clc;
clear all;
close all;
kf=10;
Am=5;
fm=20;
fdev=(kf*Am);
beta=fdev/fm;
t=0:0.001:1;
Ac=5;
fc=200;
m=Am*cos(2*pi*fm*t);
c=Ac*cos(2*pi*fc*t);
s=Ac*cos(2*pi*fc*t+beta*(sin(2*pi*fm*t)));

subplot(4,1,1);
plot(t,m);
grid on;
title('message signal');
xlabel('time');
ylabel('amplitude');

subplot(4,1,2);
plot(t,c);
grid on;
title('carrier signal');
xlabel('time');
ylabel('amplitude');

subplot(4,1,3);
plot(t,s);
grid on;
title('modulated signal');
xlabel('time');
ylabel('amplitude');

d=Ac*cos(2*pi*fc*t+(kf/fm)*m);
subplot(4,1,4);
plot(t,d);
title ( 'Demodulated signal');
xlabel ( 'time(sec)');
ylabel ('Amplitude(volt)');