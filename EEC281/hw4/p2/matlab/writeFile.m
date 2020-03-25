f = fopen('./image_init.txt', 'w');
global counter
counter = 0;

for i = 0:22
    for j = 0:22
        d = nextNum();
        % if (d > 253) d = 253; end
        a = dec2bin(d);
        b = dec2bin(d);
        c = dec2bin(d);
        if length(a) < 8
            a = [char(48*ones(1, 8-length(a))), a];
        end
        if length(b) < 8
            b = [char(48*ones(1, 8-length(b))), b];
        end
        if length(c) < 8
            c = [char(48*ones(1, 8-length(c))), c];
        end
        fprintf(f, strcat(a, b, c));
    end
    fprintf(f, "\n");
end

fclose('all');

function n = nextNum()
    global counter
    n = counter + 1;
    if n > 255
        n = 0;
    end
    counter = n;
end