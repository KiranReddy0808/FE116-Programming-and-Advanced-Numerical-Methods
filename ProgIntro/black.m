% Implements the Black pricing formula for a call option
% F: forward price for maturity T
% K: strike
% T: time to maturity
% r: risk free rate, continuosly compounded
% vol: volatility
function price = black (F, K, T, r, vol)
   B = exp(-r * T);
   stdev = vol * sqrt(T);
   d1 = log(F./K) ./ stdev + 0.5 * stdev;
   d2 = d1 - stdev;
   nd1 = normcdf(d1);  % the function normcdf is available in Matlab
   nd2 = normcdf(d2);
   price = B .* ( F .* nd1 - K .* nd2 );
end
