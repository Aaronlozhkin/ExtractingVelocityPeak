function f = velocityCleaner(vSpectrogram)
    average = median(vSpectrogram);
    locs = find(vSpectrogram < 0 | vSpectrogram > 450);

    if ~isempty(locs)

        for i = 1 : length(locs)
            index = find(vSpectrogram < average+2 & vSpectrogram > average-2) - locs(i);

            id1 = max(index(index < 0));
            id2 = min(index(index > 0));

            if (isempty(id1))
                vSpectrogram(1:id1+locs(i)) = average;
            elseif (isempty(id2))
                vSpectrogram(id1+locs(i):end) = average;
            else
                vSpectrogram(id1 + locs(i):id2+locs(i)) = average; 
            end
        end
    end
    
    f = vSpectrogram;

end