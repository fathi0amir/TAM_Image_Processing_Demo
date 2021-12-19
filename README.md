# TAM_Image_Processing_Demo

This is Matlab code I used to process transient absorption images to map lifetime, amplitude or etc pixel by pixel. 

I put together a demo file with the results. The code is commented as much as I could think of. I would say 
it's still a bit messy but it is functional and easy to follow. 

- "TAM_Image_Proc_20200421.mlx" main code
- "TAM_Demo.tiff" raw demo file
- "fit2ExpRDAnOffX_Mod.m" is the generated fitting model from the main code you
-  "tiff_stack.tiff" is generated as copy of the raw demo file
-  "tiff_stack_Par.tiff" are the mapped parameters in this case I only fit a single expontial so the image stack are amplitude, lifetime, rise times, baseline and offset amplitude
-  "tiff_stack_sim.tiff" is the simulated image based on the fitted results (a noise free copy of the original data)
-  "time_delay.txt" is the time stamp of the each step
