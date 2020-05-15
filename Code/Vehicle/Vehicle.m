classdef Vehicle < handle
    %VEHICLE 
    
    properties
        id
        curr_index =1;
        infimum_arr = [];
        supremum_arr = [];
        z_arr = [];
        estimator;
        timer_arr;
    end
    
    methods
        function obj = Vehicle(id)
            %VEHICLE Construct a vehicle with relevant data
            %   initialize the arrays
            obj.id = id;
            obj.infimum_arr = [];
            obj.supremum_arr = [];
            obj.z_arr = [];
            obj.curr_index = 1;
        end
        
        function add_estimator(obj,estimator)
            % add_estimator add the estimator for the vehicle
            obj.estimator = estimator;
        end
        
        function add_measurement(obj,measurement, range_select)
            %add_measuremen add the measurement to the array
            % and find an estimate
            obj.z_arr = [obj.z_arr measurement];
            tic;
            [lower, upper] = obj.estimator.estimate(measurement(range_select));
            endtime = toc;
            obj.timer_arr = [obj.timer_arr endtime];
            obj.supremum_arr = [obj.supremum_arr upper];
            obj.infimum_arr = [obj.infimum_arr lower];
            obj.curr_index = obj.curr_index +1;
        end
    end
end

