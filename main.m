
clc;
clear;
close all;

addpath(genpath('src'));

fs = 360;
t  = 0:1/fs:5;

ecg_clean = 1.2*sin(2*pi*1.7*t) + 0.25*sin(2*pi*2.3*t);
noise = 0.4*sin(2*pi*50*t);
ecg_noisy = ecg_clean + noise;

[~, lms_ecg] = lms_filter(ecg_noisy, noise);
[~, rls_ecg] = rls_filter(ecg_noisy, noise);

figure('Color','w','Position',[100 100 950 720]);
tiledlayout(4,1,'Padding','compact','TileSpacing','compact');

nexttile; plot(t, ecg_clean,'k','LineWidth',1.6); title('Clean ECG Signal','FontWeight','bold'); grid on;
nexttile; plot(t, ecg_noisy,'r','LineWidth',1.1); title('Noisy ECG with 50 Hz Interference','FontWeight','bold'); grid on;
nexttile; plot(t, lms_ecg,'b','LineWidth',1.5); title('ECG after LMS Adaptive Filtering','FontWeight','bold'); grid on;
nexttile; plot(t, rls_ecg,'g','LineWidth',1.5); title('ECG after RLS Adaptive Filtering','FontWeight','bold'); grid on;
