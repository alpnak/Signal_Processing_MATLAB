# ELE371-Signals-Systems-Image-Audio-Processing

MATLAB coursework project for **ELE 371 – Signals and Systems** (TOBB University of Economics and Technology, Spring 2024). The project applies core signals-and-systems concepts — convolution, the Fourier transform, filtering, and amplitude modulation — to real image and audio data.

## Description

This repository contains seven MATLAB exercises split into two parts:

- **Image Processing** – reading and inspecting RGB/grayscale images, pixel-level statistics and probability, histogram analysis, image arithmetic (inversion, thresholding/color-mapping), downsampling and 2×2 pooling (max/min/average), edge detection via 2D convolution, and denoising with Gaussian noise and Gaussian filtering.
- **Audio Processing & AM Communication** – time- and frequency-domain analysis of an audio signal, adding echo via an impulse response, AM modulation/demodulation at two carrier frequencies, adding and removing white Gaussian noise with a Butterworth low-pass filter, and signal recovery.

Each script is self-contained, runnable, and commented in Turkish (as required by the course), and produces the figures and console output documented in the accompanying report.

## Repository Structure

```
.
├── soru1.m                       # Q1: Read RGB image, pixel dimensions, RGB values, display
├── soru2.m                       # Q2: Grayscale conversion, histogram, probability, thresholding/color-map, cropping
├── soru3.m                       # Q3: Channel averages, mean subtraction, image inversion, image + inverse
├── soru4.m                       # Q4: File size, row/column decimation, 2x2 max/min/average pooling
├── soru5.m                       # Q5: Grayscale conversion + 1x2 impulse response convolution (edge detection)
├── soru6.m                       # Q6: Gaussian noise (var 0.1/0.4/0.7) + Gaussian filtering
├── soru7.m                       # Q7: Audio analysis, echo, AM modulation/demodulation, noise, filtering
├── aslan.jpeg                    # Input color image used in Q1–Q4 and Q6
├── sehir.jpg                     # Input color image used in Q5
├── gitar.wav                     # Input audio file used in Q7
├── ELE371_Proje.pdf              # Original assignment/project brief
├── Alperen_Nakiboglu_Proje_Rapor.pdf   # Final project report (methodology, results, figures)
└── README.md
```

> Note: `soru1.m`–`soru6.m` assume `aslan.jpeg`/`sehir.jpg` are loaded in the same working directory, and later scripts reuse variables created by earlier ones (e.g. `soru2.m`–`soru4.m` build on `aslan_resim` from `soru1.m`). Run them in order within the same MATLAB session, or open the project as a single script split into `%%` sections.

## Part 1 — Image Processing (Questions 1–6)

| Question | Topic |
|---|---|
| Q1 | Load a JPEG, find image dimensions, read RGB values at a given pixel, display the image |
| Q2 | Convert to grayscale, read pixel intensity, plot histogram, compute empirical probability via Monte Carlo sampling, threshold/recolor by intensity bands, crop a region |
| Q3 | Compute per-channel (R/G/B) means, subtract means from the image, invert the image (255 − pixel), sum image and inverse |
| Q4 | Compute file size in kB, downsample by dropping even/every-4th rows & columns, implement 2×2 max/min/average pooling from scratch, compare quality vs. compression |
| Q5 | Convert a city image to grayscale and convolve with a 1×2 edge-detection kernel `[0.02, -0.02]` |
| Q6 | Add Gaussian noise at three variances (0.1, 0.4, 0.7) and apply Gaussian filtering for denoising |

## Part 2 — Audio Processing & AM Communication (Question 7)

- Load and play a guitar audio clip; determine sampling rate, sample count, and duration; plot the time-domain signal.
- Compute and plot the frequency spectrum via FFT.
- Add echo using the impulse response `y[n] = x[n] + x[n-1]/4 + x[n-2]/16` (via convolution) and compare with the original.
- Amplitude-modulate the echoed signal with carriers at 1 kHz and 10 MHz and compare the results.
- Plot the modulated signal's time/frequency behavior at fc = 10 MHz.
- Re-modulate and demodulate with a Butterworth low-pass filter; inspect the recovered spectrum.
- Add white Gaussian noise (`awgn`) and inspect the resulting spectrum.
- Filter the noisy signal with a higher-order Butterworth low-pass filter and compare with the echoed signal's spectrum.
- Recover the original signal using the echo's impulse response and compare with the original recording.

## Requirements

- MATLAB (developed/tested on R2023b or later)
- Image Processing Toolbox (`rgb2gray`, `imnoise`, `imgaussfilt`, `imhist`, `imwrite`, `imfinfo`)
- Signal Processing Toolbox (`butter`, `filter`, `awgn`, `conv`, `conv2`, `fft`)
- Audio I/O support (`audioread`, `audiowrite`, `sound`)

## How to Run

1. Clone the repository and open it as the MATLAB working directory.
2. Ensure `aslan.jpeg`, `sehir.jpg`, and `gitar.wav` are present in the same folder.
3. Run `soru1.m` through `soru6.m` in order for the image-processing part (each `%%` section can also be run cell-by-cell in the MATLAB Editor).
4. Run `soru7.m` independently for the audio/AM communication part.
5. Figures are generated automatically; some sections play audio aloud and pause execution while doing so.

## Author

Alperen Nakiboğlu — TOBB University of Economics and Technology, Electrical-Electronics Engineering (Student No. 211201062)

## Course

ELE 371 – Signals and Systems, Spring 2024, TOBB University of Economics and Technology

## License

For academic/educational use. Add a license of your choice (e.g. MIT) if you intend to share this repository publicly.
