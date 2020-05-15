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
            %VEHICLE Construct an instance of this class
            %   Detailed explanation goes here
            obj.id = id;
            obj.infimum_arr = [];
            obj.supremum_arr = [];
            obj.z_arr = [];
            obj.curr_index = 1;
        end
        
        function add_estimator(obj,estimator)
            obj.estimator = estimator;
        end
        
        function add_measurement(obj,measurement, range_select)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.z_arr = [obj.z_arr measurement];
            tic;
            [upper, lower] = obj.estimator.estimate(measurement(range_select));
            endtime = toc;
            obj.timer_arr = [obj.timer_arr endtime];
            obj.supremum_arr = [obj.supremum_arr upper];
            obj.infimum_arr = [obj.infimum_arr lower];
            obj.curr_index = obj.curr_index +1;
        end
    end
end

