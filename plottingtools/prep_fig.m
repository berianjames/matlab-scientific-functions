function prep_fig(handle,xlab,ylab,fsize)
if (nargin<4), fsize = 14; end;
% prepfig.m
%
% Prepares a simple Matlab plot figure for exporting (with exportfig, say).
% This amounts to making the axis ticks larger, adding labels.
%
% Input: handle (figure handle), xlab, ylab (strings for x- and
%  y-labels, with $math$ to be parsed by LaTeX, fsize (integer font size)
%
% Berian James, 2007

set(gca,'FontSize',fsize,'FontName','Palatino');
xlabel(xlab,'FontSize',fsize,'FontName','Palatino','Interpreter','latex');
ylabel(ylab,'FontSize',fsize,'FontName','Palatino','Interpreter','latex');