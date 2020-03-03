classdef SegmentMinimizer < handle
    %SEGMENTMINIMIZER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        model
        lambda
        x_zonotope
        index
        W_zonotope
    end
    
    methods
        function obj = SegmentMinimizer(model)
            %SEGMENTMINIMIZER Construct an instance of this class
            %   Detailed explanation goes here
            obj.model = model;
            obj.x_zonotope = zonotope([zeros(model.dim_x,1),...
                eye(model.dim_x)]);
            obj.index = 1;
            obj.model.C = transpose(obj.model.C);
            obj.W_zonotope =zonotope([zeros(model.dim_x,1), diag(model.W)]);
        end
        
        function lambda = calculate_lambda(obj, H, C, del)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            numerator = H*transpose(H) * C;
            denominator = (transpose(C) * numerator) + (del*del);
            lambda = numerator / denominator;
        end
        
        function [upper, lower]=estimate(obj, measurement)
            C_t = transpose(obj.model.C);
            x_zonotope = (obj.model.A* obj.x_zonotope) + obj.W_zonotope;
            for i = 1:obj.model.dim_y
                y = measurement(i);
                lambda = obj.calculate_lambda(x_zonotope.generators,...
                    obj.model.C(:,i), obj.model.V(i));
                center = x_zonotope.center + ...
                    lambda*(y - (C_t(i,:)*x_zonotope.center));
                generators = [(eye(obj.model.dim_x) -...
                    lambda*C_t(i,:))*x_zonotope.generators...
                    ,obj.model.V(i)*lambda];
                x_zonotope = zonotope([center, generators]);
            end
            obj.x_zonotope = x_zonotope;
            x_interval = interval(obj.x_zonotope);
            upper = supremum(x_interval);
            lower = infimum(x_interval);
            obj.x_zonotope = obj.x_zonotope.reduce('girard', 20);
        end
    end
end

