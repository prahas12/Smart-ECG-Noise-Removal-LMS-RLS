clc;
clear;
close all;

addpath(genpath('src'));

% Signal Parameters
fs = 360;              % Sampling frequency (Hz)
t  = 0:1/fs:5;         % Time vector (5 seconds)

% Synthetic Clean ECG Signal
ecg_clean = 1.2*sin(2*pi*1.7*t) + 0.25*sin(2*pi*2.3*t);

% Power-Line Interference (50 Hz)
noise = 0.4*sin(2*pi*50*t);

% Noisy ECG Signal
ecg_noisy = ecg_clean + noise;


% Adaptive Noise Cancellation
[~, lms_ecg] = lms_filter(ecg_noisy, noise);
[~, rls_ecg] = rls_filter(ecg_noisy, noise);

% ----------------VISUALIZATION--------------------

figure('Color','w','Position',[100 100 950 720], ...
       'Name','Smart ECG Noise Removal using Adaptive Filters');

tiledlayout(4,1,'Padding','compact','TileSpacing','compact');

% ---------------- Clean ECG -----------------------
nexttile;
plot(t, ecg_clean, 'k', 'LineWidth', 1.6);
title('Clean ECG Signal','FontSize',13,'FontWeight','bold');
ylabel('Amplitude');
grid on;

% ---------------- Noisy ECG -----------------------
nexttile;
plot(t, ecg_noisy, 'Color',[0.85 0.1 0.1], 'LineWidth', 1.1);
title('Noisy ECG with 50 Hz Power-Line Interference','FontSize',13,'FontWeight','bold');
ylabel('Amplitude');
grid on;

% ---------------- LMS Output ----------------------
nexttile;
plot(t, lms_ecg, 'Color',[0.1 0.4 0.8], 'LineWidth', 1.5);
title('ECG after LMS Adaptive Filtering','FontSize',13,'FontWeight','bold');
ylabel('Amplitude');
text(0.02,0.85,'Slower convergence','Units','normalized', ...
     'FontSize',11,'Color',[0.1 0.4 0.8]);
grid on;

% ---------------- RLS Output ----------------------
nexttile;
plot(t, rls_ecg, 'Color',[0.1 0.6 0.3], 'LineWidth', 1.5);
title('ECG after RLS Adaptive Filtering','FontSize',13,'FontWeight','bold');
xlabel('Time (s)');
ylabel('Amplitude');
text(0.02,0.85,'Faster convergence','Units','normalized', ...
     'FontSize',11,'Color',[0.1 0.6 0.3]);
grid on;

%--------------COMPARISON FIGURE (SHOWCASE)---------------

figure('Color','w','Position',[150 150 950 320]);

plot(t, ecg_noisy, ':', 'Color',[0.6 0.6 0.6], 'LineWidth',1); hold on;
plot(t, lms_ecg, 'b', 'LineWidth',1.4);
plot(t, rls_ecg, 'g', 'LineWidth',1.4);

legend('Noisy ECG','LMS Output','RLS Output','Location','best');
title('Performance Comparison of LMS and RLS Adaptive Filters', ...
      'FontSize',14,'FontWeight','bold');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

