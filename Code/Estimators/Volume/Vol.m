classdef Vol < handle
    %VOLUMEMINIMIZER Summary of this class goes here
    %   Implements the algorithm to minimize the volume of the zonotope
    
    properties
        model
        lambda
        x_zonotope
        index
        W_zonotope
    end
    
    methods
        function obj = Vol(model)
            %VOLUMEMINIMIZER Construct an instance of this class
            %   Initialize variables
            obj.model = model;
            initial = [1000;1000;10;10;10;10];
            obj.x_zonotope = zonotope([zeros(model.dim_x,1),...
                diag(initial(1:model.dim_x))]);
            obj.lambda = zeros(obj.model.dim_x,obj.model.dim_y);
            obj.W_zonotope =zonotope([zeros(model.dim_x,1), diag(model.W)]);
        end
        
        function lambda = calculate_lambda(obj, z)
            %CALCULATE_LAMBDA Calculates lambda
            I = eye(obj.model.dim_x);
            H = obj.x_zonotope.generators;
            center = obj.x_zonotope.center;
            lambda_factor = z - (obj.model.C*center);
            initial = obj.lambda;
            func= @(lambda) (zonotope([center+(lambda*lambda_factor),[(I-(lambda*obj.model.C))*H, (lambda* obj.model.V)]]).volume);
            lambda = fmincon(func, initial);
        end
        
        function [lower, upper] =estimate(obj, measurement)
            obj.x_zonotope = (obj.model.A* obj.x_zonotope) + obj.W_zonotope;
            obj.lambda = obj.calculate_lambda(measurement);
            center = obj.x_zonotope.center + ...
                    obj.lambda*(measurement - (obj.model.C*obj.x_zonotope.center));
            generators = [(eye(obj.model.dim_x) -...
                    obj.lambda*obj.model.C)*obj.x_zonotope.generators...
                    ,obj.lambda * obj.model.V];
            obj.x_zonotope = zonotope([center, generators]);
            x_interval = interval(obj.x_zonotope);
            upper = supremum(x_interval);
            lower = infimum(x_interval);
            obj.x_zonotope = obj.x_zonotope.reduce('girard', 20);
        end
    end
end

