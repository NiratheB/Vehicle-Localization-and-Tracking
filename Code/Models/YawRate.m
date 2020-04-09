classdef YawRate
    %KSTModel Kinematic Single Track Model
    %   Measurement: s_x, s_y
    %   State: s_x, s_y, v_x, v_y, 
    
    properties
        A
        C
        W
        V
        dim_x = 8;
        dim_y = 3;
        delT = 1;
        psi;
    end
    
    methods
        function obj = YawRate(delT)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here
            obj.delT = delT;
            delT2 = delT* delT / 2;
            delT3 = delT2* delT/3;
            obj.A = [1 0 obj.delT 0.5*obj.delT*obj.delT;
                0 1 0 0
                0 0 1 obj.delT;
                0 0 0 1];
            obj.C = eye(obj.dim_x);
            obj.W = [0.6;0.6;0.10;1];
            obj.V = [0.6;0.6;0.10;1];
        end
    end
end

