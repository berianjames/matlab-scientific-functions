function [quot,rem] = PolynomialDivision(coeffs,div)
% Polynomial division
%  [quot,rem] = PolynomialDivision(coeffs,div)
%
%  Polynomials are represented as vectors of
%  coefficients, going from x^n down to x^0.
%   E.g., x^3 + 2x + 4 :: [1 0 2 4]
%
%  This routine calculates quotient and remainder such that
%   coeffs / div = quot + rem / div
%
%  J. Berian James, Sept. 2009

% Pad divisor array with any necessary zeros
div   = padarray(div,[0 length(coeffs)-length(div)],'pre');

% Calculate orders of polynomials
order = length(coeffs) - min(find(coeffs~=0));
dorder= length(div)    - min(find(div   ~=0));
pos = length(div) - dorder; % Position of leading divisor coefficient

% Division algorithm
rem  = coeffs;
for i = 1:order-dorder+1
    quot(i) = rem(i) / div(pos);
    rem = rem - circshift(div,[0 i-pos])*quot(i);
end

% Arrange output array
quot = padarray(quot,[0 length(rem)-length(quot)],'pre');