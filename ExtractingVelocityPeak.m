

%% define basic parameters
sound_speed = 1540; % m/s speed in the air should be the speed in blood
angle = 60;
f_source = 5.0 * 1e6;

[file, path] = uigetfile('*.mp4;*.m4a;*.mp3;*.wav;*.avi');
file_path = [path, file];
[y,Fs] = audioread(file_path);
sound_data = y(:,1);

%% low pass filter orignal sound file
sound_data = lowpass(sound_data,5,Fs);

[s,f,t] = stft(sound_data,Fs,'Window',kaiser(256*4,5),'OverlapLength',223*4,'FFTLength',1024);

for i = 1 : size(s, 2)
    
    ind = find(abs(s(:,i)) < 0.5);
    s(ind, i) = complex(0,0);
    
    % find corresponding f
end

% build frequence change data

f_change_overtime = zeros(size(s,2), 1);
f_mag_overtime = zeros(size(s,1),size(s,2));

for i = 1 : size(s, 2)
    f_mag_overtime(:, i) = abs(s(:,i)); %Builds a vector which has magnitudes for each frequency for every point in time. 
end

f_mag_overtime = f_mag_overtime(475:549, :);
f = f(475:549, :);

f_envelope = zeros(size(s,2), 1);
f_maxMag = zeros(size(s,2), 1);

for i = 1 : size(s,2)
    x = find(f_mag_overtime(:,i) > 0,1,'First');
    if isempty(x)
        f_envelope(i) = 0;
    else
        f_envelope(i) = abs(f(x));
    end
    
    f_maxMag(i) = abs(f(find(f_mag_overtime(:,i) == max(f_mag_overtime(:,i)),1,'Last')));
    
end




% frequency change over time
figure()
hold on;
plot(f_envelope);

% f_envelope = lowpass(f_envelope,5,Fs);
f_change_overtime_envelope = envelope(f_envelope, 10, 'peak');
plot(f_change_overtime_envelope);

vSpectrogram = 100*f_change_overtime_envelope*sound_speed/(2*f_source*cosd(angle));