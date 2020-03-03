classdef CAModel
    %MODEL Constant Acceleration Model
    %   Detailed explanation goes here
    
    properties
        A
        C
        W
        V
        dim_x = 4;
        dim_y = 2;
        delT = 0.1;
    end
    
    methods
        function obj = CAModel(delT)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here
            obj.delT = delT;
            obj.A = [1 0 obj.delT (0.5*obj.delT*obj.delT);
                0 1 0 0;
                0 0 1 obj.delT;
                0 0 0 1];
            obj.C = [1 0 0 0;
                0 1 0 0];
            obj.W = [0.1; 0.1; 0.1; 0.4];
            obj.V = [0.1; 0.1];
        end
    end
end

