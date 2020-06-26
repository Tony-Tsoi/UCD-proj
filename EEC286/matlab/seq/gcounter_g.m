function state_c = gcounter_g(state, in, isodd)
    statelen = 11;
    
    % Convert to non-Gray decimal
    count = bin2dec(gray2bin(state));
    
    % Logic
    if isodd
        if in == '0'
            count = count - 1;
        elseif in == '1'
            count = count + 1;
        else
            disp(in);
            error('invalid input: in');
        end
    end
    
    % Overflow
    if count >= (2^statelen)
        count = 0;
    end
    if count < 0
        count = 2^statelen - 1;
    end
    
    % Next State Logic
    countb = dec2bin(count);
    if length(countb) < statelen
        countb = [char(48*ones(1, statelen-length(countb))), countb];
    end
    state_c = bin2gray(countb);
end