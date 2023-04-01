function f = velocityCleaner(vSpectrogram)
    
    % Identifies outlier values in a velocity value and removes values
    % around that outlier until it levels out at the median.
    
    average = median(vSpectrogram);
    placeHolder = NaN;
    locs = find(vSpectrogram < -50 | vSpectrogram > 300);

    if ~isempty(locs)
        
        band = find(vSpectrogram < average+2 & vSpectrogram > average-2);

        for i = 1 : length(locs)
            index = band - locs(i);

            id1 = max(index(index < 0));
            id2 = min(index(index > 0));

            if (isempty(id1))
                vSpectrogram(1:id1+locs(i)) = placeHolder;
            elseif (isempty(id2))
                vSpectrogram(id1+locs(i):end) = placeHolder;
            else
                vSpectrogram(id1 + locs(i):id2+locs(i)) = placeHolder; 
            end
        end
    end
    
    f = vSpectrogram;

end
