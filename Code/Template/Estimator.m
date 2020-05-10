classdef Estimator < handle
    %ESTIMATOR Estimator template
    %   
    
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
        
        function [x_upper, x_lower] = estimate(obj, z)
            %ESTIMATE estimate from the measurement
            
            % implement estimator algorithm on measurement, z
            
            % return bounds
            x_upper = 0;
            x_lower = 0;
        end
        
    end
end

