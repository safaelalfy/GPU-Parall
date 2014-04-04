function [gflopsCPU, gflopsGPU] = executeBenchmarks(clz, sizes, igpu) 
 fprintf(['Starting benchmarks with %d different %s-precision ' ... 
 'matrices of sizes\nranging from %d-by-%d to %d-by-%d.\n'], ... 
 length(sizes), clz, sizes(1), sizes(1), sizes(end), ... 
 sizes(end)); 
 gflopsGPU = zeros(size(sizes)); 
 gflopsCPU = zeros(size(sizes)); 
 gd = gpuDevice(igpu); 
 for i = 1:length(sizes) 
 n = sizes(i); 
 [A, b] = getData(n, clz); 
 gflopsCPU(i) = benchFcn(A, b, @waitForCpu); 
% fprintf('Gigaflops on CPU: %f\n', gflopsCPU(i)); 
 A = gpuArray(A); 
 b = gpuArray(b); 
 gflopsGPU(i) = benchFcn(A, b, @() waitForGpu(gd)); 
 fprintf('Gigaflops on GPU: %f on Device %d \n', gflopsGPU(i),igpu); 
 end 
end