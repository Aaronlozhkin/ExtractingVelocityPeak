function f = velocity_Matrix(fft, thresh)
    
%     fft(abs(fft) < thresh) = complex(0,0);
    
% %     f_mag_overtime = zeros(size(fft,1),size(fft,2));
% % 
% %     for i = 1 : size(fft, 2)
% %         f_mag_overtime(:, i) = abs(fft(:,i)); 
% %     end
    
%     f = abs(fft);

    temp = fft;

    temp(abs(temp) < thresh) = 0;

    for i = 1 : size(fft,2)
        x = find(temp(:,i) > 0,1,'First');
        
        fft(1:x,i) = 0; 
        
    end
    
    f = fft;
end