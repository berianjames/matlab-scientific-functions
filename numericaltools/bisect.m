function index = bisect(array,values)
% Implementation of 1-d bisection, written as an exericse, but used frequently.
%
% Input: array (vector of scalar values)
%        values (vector of bisection locations to find)
% Output: index (vector of bisection indices)
%
% Berian James, 2005

epsilon = 0.5;

for i = 1:length(values)
    left = 1; right = length(array)+1;

    %Start loop
    while (abs(right - left) > 2*epsilon)

        %Calculate midpoint of domain
        midpoint = ceil((right + left) / 2);

        %Find f(midpoint)
        if ( 1 == (values(i) > array(midpoint)) )
            left = midpoint; %Throw away left half
        else
            right = midpoint; %Throw away right half
        end
    end

    index(i) = left;
end
end