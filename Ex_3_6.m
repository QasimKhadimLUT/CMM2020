
function application()

% Interval a and b
a = 0;
b = 1;


% Function
f = @ (t) 6*(10^8)*(t)-4*(10^6);

% Analytical soltion
A = @(t)  3*(10^8)*(t^2)-4*(10^6)*t;

%% 2.1.1 Hand computed results
h                = 0.5;

Hand_computed    = (1/2)*h*(f(0)+f(0.5))+ (1/2)*h*(f(0.5)+f(1));

%% 2.1.2 Solving a problem without numerical errors

% User defines the number of divisions between the interval 
n1                = input('n1:')
n2                = input('n2:')


% Exact analytical solution
Exact            = A(b)-A(a);

% Trapezoidal integration method
Lin_Num_Trape1  = Trape(f,a,b,n1);
Lin_Num_Trape2  = Trape(f,a,b,n2);

% Error
E1              = Exact-Lin_Num_Trape1;
E2              = Exact-Lin_Num_Trape1;

%% 2.1.3 Convergence rates

% A non-linear function v and its analytical solution is used to check the
% convergence rate. In the case of linear function, it is 0.

v               = @(t) 3*(t^2)*exp(t^3);
V               = @(t) exp(t^3);
Exact1          = V(b) - V(a);


Num_Trape1      = Trape(v,a,b,n1);
Num_Trape2      = Trape(v,a,b,n2);


E1_n            = Exact1-Num_Trape1;
E2_n            = Exact1-Num_Trape2;

r_linear        = (log(E1/E2))/(log(n1/n2));
r_nonlinear     = (log(E1_n/E2_n))/(log(n1/n2));


fprintf("Hand_computed= %.16f,Linear_error1= %.16f, Linear_error2= %.16f, Convergence rate for linear function = %.16f, Convergence rate for non linear function= %.16f ",Hand_computed, E1, E2, r_linear,r_nonlinear)



end