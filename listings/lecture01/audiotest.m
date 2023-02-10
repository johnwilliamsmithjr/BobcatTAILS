close all;
clear all;
clc;

%%Load / play / show audio file

figure;
[y_orig,Fs_orig] = audioread('Montana State University.m4a');

y = y_orig;
Fs = Fs_orig;

sound(y,Fs);    

disp("Sampling rate is " + Fs + "Hz");

t = (1:length(y)) / Fs;
subplot(211);
plot(t,y);
xlabel('time [s]');

subplot(212);
idx = round(0.5*length(y)):(0.51*length(y));
plot(t(idx),y(idx));
xlabel('time [s]');

%% downsample to 12,000 Hz

figure;
y = downsample(y,4);
Fs = Fs/4;
sound(y,Fs);

disp("Sampling rate is " + Fs + "Hz");

t = (1:length(y)) / Fs;
subplot(211);
plot(t,y);
xlabel('time [s]');

subplot(212);
idx = round(0.5*length(y)):(0.51*length(y));
plot(t(idx),y(idx));
xlabel('time [s]');

%% downsample to 3,000 Hz

figure;
y = downsample(y,4);
Fs = Fs/4;
sound(y,Fs);

disp("Sampling rate is " + Fs + "Hz");

t = (1:length(y)) / Fs;
subplot(211);
plot(t,y);
xlabel('time [s]');

subplot(212);
idx = round(0.5*length(y)):(0.51*length(y));
plot(t(idx),y(idx));
xlabel('time [s]');

%% quantize slightly rougher

figure;
y = y_orig;
Fs = Fs_orig;

delta = 0.01;
r = -1:delta:1;
d = r(1:end-1) + delta/2;

disp("Quantization resolution is " + delta);

[~,y] = quantiz(y,d,r);

sound(y,Fs);    

t = (1:length(y)) / Fs;
subplot(211);
plot(t,y);
xlabel('time [s]');

subplot(212);
idx = round(0.5*length(y)):(0.51*length(y));
plot(t(idx),y(idx));
xlabel('time [s]');

%% quantize even rougher

figure;
y = y_orig;
Fs = Fs_orig;

delta = 0.1;
r = -1:delta:1;
d = r(1:end-1) + delta/2;

disp("Quantization resolution is " + delta);

[~,y] = quantiz(y,d,r);

sound(y,Fs);    

t = (1:length(y)) / Fs;
subplot(211);
plot(t,y);
xlabel('time [s]');

subplot(212);
idx = round(0.5*length(y)):(0.51*length(y));
plot(t(idx),y(idx));
xlabel('time [s]');
