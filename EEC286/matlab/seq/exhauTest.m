function c = exhauTest(seqlen)
    % max seqlen = 2^11*8 = 16384

    x = zeros(1, 2^11); % Forward, 0 -> 1 would trigger x(1) be true
    y = zeros(1, 2^11); % Backward, 1 -> 0 would trigger y(2) be true
    c = zeros(1, seqlen);
    
    T = [repmat('100011', 1, 2^11), repmat('00', 1, 2^11)];
    
    if seqlen > length(T)
        seqlen = length(T);
    end
    
    isodd = true;
    state = repmat('0', 1, 11);
    for i = 1:seqlen
        t = T(i);
        state_c = gcounter_g(state, t, isodd);
        if isodd
            num = bin2dec(gray2bin(state));
            if t == '0'  
                y(num+1) = 1;
            elseif t == '1'
                x(num+1) = 1;
            end
        end
        
        state = state_c;
        isodd = ~isodd;
        c(i) = sum(x) + sum(y);
    end
end