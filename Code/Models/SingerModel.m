classdef SingerModel
    %MODEL Singer Acceleration Model
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
        constraint =0;
    end
    
    methods
        function obj = SingerModel(delT,tou)
            %MODEL Construct an instance of this class
            %   Initializes the model variables
            obj.delT = delT;
            beta = 1/tou;
            phi = exp(-beta*delT);
            a_factor = (1/(beta*beta))*(-1 + (beta*delT)+ phi);
            v_factor = (1-phi)/beta;
            obj.A = [1 0 obj.delT 0 a_factor 0;
                0 1 0 obj.delT 0 a_factor;
                0 0 1  0 v_factor 0 ;
                0 0 0 1 0 v_factor;
                0 0 0 0 phi 0;
                0 0 0 0 0 phi];
            obj.C = [1 0 0 0 0 0;
                0 1 0 0 0 0];
            obj.W = [0.1; 0.1; 0.4; 0.4;0.9;0.9];
            obj.V = [0.1; 0.1];
        end
    end
end

