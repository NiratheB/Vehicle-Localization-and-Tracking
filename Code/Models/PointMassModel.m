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
        function obj = Model(delT)
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
            obj.C = eye(obj.dim_x);
            obj.W = [0.6;0.6;0.10;1];
            obj.V = [0.6;0.6;0.10;1];
        end
    end
end

