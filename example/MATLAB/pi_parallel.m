
function pi_parallel

n = 33554432;

for i = 1 : 50
  t = clock;
  my_pi = mypi_par(n);
  my_time = etime(clock, t);
  fprintf(1, '%6d  time:%6.2f pi:%16.12f\n', i, my_time, my_pi);
end

save res.mat;

end

function f = myf(x)

f = 4.0/(1.0 + x*x);

end

function pi = mypi_par(n)

a = 0.0;
b = 1.0;
dx = (b-a)/(n-1);

s = 0.0;
parfor i = 1 : n
  x = (i-1)*dx + a;
  fx = myf(x);
  s = s + fx;
end

s = (s - 0.5*(myf(a) + myf(b)))*dx;

pi = s;

end
