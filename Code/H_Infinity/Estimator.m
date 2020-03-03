classdef Estimator < handle
    %ESTIMATOR Interval Approximation with Reachability Analysis
    %   
    
    properties
        model
        E
        F
        D_w
        D_v
        L
        S_w 
        S_v 
        S_x
        x_estimated
        index
        gain_factor
        
    end
    
    methods
        function obj = Estimator(model)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj.model = model;
            obj.E = eye(model.dim_x);
            obj.F = eye(model.dim_y);
            W = zonotope([zeros(model.dim_x), diag(model.W)]);
            V = zonotope([zeros(model.dim_y), diag(model.V)]);
            obj.calculate_gain();
            
            obj.D_w = obj.E * W;
            obj.D_v = -obj.L * obj.F * V;
            obj.S_w = interval(zonotope([zeros(model.dim_x,1), zeros(model.dim_x)]));
            obj.S_v = interval(zonotope([zeros(model.dim_x, 1), zeros(model.dim_x)]));
            obj.S_x = zonotope([zeros(model.dim_x, 1), 0.2*eye(model.dim_x)]);
            obj.x_estimated = obj.S_x.center;
            obj.index = 1;
            obj.gain_factor = obj.model.A- (obj.L*obj.model.C);
        end
        
        function [x_upper, x_lower] = estimate(obj,z)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            
            error_bounds = interval(obj.S_x) +obj.S_w+ obj.S_v;
            %x_center = S_x.center;
            x_upper = obj.x_estimated + supremum(error_bounds);
            x_lower = obj.x_estimated + infimum(error_bounds);
            obj.x_estimated = obj.model.A*obj.x_estimated + ...
                obj.L*(z - (obj.model.C* obj.x_estimated));
            obj.S_x = obj.gain_factor * obj.S_x;
            obj.S_w = obj.S_w + interval(obj.D_w);
            obj.S_v = obj.S_v + interval(obj.D_v);
            obj.D_w = obj.gain_factor * obj.D_w;
            obj.D_v = obj.gain_factor* obj.D_v;
            
            
        end
        function calculate_gain(obj)
            PpD.A = obj.model.A;
            PpD.C = obj.model.C;
            PpD.E = obj.E;
            PpD.F = obj.F;
            [obj.L, Pwrk, gamma_sol, i] = get_gain(PpD);
            disp(obj.L);
%             obj.L = [1.0215   -0.0000    0.9834    0.4821;
%                 0.0000    0.7486   -0.0000    0.0000;
%                 0.1700    0.0000    0.8975    0.7945;
%                 0.0277    0.0000    0.1042    0.6946];
        end
        
    end
end

