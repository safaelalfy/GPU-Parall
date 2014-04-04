function i = loop(num)
    
    i = zeros(num,1);
    x = 1 : 100;
    for j = 1 : num
        for k = 1: 100000
            fft(sin(x));
        end
        i(j) = j;
    end
end