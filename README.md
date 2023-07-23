# ExtractingVelocityPeak

A collection of MATLAB scripts designed to take Terason, Siemens, or Transcranial Doppler ultrasound data and run a frequency analysis to extract the
velocity profile of blood moving through arteries in the body. The MATLAB graphical interface app allows an individual to pick a specific threshold
best suited for his/her own audio data. 

Tested on Common Carotid Artery, Internal Carotid Artery, Vertebral Artery, and Middle Cerebral Artery. Theoretically should be able to work on ultrasound of any artery.

![image](https://github.com/Aaronlozhkin/ExtractingVelocityPeak/assets/23532191/a2b7d585-0856-4e94-ae62-4e6edf5f39cf)


## Ultrasound Matrix Application
MATLAB application that outputs a fourier analysis of the audio file ranging from 0 to 5Khz. Has the capability to show both the highest velocity values and fourier analysis in one window, such that the user can easily find the optimal threshold. Users can also switch between different audio channels and select a destination path for output. 

## Velocity Matrix Script
Takes the output matrix of a short time fourier transform in the format [frequency x time] and outputs a filtered matrix with everything above the peak intensity equal to 0. Takes specific peak threshold as input along with fft matrix.

## Velocity Envelope Script
Outputs the highest intensity velocity envelope of an ultrasound fourier transform. Takes smoothfactor, threshold, matrix, and frequency index as input.

## Velocity Cleaning Script
Filters the velocity envelope to include phsyiologically sound values. Takes an unfiltered velocity envelope as input.
