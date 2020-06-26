% Golden Reference for ALU Combinational Circuit
function bso = alu_g (bsi)
    outlen = 6;

    % 3b op, 5b in1, 5b in2
    opc = bin2dec(bsi(1:3));
    in1 = bin2dec(bsi(4:8));
    in2 = bin2dec(bsi(9:13));
    
    % 2's compliment
    if in1 >= 2^4
        in1 = -1*(2^5-in1);
    end
    if in2 >= 2^4
        in2 = -1*(2^5-in2);
    end
    
    % Logic
    switch opc
        case 0
            out = in1 + in2;
        case 1
            out = in1 - in2;
        case 2
            in2 = bin2dec(bsi(11:13));
            out = in1 * 2^in2;
        case 3
            in2 = bin2dec(bsi(11:13));
            out = floor(in1 / 2^in2);
        case 4
            in1 = bsi(4:8) - 48;
            in2 = bsi(9:13) - 48;
            out = or(in1, in2);
            bso = ['0',char(out + 48)];
            return;
        case 5
            in1 = bsi(4:8) - 48;
            in2 = bsi(9:13) - 48;
            out = and(in1, in2);
            bso = ['0',char(out + 48)];
            return;
        case 6
            in1 = bsi(4:8) - 48;
            in2 = bsi(9:13) - 48;
            out = xor(in1, in2);
            bso = ['0',char(out + 48)];
            return;
        case 7
            out = 0;
        otherwise
            error('invalid opc');
    end
    
    % Convert 2's compliment, crop to 6 bit output
    if out < 0
        out = 2^outlen +out;
    end
    out = mod(out, 2^outlen);
    bso = dec2bin(out);
    if length(bso) < outlen
        bso = [char(48*ones(1, outlen-length(bso))), bso];
    end
    if length(bso) > outlen
        bso = bso((length(bso)-outlen+1):end);
    end
end