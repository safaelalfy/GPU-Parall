N = 256; index1 = 1i*[0:N-1 0 1-N:-1]; 
index1 = gpuArray(index1); 
index2=exp(index2); % calculation on GPU 
plot(index2) % directly plot results 
c=gather(index2);