# Smart ECG Noise Removal using Adaptive Filters (LMS & RLS)

This repository presents a **MATLAB-based implementation of Adaptive Noise Cancellation (ANC)**
for removing **50 Hz power-line interference** from ECG signals using
**Least Mean Square (LMS)** and **Recursive Least Squares (RLS)** adaptive algorithms.

The project emphasizes **core Digital Signal Processing (DSP) principles**
and a transparent algorithmic implementation rather than black-box filtering.

---

## 📌 Problem Overview
Electrocardiogram (ECG) signals are highly susceptible to power-line interference,
which degrades signal quality and may affect further analysis or diagnosis.

Since the characteristics of interference can vary over time, **fixed filters are often insufficient**.
Adaptive filters overcome this limitation by continuously updating their coefficients
based on the incoming signal statistics.

---

## 🎯 Objective
- To model power-line interference in ECG signals
- To implement an **Adaptive Noise Canceller (ANC)** framework
- To compare the performance of LMS and RLS adaptive algorithms
- To analyze convergence behavior and signal quality preservation

---

## ⚙️ Methodology
1. A synthetic ECG signal is generated
2. 50 Hz sinusoidal noise is added to simulate power-line interference
3. A reference noise signal is supplied to the adaptive filter
4. LMS and RLS algorithms update **multi-tap FIR filter coefficients**
5. The **error signal is treated as the denoised ECG output**

---

## 🧮 Algorithms Implemented

### 🔹 Least Mean Square (LMS)
- Gradient-based adaptive algorithm
- Simple and computationally efficient
- Slower convergence

### 🔹 Recursive Least Squares (RLS)
- Minimizes weighted least squares error
- Faster convergence
- Improved noise suppression

Both algorithms are implemented using a **multi-tap FIR adaptive filter structure**.

---

## 📊 Results & Discussion
- LMS achieves gradual noise reduction with stable convergence
- RLS converges faster and provides superior interference rejection
- ECG waveform morphology is preserved in both cases
- RLS demonstrates better performance for real-time biomedical applications

---

## 📁 Project Directory Structure
```
Smart-ECG-Noise-Removal-LMS-RLS/
│
├── main.m                # Main execution script
│
├── src/
│   ├── lms_filter.m      # LMS adaptive filter implementation
│   └── rls_filter.m      # RLS adaptive filter implementation
│
└── README.md             # Project documentation
```

---

## 🛠 Tools & Concepts
- MATLAB
- Digital Signal Processing
- Adaptive Filtering
- Biomedical Signal Processing
- FIR Filter Design

---

## ▶️ How to Run
1. Open MATLAB or MATLAB Online
2. Ensure all files are in the same project directory
3. Run `main.m`
4. Observe time-domain plots comparing LMS and RLS performance

---

## 📌 Conclusion
This project demonstrates the effectiveness of adaptive filtering techniques
for ECG noise removal. While LMS offers simplicity and stability, RLS provides
faster convergence and improved noise suppression, making it more suitable
for real-time biomedical signal processing applications.

---

## 🔮 Future Scope
- Use real ECG datasets (e.g., MIT-BIH Arrhythmia Database)
- Quantitative performance evaluation using SNR improvement
- Extension to real-time adaptive filtering
- Hardware implementation using DSP processors
