classdef PointMassModel
    %MODEL Model to map from 2 to 4
    %   Measurement: x,y, a_x, a_y
    %   State: x,y,v_x,v_y
    
    properties
        A
        B
        C
        W
        V
        dim_x = 4;
        dim_y = 2;
        delT = 1;
    end
    
    methods
        function obj = PointMassModel(delT)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here
            obj.delT = delT;
            obj.A = [1 0 delT 0;
                0 1 0 delT;
                0 0 1 0;
                0 0 0 1];
            obj.B = [0 0;
                0 0;
                delT 0;
                0 delT];
            obj.C = [1 0 0 0;
                0 1 0 0];
            obj.W = [0.1; 0.1 ; 0.4;0.4];
            obj.V = [0.1; 0.1];
        end
    end
end

