clc;
clear ;
close all;
fm=10;
fc=40;
%t=0:0.001:1;
fs = 1000;  % sampling frequency  
t = 0:1/fs:1;
%##########Message Signal################
m=3.*sin(2*pi*fm*t);%Message amplitude must be less than Sawtooth
subplot(4,1,1);
plot(t,m);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
legend('Message Signal ---->');
grid on;

%##########Carrier Signal################
A=10;
c=A.*sawtooth(2*pi*fc*t);%Carrier sawtooth
subplot(4,1,2);
plot(t,c,'red');
xlabel('Time');
ylabel('Amplitude');
title('Carrier sawtooth wave');
legend('Carrier Signal ---->');
grid on;
%###########PWM Signal####################
n=length(c);%Length of carrier sawtooth is stored to ‘n’
for i=1:n%Comparing Message and Sawtooth amplitudes
if (m(i)>=c(i))
pwm(i)=1;
else
pwm(i)=0;
end
end
subplot(4,1,3);
plot(t,pwm,'green');
xlabel('Time');
ylabel('Amplitude');
title('PWM Signal');
legend('PWM modulated Signal ---->');
axis([0 1 0 1.25]);%X-Axis varies from 0 to 1 & Y-Axis from 0 to 1.25
grid on;
%###########PPM Signal####################
duty = 10;
% no. of samples in one square wave period
t_period = fs/fc;
% no. of samples in on time
on_t = t_period/duty;
s = square(2*pi*fc*t,duty);
s(find(s<0)) = 0;
ppm = zeros(1,length(s));
% find ids where carrier is greater than message
id = find(c > m);
idd = diff(id);
iddd = find(idd ~= 1);
temp(1) = id(1);
temp(2:length(iddd)+1) = id(iddd + 1);

% ppm signal
for i = 1:length(temp)
    ppm(temp(i) : temp(i) + on_t - 1) = 1;
end
subplot(4,1,4);
plot(t,ppm,'c','lineWidth',1);
title('PPM Signal'); 
xlabel('Time');
ylabel('Amplitude');
legend('PPM Modulated Signal ---->');
grid on;
ylim([-0.2 1.2]);

