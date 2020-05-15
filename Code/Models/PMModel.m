classdef PMModel
    %MODEL Model to map from 2 to 4
    %   Measurement: x,y, a_x, a_y
    %   State: x,y,v_x,v_y
    
    properties
        A
        B
        C
        W
        V
        initial
        dim_x = 6;
        dim_y = 2;
        delT = 1;
        a_max = [11.5;11.5];
        constraint = 1;
    end
    
    methods
        function obj = PMModel(delT)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here
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
            
            obj.B = [0 0; 0 0; 0 0; 0 0; 1 0; 0 1];
            
            obj.initial = [1000;1000;10;10;10;10];
        end
    end
end

