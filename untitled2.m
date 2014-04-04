g = gpuDevice; 
maxMemory = 0.4*g.FreeMemory/1024^3; 
maxSizeSingle = floor(sqrt(maxMemory*1024^3/4)); 
maxSizeDouble = floor(sqrt(maxMemory*1024^3/8)); step = 1024; 
if maxSizeDouble/step >= 10 
step = step*floor(maxSizeDouble/(5*step));
end 
sizeSingle = 1024:step:maxSizeSingle/4; 
sizeDouble = 1024:step:maxSizeDouble/2; 
[cpu, gpu] = executeBenchmarks('single', sizeSingle,1); 
results.sizeSingle = sizeSingle; 
results.gflopsSingleCPU = cpu; 
results.gflopsSingleGPU = gpu; 
fig = figure; ax = axes('parent', fig); 
plot(ax, results.sizeSingle, results.gflopsSingleGPU, '-x', results.sizeSingle, ... 
results.gflopsSingleCPU, '-o') 
grid on; legend('GPU', 'CPU', 'Location', 'NorthWest'); 
title(ax, 'Single-precision performance'); 
ylabel(ax, 'Gigaflops'); xlabel(ax, 'Matrix size'); drawnow;

sizeDouble = 1024:step:maxSizeDouble/2; 
ylabel(ax, 'Gigaflops'); xlabel(ax, 'Matrix size'); drawnow; 
 [cpu, gpu] = executeBenchmarks('double', sizeDouble,1); 
 results.sizeDouble = sizeDouble; 
 results.gflopsDoubleCPU = cpu; 
 results.gflopsDoubleGPU = gpu; 
 fig = figure; ax = axes('parent', fig); 
 plot(ax, results.sizeDouble, results.gflopsDoubleGPU, '-x', results.sizeDouble, ... 
results.gflopsDoubleCPU, '-o') 
 grid on; legend('GPU', 'CPU', 'Location', 'NorthWest'); 
 title(ax, 'Double-precision performance'); 
 ylabel(ax, 'Gigaflops'); xlabel(ax, 'Matrix size'); drawnow;