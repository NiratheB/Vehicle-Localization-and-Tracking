classdef Estimator < handle
    %ESTIMATOR Estimator template
    %   model: model to represent vehicle dynamics
    
    properties
        model
        E
        F
        x_estimated
        index
    end
    
    methods
        function obj = Estimator(model)
            %ESTIMATOR Constructor
            % Initialize variables
            obj.model = model;
            obj.index = 1; % keep track of measurements
            
            % initialize variables here
            
            % implement initial computation 
        end
        
        function [x_lower, x_upper] = estimate(obj, y)
            %ESTIMATE estimate from the measurement
            
            % implement estimator algorithm on measurement, y
            
            % return bounds
            x_lower = 0;
            x_upper = 0;
        end
        
    end
end

