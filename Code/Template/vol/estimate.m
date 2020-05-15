function [lower, upper] = estimate(obj, y)
    %ESTIMATE estimate with measurement y
    
    % predict
    obj.x_zonotope = (obj.model.A* obj.x_zonotope) + obj.W_zonotope;
    
    % calculate lambda
    obj.lambda = obj.calculate_lambda(y);
    
    % find the zonotope parameterized by lambda
    center = obj.x_zonotope.center + ...
            obj.lambda*(y - (obj.model.C*obj.x_zonotope.center));
    generators = [(eye(obj.model.dim_x) -...
            obj.lambda*obj.model.C)*obj.x_zonotope.generators...
            ,obj.lambda * obj.model.V];
    obj.x_zonotope = zonotope([center, generators]);
    
    % find the bounds
    x_interval = interval(obj.x_zonotope);
    upper = supremum(x_interval);
    lower = infimum(x_interval);
    
    % reduce
    obj.x_zonotope = obj.x_zonotope.reduce('girard', 20);
end

