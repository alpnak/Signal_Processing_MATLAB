# Image and Audio Signal Processing Project With MATLAB

MATLAB coursework project for Signals and Systems. The project applies core signals-and-systems concepts — convolution, the Fourier transform, filtering, and amplitude modulation — to real image and audio data. It contains seven MATLAB exercises split into two parts:

**Image Processing** (reading and inspecting RGB/grayscale images, pixel-level statistics and probability, histogram analysis, image arithmetic, downsampling and 2×2 pooling, edge detection via 2D convolution, and denoising)

**Audio Processing & AM Communication** (time- and frequency-domain analysis, echo via an impulse response, AM modulation/demodulation at two carrier frequencies, adding/removing white Gaussian noise with a Butterworth low-pass filter, and signal recovery). 

Each script is self-contained, runnable, commented in Turkish (as required by the course), and produces the figures and console output documented in the accompanying report. Running the scripts requires MATLAB (developed/tested on R2023b or later) with the Image Processing Toolbox (`rgb2gray`, `imnoise`, `imgaussfilt`, `imhist`, `imwrite`, `imfinfo`), the Signal Processing Toolbox (`butter`, `filter`, `awgn`, `conv`, `conv2`, `fft`), and audio I/O support (`audioread`, `audiowrite`, `sound`).

## Part 1 — Image Processing (Questions 1–6)

### Q1 — Reading and Displaying the Color Image

Original color image used throughout this part:

![Original lion image](aslan.jpeg)

A color image is 3-dimensional (x, y, color), where the color axis holds the red, green, and blue (RGB) intensity values.

**a)** Open the image in MATLAB and find its width and height in pixels.
**b)** Find the RGB values of the pixel at position (371, 371).
**c)** Display the image as a figure.

### Q2 — Grayscale Conversion, Histogram, and Region Recoloring

A grayscale image is 2-dimensional (x, y); each pixel holds a single intensity value between black and white.

**a)** Convert the color image to grayscale and display it as a figure.

![Grey-toned lion image](gri_aslan.png)

**b)** Find the value of the pixel at position (371, 371).

**c)** Plot the histogram of the grayscale image (x-axis: pixel intensity, y-axis: count).

![Grey-toned lion image histogram](gri_aslan_histogram.png)

**d)** Find the probability that a randomly chosen pixel has an intensity greater than 131.

**e)** Recolor the image using two thresholds (92 and 171): pixels ≤ 92 → black, 92 < pixels ≤ 171 → red, pixels > 171 → yellow. Display the result as a figure.

![Recolored lion image](aslan2.png)

**f)** Display, as a separate figure, the region between pixels 200 and 824 (both width and height) of the recolored image.

![Recolored lion image-2](aslan3.png)

### Q3 — Channel Averages, Mean Subtraction, and Image Inversion

**a)** Find the average color (R, G, B) value across all pixels of the color image.

**b)** Subtract these average values from every pixel and display the new image as a figure.

![Recolored lion image-3](aslan4.png)

**c)** Compute the inverse of the image — defined as the color values that complement the original values to 255 (i.e. 255 minus each pixel value) — and display it as a figure.

![Recolored lion image-4](aslan5.png)

**d)** Add the inverted image to the original image and display the result as a figure. What do you notice?

### Q4 — Downsampling and 2×2 Pooling

This question implements various downsampling methods to compress the image while trying to preserve as much quality as possible.

**a)** Find the size of the original color image in kilobytes.

**b)** Remove the even-indexed rows and columns and merge the remaining pixels; save the new image and find its size.

**c)** Keep only every 4th row and column (dropping the rest); save the new image and find its size. Display all three images (original, b, c) side by side in one figure.

**d)** Apply 2×2 max pooling, min pooling, and average pooling (each reducing the image to a quarter of its size) and display the three results together with the original in a 2×2 layout, along with their file sizes.

Max pooled lion image

![Max pooled](max_pooled.jpg)

Min pooled lion image

![Min pooled](min_pooled.jpg)

Average pooled lion image

![Average pooled](average_pooled.jpg)

**e)** Given image quality and file size, which method would you prefer? Compare and explain.

### Q5 — Edge Detection via Convolution

Original color image used throughout this part:

![Original city image](sehir.jpg)

The following 1×2 impulse response is applied to an image (convolution) to detect edges in it.

**a)** Open the city image in MATLAB and convert it to grayscale. Convolve it with the 1×2 impulse response matrix `h[i,j] = [0.02, -0.02]`. Display the new image alongside the original in a single figure and interpret the results.

Grey-toned city image

![Grey-toned city image](gri_sehir.jpg)

Convolved city image

![Convolved city image](konvolusyon_sehir.jpg)

### Q6 — Noise and Denoising

This question adds noise to the image and then filters it out.

**a)** Add Gaussian noise with variances 0.1, 0.4, and 0.7 to the color image using `imnoise`. Display the original image together with the three noisy versions in a single figure.

0.1 variance Gaussian noise added lion image

![0.1 variance lion image](01_varyans_aslan.jpg)

0.4 variance Gaussian noise added lion image

![0.4 variance lion image](04_varyans_aslan.jpg)

0.7 variance Gaussian noise added lion image

![0.7 variance lion image](07_varyans_aslan.jpg)

**b)** Apply a Gaussian filter (`imgaussfilt`) to the 0.1-variance noisy image. Display and compare the original, noisy, and filtered images side by side in one figure.

## Part 2 — Audio Processing & AM Communication (Question 7)

This part analyzes an audio signal in the time and frequency domains, adds echo, adds and removes noise, and performs the modulation/demodulation stages of AM communication.

Original input audio used throughout this part:

🔊 [gitar.wav — original guitar recording](gitar.wav)

### a) Loading and Inspecting the Audio Signal

Open and listen to the guitar audio in MATLAB. Find the sampling frequency, number of samples, and duration. Plot the signal over time.

Amplitude-time graph of guitar audio

![Guitar amplitude-time graph](gitar_genlik-zaman.jpg)

### b) Frequency Spectrum

Take the Fourier transform of the audio signal and plot its frequency spectrum. Interpret the result.

Amplitude-frequency graph of guitar audio

![Guitar amplitude-frequency graph](gitar_genlik-frekans.jpg)

### c) Adding Echo

Find an impulse response that adds echo to the sound: the output should contain the original signal, an echo at 1/4 the original amplitude after 1 second, and another echo at 1/16 the original amplitude after 2 seconds (`y[n] = x[n] + x[n-1]/4 + x[n-2]/16`). Apply the impulse response via convolution, save and listen to the output, find its duration, and compare it with the original signal. Plot its time-domain and frequency-spectrum graphs and compare them with the original.

🔊 [yankili_gitar.wav — echoed guitar recording](yankili_gitar.wav)

Echo added amplitude-time graph of guitar audio

![Echo added guitar amplitude-time graph](yankılı_gitar_genlik-zaman.jpg)

Echo added amplitude-frequency graph of guitar audio

![Echo added guitar amplitude-frequency graph](yankılı_gitar_genlik-frekans.jpg)

### d) AM Modulation at Two Carrier Frequencies

Multiply the echoed signal by `cos(2πfc·t)` to modulate it, using fc = 1 kHz and fc = 10 MHz to produce two different signals. Listen to both. What do you notice?

🔊 [modulated_1khz.wav — modulated at fc = 1 kHz](modulated_1khz.wav)

🔊 [modulated_10mhz.wav — modulated at fc = 10 MHz](modulated_10mhz.wav)

### e) Modulated Signal at fc = 10 MHz

Plot the time-domain and frequency-spectrum graphs of the signal modulated with the fc = 10 MHz carrier. What do you notice?

Modulated amplitude-time graph of guitar audio

![Modulated guitar amplitude-time graph](module_gitar_genlik-zaman.jpg)

Modulated amplitude-frequency graph of guitar audio

![Modulated guitar amplitude-frequency graph](module_gitar_genlik-frekans.jpg)

### f) Re-modulation, Low-Pass Filtering, and Demodulation

Multiply this signal again by `cos(2πfc·t)` (fc = 10 MHz) and inspect the frequency spectrum. Then pass it through a low-pass filter to demodulate it and inspect the frequency spectrum again.

Demodulated amplitude-frequency graph of guitar audio

![Demodulated guitar amplitude-frequency graph](demodule_gitar_genlik-frekans.jpg)

Filtered demodulated amplitude-frequency graph of guitar audio

![Filtered demodulated guitar amplitude-frequency graph](filtreli_demodule_gitar_genlik-frekans.jpg)

### g) Adding Noise

Add random noise to this signal — for example, White Gaussian Noise. Listen to the noisy audio and make sure the noise is audible. Plot its frequency spectrum.

🔊 [noisy_gitar.wav — demodulated signal with added noise](noisy_gitar.wav)

Noisy amplitude-time graph of guitar audio

![Noisy guitar amplitude-time graph](gurultulu_gitar_genlik-zaman.jpg)

### h) Filtering the Noise

Filter out this noise. Compare whether the resulting spectrum matches the echoed signal's spectrum.

Filtered noisy amplitude-frequency graph of guitar audio

![Filtered noisy guitar amplitude-frequency graph](filtreli_gurultulu_gitar_genlik-zaman.jpg)

### i) Recovering the Original Signal

Using the impulse response from part (c), recover the original signal. Save and listen to this audio. Plot its frequency spectrum. Is it the same as the first recording?

🔊 [recovered_gitar.wav — recovered original signal](recovered_gitar.wav)