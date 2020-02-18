
function application()

%% 2.2.1: Adaptive_integration(f, F, a, b, eps, method=midpoint)
% is written. The function takes function, its analytical solution,
% interval and prescribed tolerances as inputs. It results in the
% integration value, nth step and log of eps at which rror less than a prescribed tolerance.
 
% Check adaptive integration file
%% 2.2.2: Using the f1 and f2 in the Adaptive_integration.

% Interval a and b
a   = 0;
b   = 2;

% Prsecribed tolerances
eps = linspace (10^(-10),10^(-1),1000);


% % Integration methods and functions
T            = 'Trapezoidal';
M            = 'MidPoint';

f1           = @ (t) t.^2;
f2           = @ (t) sqrt(t);

% Analytical soltion
A1          = @(t) (t.^3/3) ;
A2          = @(t)(2/3) *(t.^(3/2)) ;


% The user type T or M for integration methods and f1 and f2 for functions
method       = input('method:');
f            = input('Functions:');
A            = input('Analytical:');


[Result,n,E] = adaptive_integration(f,A, a, b, eps, method);

%% Plotting the results




plot(E,n,'k','LineWidth',1.5)
xlabel('Logarithmic of tolerances')
ylabel('Number of steps')
grid on
title('Graph between tolerances and number of steps')    
print('Fig1','-deps')
  
end
