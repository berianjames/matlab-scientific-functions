function si = sigma_integral(r)
global COSMOLOGY

nint=249; % Number of steps
sum = 0;
for i = 1:nint
    t = (i-0.5)/nint;
    y = -1 + 1/t;
    rk4 = y;
    d2=power_spectrum(rk4);

    x=y.*r;
    w=(3./x.^3).*(sin(x)-x.*cos(x));

    sum = sum + w.^2 .* d2 ./ y ./ t^2;
end

sum=sum/nint;
si=sqrt(sum);

end