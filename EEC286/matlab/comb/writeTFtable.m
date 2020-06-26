function writeTFtable(f)
    fileID = fopen('tf.txt', 'w');
    inlen = 13;

    for in = 0:(2^inlen-1)
        in2 = dec2bin(in);
        if length(in2) < inlen
            in2 = [char(48*ones(1, inlen-length(in2))), in2];
        end
        out = f(in2);
        fprintf(fileID, '%s = %s\n', in2, out);
    end
    
    fclose(fileID);
end