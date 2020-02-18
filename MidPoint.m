function I = MidPoint(f,a,b,n)

h              = (b-a)/n;

result = 0; 

for i = 1: n-1   
result  = result+f(a+i*h);
end

I   = h*result;
end