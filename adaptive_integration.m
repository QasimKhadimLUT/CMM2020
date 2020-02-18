function [I,n,E] = adaptive_integration(f,F,a, b, eps, method)

% Defining the number of divisions
 n              = length(eps);
 h              = (b-a)/n;
 
% Exact solution
 Exact          = F(b)-F(a);

 
 
% Trapezoidal method   

if strcmp ('Trapezoidal',method)
result = 0.5*f(a)+0.5*f(b); 

for i = 1: n-1   
 
result  = result+f(a+i*h);
error   = Exact-result;

if error < eps(i)
        break
end

Result   = h*result;
 n(:,i)  = i;   
 E(:,i)  = log(eps(i)); 
end

% Midpoint method   
elseif strcmp ('MidPoint',method)
    result =0;
    
for i = 1: n-1
    
result  = result+f(a+(h/2)+i*h);
error   = Exact-result;

if error < eps(i)
        break
end

Result   = h*result;
 n(:,i)    = i;   
end
    
else
    disp ('Integration method is not yet programmed')
end

I       = Result;
n       = n+1;
E       = log(E);

end