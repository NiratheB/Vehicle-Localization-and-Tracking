classdef CVModel
    %CVMODEL Constant Velocity Model
    %   Measurement: x,y
    %   State: x,y,v_x
    
    properties
        A
        C
        W
        V
        dim_x = 3;
        dim_y = 2;
        delT = 1;
    end
    
    methods
        function obj = CVModel(delT)
            %CVMODEL Construct an instance of this class
            %   delT is the time step
            obj.delT = delT;
            obj.A = [1 0 obj.delT;
                0 1 0;
                0 0 1];
            obj.C = [1 0 0;
                0 1 0];
            obj.W = [0.1; 0.1 ; 0.1];
            obj.V = [0.1; 0.1];
        end
    end
end

