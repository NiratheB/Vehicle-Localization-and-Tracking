classdef PRadius < handle
    %SEGMENTMINIMIZER Implements the algorithm minimizing segment of
    % intersecting zonotope
    
    properties
        model
        lambda
        x_zonotope
        index
        E
        F
        W_zonotope
    end
    
    methods
        function obj = PRadius(model)
            %SEGMENTMINIMIZER Construct an instance of this class
            %   Initialize variables
            obj.model = model;
            initial = [1000;1000;10;10;10;10];
            obj.x_zonotope = zonotope([zeros(model.dim_x,1),...
                diag(initial(1:model.dim_x))]);
            obj.index = 1;
            obj.model.C = transpose(obj.model.C);
            obj.E = diag(model.W);
            obj.F = diag(model.V);
            obj.W_zonotope = zonotope([zeros(model.dim_x),...
                obj.E]);
            obj.calculate_lambda();
        end
        
        function lambda = calculate_lambda(obj)
            %CALCULATE_LAMBDA calculates lambda
            PpD.A = obj.model.A;
            PpD.C = transpose(obj.model.C);
            PpD.E = obj.E;
            PpD.F = obj.F;
            [obj.lambda, Pwrk, gamma_sol, i] = get_lambda(PpD);
            disp(obj.lambda);
        end
        
        function [upper, lower]=estimate(obj, measurement)
            C_t = transpose(obj.model.C);
            x_zonotope = (obj.model.A* obj.x_zonotope) + obj.W_zonotope;
            
            center = x_zonotope.center + ...
                    obj.lambda*(measurement - ...
                    (C_t*x_zonotope.center));
            generators = [(eye(obj.model.dim_x) -...
                    obj.lambda*C_t)*x_zonotope.generators...
                    ,obj.lambda*obj.F];
            x_zonotope = zonotope([center, generators]);
            obj.x_zonotope = x_zonotope;
            x_interval = interval(obj.x_zonotope);
            upper = supremum(x_interval);
            lower = infimum(x_interval);
            obj.x_zonotope = obj.x_zonotope.reduce('girard', 20);
        end
    end
end



