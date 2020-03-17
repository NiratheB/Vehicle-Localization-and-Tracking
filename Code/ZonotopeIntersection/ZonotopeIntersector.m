classdef ZonotopeIntersector < handle
    %SEGMENTMINIMIZER Implements the algorithm minimizing segment of
    % intersecting zonotope
    
    properties
        model
        lambda
        x_zonotope
        index
        W_zonotope
    end
    
    methods
        function obj = ZonotopeIntersector(model)
            %ZonotopeIntersector Construct an instance of this class
            %   Initialize variables
            obj.model = model;
            obj.x_zonotope = zonotope([zeros(model.dim_x,1),...
                eye(model.dim_x)]);
            obj.index = 1;
            obj.model.C = transpose(obj.model.C);
            obj.W_zonotope =zonotope([zeros(model.dim_x,1), diag(model.W)]);
        end
        
        function [upper, lower]=estimate(obj, measurement)
            x_zonotope = (obj.model.A* obj.x_zonotope) + obj.W_zonotope;
            x_measurement = inv(obj.model.C)*(measurement - obj.model.V);
            y_zonotope = zonotope(x_measurement, eye(obj.model.dim_x));
            zonol{1} = x_zonotope;
            zonol{2} = y_zonotope;
            x_zonotope = andAveraging(zonol);
            obj.x_zonotope = x_zonotope;
            x_interval = interval(obj.x_zonotope);
            upper = supremum(x_interval);
            lower = infimum(x_interval);
            obj.x_zonotope = obj.x_zonotope.reduce('girard', 20);
        end
    end
end

