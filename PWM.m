%Soham Kundu 20192025
clc;
clear ;
close all;
fm=input('Message frequency=');
fc=input('Carrier Sawtooth frequency=');
t=0:0.001:1;

%Message Signal
m=3.*sin(2*pi*fm*t);

%Message amplitude must be less than Sawtooth
subplot(3,1,1);
plot(t,m);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
legend('Message Signal ---->');
grid on;

%Carrier Signal
A=5;
c=A.*sawtooth(2*pi*fc*t); %Carrier sawtooth
subplot(3,1,2);
plot(t,c,'red');
xlabel('Time');
ylabel('Amplitude');
title('Carrier sawtooth wave');
legend('Carrier Signal ---->');
grid on;

%PWM Signal
n=length(c);
%Length of carrier sawtooth is stored to ?n?
for i=1:n
    %Comparing Message and Sawtooth amplitudes
    if (m(i)>=c(i))
        pwm(i)=1;
    else
        pwm(i)=0;
    end
end

subplot(3,1,3);
plot(t,pwm,'green');
xlabel('Time');
ylabel('Amplitude');
title('PWM Signal');
legend('PWM modulated Signal ---->');
axis([0 1 0 1.25]);
%X-Axis varies from 0-1 & Y Axis from 0-1.25
grid on;