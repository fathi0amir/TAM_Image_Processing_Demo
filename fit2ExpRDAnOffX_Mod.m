function out = fit2ExpRDAnOffX_Mod(x, tData)

  ax1 =  1572;
  ax2 =  0.44;
  tx1 =  -0.66;
  tx2 =  2.7;
  sx1 =  2;
  sx2 =  8.5;
   a1 =  x(1 , 1);
   t1 =  x(2 , 1);
   a2 =  0;
   t2 =  700;
 t_rd =  x(3 , 1);
a_off =  x(4 , 1);
t_off =  100000;
 base =  x(5 , 1);
   t0 =  7.9;
 FWHM =  0.52;

k1 = 1/t1;
k2 = 1/t2;
k_rd = 1/t_rd;
k_off = 1/t_off;
ts = tData - t0;
sigma = FWHM/2.35483;

x_neg = -1/(sqrt(2 * pi)) * exp(-(ts + tx1).^2/(2 * (sx1 * sigma)^2));
x_pos = +1/(sqrt(2 * pi)) * exp(-(ts - tx2).^2/(2 * (sx2 * sigma)^2));
exp_rd = 0.5 * exp(1/2 * k_rd * (-2 * ts + k_rd * sigma^2));
err_rd = erfc((k_rd * sigma^2 - ts)/(sigma * sqrt(2)));
exp1 = 0.5*exp(1/2 * k1 * (-2 * ts + k1 * sigma^2));
err1 = erfc((k1 * sigma^2 - ts)/(sigma * sqrt(2)));
exp2 = 0.5*exp(1/2 * k2 * (-2 * ts + k2 * sigma^2));
err2 = erfc((k2 * sigma^2 - ts)/(sigma * sqrt(2)));
exp_off = 0.5*exp(1/2 * k_off * (-2 * ts + k_off * sigma^2));
err_off = erfc((k_off * sigma^2 - ts)/(sigma * sqrt(2)));

comp_x = ax1 * (x_neg + ax2 * x_pos);
comp1 = -a1 * k_rd / (k1 - k_rd) * abs((exp_rd .* err_rd - exp1 .* err1));
comp2 = -a2 * k_rd / (k2 - k_rd) * abs((exp_rd .* err_rd - exp2 .* err2));
comp_off = a_off * (exp_off .* err_off);

out=base + comp_x + comp1 + comp2 + comp_off;

end
