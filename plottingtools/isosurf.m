function isosurf(field,isoval,exc)
% Draw isosurface surface through field excising region above (default)
%  or below a specified critical values. 
%
% Input: field (3-d array of scalar values)
%        isoval (float, critical density for isosurface)
%        exc (string, either 'above' or 'below', determining whether
%             the enclosed isosurface volume is above or below the threshold)
%
% Usage: isosurf(field,isoval[,exc])
%  e.g., isosurf(field,0.5), isosurf(field,exp(pi),'below')
%
% Berian James, 2010

%% Parse arguments
switch nargin
    case 0, disp('Use: isosurf(field,isoval[,exc])'); return;
    case 1, isoval = minn(field);
    case 2, exc = 'above';
end
N = size(field);

if strcmp(exc,'above') == 0
    inrange = find(field > -255);
    field(inrange) = isoval + (isoval-field(inrange));
end

%% Isosurface plotting
scrsz = get(0,'ScreenSize');
h = figure('Position',[1 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2]);
for i = 1:length(isoval)
    
    p = patch(isosurface(field,isoval(i)),...
        'FaceColor',[1 0 0] *(i/length(isoval)),...
        'EdgeColor','none',...
        'AmbientStrength',.2,...
        'SpecularStrength',.7,...
        'DiffuseStrength',.4);
    isonormals(field,p);
    patch(isocaps(field,isoval(i)),...
        'FaceColor','interp',...
        'EdgeColor','none');
    
end

%% Postrendering
daspect([1 1 1]);
axis ([1 N(2) 1 N(1) 1 N(3)]);
camlight right;
camlight left;
set(gcf,'Renderer','zbuffer');
lighting phong;