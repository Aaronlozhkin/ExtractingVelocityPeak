sound_speed = 1540; % m/s speed in the air should be the speed in blood
angle = 60;
f_source = 5.0 * 1e6;


envelope_smoothing = [5, 6, 7, 8, 9];
cut_thresh = [0.4, 0.5];

[file, path] = uigetfile('*.mp4;*.m4a;*.mp3;*.wav;*.avi');
file_path = [path, file];
[y,Fs] = audioread(file_path);
sound_data = y(:,1);

[s,f,t] = stft(sound_data,Fs,'Window',kaiser(256*4,5),'OverlapLength',223*4,'FFTLength',1024*4);

figure()
hold on

for m = 1:length(envelope_smoothing)
    for n = 1:length(cut_thresh)
        f = velocity_Envelope(envelope_smoothing(m), cut_thresh(n), s, f);
        
        plot(t, f)
        
        
        
    end
end




figure()
plot(T, Artery);
hold on
plot(t, f_change_overtime_envelope);