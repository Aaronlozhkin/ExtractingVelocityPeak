function f = velocity_Envelope(smooth, thresh, s, f)


    for i = 1 : size(s, 2)

        ind = find(abs(s(:,i)) < thresh);
        s(ind, i) = complex(0,0);

        % find corresponding f
    end
    
    f_mag_overtime = abs(s);
    f_envelope = zeros(size(s,2), 1);

    for i = 1 : size(s,2)
        x = find(f_mag_overtime(:,i) > 0,1,'First');
        if isempty(x)
            f_envelope(i) = 0;
        else
            f_envelope(i) = abs(f(x));
        end

    end

    % f_envelope = lowpass(f_envelope,5,Fs);
    f = envelope(f_envelope, smooth, 'peak');
end

