% function [outputArg1,outputArg2] = get_constrainted_zonotope(x_zonotope,inputArg2)
% %GET_CONSTRAINTED_ZONOTOPE Summary of this function goes here
% %   Detailed explanation goes here
% % max a in x_axis
%                 generator_size = size(x_zonotope.generators,2);
%                 A = [0 0 0 0 1 0 zeros(1,generator_size - obj.model.dim_x)];
%                 cZonotope = conZonotope([x_zonotope.center,...
%                     x_zonotope.generators], A,...
%                     obj.model.a_max(1));
%                 
%                 % min a in x_axis
%                 A = [0 0 0 0 -1 0 zeros(1,generator_size - obj.model.dim_x)];
%                 cZonotope =cZonotope & conZonotope([x_zonotope.center,...
%                     x_zonotope.generators], A,...
%                     -1*obj.model.a_max(1));
%                 
%                 % max a in y_axis
%                 A = [0 0 0 0 0 1 zeros(1,generator_size - obj.model.dim_x)];
%                 cZonotope = cZonotope & conZonotope([x_zonotope.center,...
%                     x_zonotope.generators], A,...
%                     obj.model.a_max(2));
%                 
%                 % min a in y_axis
%                 A = [0 0 0 0 0 -1 zeros(1,generator_size - obj.model.dim_x)];
%                 cZonotope = cZonotope & conZonotope([x_zonotope.center,...
%                     x_zonotope.generators], A,...
%                     -1*obj.model.a_max(2));
%                 
%                 x_interval = interval(cZonotope);
% end
% 
