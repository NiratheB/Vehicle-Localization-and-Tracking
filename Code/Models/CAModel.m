classdef CAModel
    %MODEL Constant Acceleration Model
    %   Measurement: x,y
    %   State: x,y,v_x,v_y,a_x,a_y
    
    properties
        A
        C
        W
        V
        dim_x = 6;
        dim_y = 2;
        delT = 0.1;
    end
    
    methods
        function obj = CAModel(delT)
            %MODEL Construct an instance of this class
            %   Initializes the model variables
            obj.delT = delT;
            delT_square = (0.5*obj.delT*obj.delT);
            obj.A = [1 0 obj.delT 0 delT_square 0;
                0 1 0 obj.delT 0 delT_square;
                0 0 1  0 obj.delT 0 ;
                0 0 0 1 0 obj.delT;
                0 0 0 0 1 0;
                0 0 0 0 0 1];
            obj.C = [1 0 0 0 0 0;
                0 1 0 0 0 0];
            obj.W = [0.1; 0.1; 0.4; 0.4;0.1;0.1];
            obj.V = [0.1; 0.1];
        end
    end
end

