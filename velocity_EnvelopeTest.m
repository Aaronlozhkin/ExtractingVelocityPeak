function f = velocity_EnvelopeTest(smooth, thresh, step, thresh_percent, fft, freq)

%     Plan for this function: create a function which, for every point in
%     time, will find the first value from frequency 0 that is above the
%     threshold and then creep from that index to any other nearby above
%     frequencies that are a certain percentage of the threshold value. All
%     other values will be cut. 
    
    f_mag_overtime = abs(fft);
    f_envelope = zeros(size(fft,2), 1);

    for i = 1 : size(fft,2)
       x = find(f_mag_overtime(:,i) > thresh,1,'First');
        if isempty(x)
            f_envelope(i) = 0;
        else
            y = find(f_mag_overtime(x-step:x,i) > thresh*thresh_percent, 1, 'First')
            f_envelope(i) = abs(freq((x-(step+1)+y)));   
        end
    end
    
%     f_envelope = envelope(f_envelope, smooth, 'peak');
    
    f = f_envelope;
    
end

