function logaxislabels(Axis)
% Modifies labels on a logarithmic axis to display
% as, e.g., 0.01 instead of 10^2. Looks a bit more professional, really.
%  Just use: logaxislabels(Axis), where Axis is the
%                                 Axes set you want to modify.
%  Usually: logaxislabels(gca) will nail it.
%
% Berian James, 2008

xlabels = get(gca,'XTick');
ylabels = get(gca,'YTick');
zlabels = get(gca,'ZTick');

if nargin<2

    xlabels(find(abs(log10(xlabels))>3)) = log10(xlabels(find(abs(log10(xlabels))>3)));
    ylabels(find(abs(log10(ylabels))>3)) = log10(ylabels(find(abs(log10(ylabels))>3)));
    zlabels(find(abs(log10(zlabels))>3)) = log10(zlabels(find(abs(log10(zlabels))>3)));

end


set(gca,'XTickLabel',xlabels);
set(gca,'YTickLabel',ylabels);
set(gca,'ZTickLabel',zlabels);

end
