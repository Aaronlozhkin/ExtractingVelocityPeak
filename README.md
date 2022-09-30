# ExtractingVelocityPeak

### Project Description: 

This project is a collection of MATLAB scripts intended to take Terason, Siemens, or Transcranial Doppler ultrasound data and run a frequency analysis to extract the
velocity profile of blood moving through arteries in the body. There are two MATLAB graphical interfaces that allow an individual to pick a specific threshold
best suited for his/her own audio data. The GUIs have the capability to show both the highest velocity values and fourier analysis in one window, 
so the user can easily find the optimal threshold. Users can also switch between different audio channels and select a destination path for output.

**velocityMatrixGUI** will output the entire fourier analysis of the audio file ranging from +/- 5Khz. 

**velocityEnvelopeGUI** will output only the velocity peak of the audio file. 

Tested on Common Carotid Artery, Internal Carotid Artery, Vertebral Artery, and Middle Cerebral Artery. Theoretically should be able to work on ultrasound of any artery.
