function f = velocityMatrix(fft, thresh)
    
    fft = abs(gather(fft));
    temp = abs(gather(fft));

    temp(abs(temp) < thresh) = 0;

    for i = 1 : size(fft,2)
        x = find(temp(:,i) > 0,1,'First');
        
        fft(1:x,i) = 0; 
        
    end
    
    f = fft;
end