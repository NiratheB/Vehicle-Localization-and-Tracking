classdef CTRModel
    %MODEL Model to map from 4 to 4
    %  State: x,y,v_x,v_y, psi, omega
    %  Measurement: x, y, psi
    
    properties
        A
        C
        W
        V
        dim_x = 6;
        dim_y = 3;
        delT = 1;
    end
    
    methods
        function obj = CTRModel(delT, omega)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here
            obj.delT = delT;
            omegaT = omega * delT;
            S = sin(omegaT);
            C = cos(omegaT);
            SW = S/omega;
            CW = C/omega;
            obj.A = [1 0 SW -CW 0 0;
                0 1 CW SW 0 0;
                0 0 C -S 0 0;
                0 0 S C 0 0;
                0 0 0 0 1 delT;
                0 0 0 0 0 1];
            obj.C = [1 0 0 0 0 0;
                0 1 0 0 0 0;
                0 0 0 0 1 0];
            obj.W = [0.6;0.6;0.10;0.10; 0.1;0.1];
            obj.V = [0.6;0.6;0.10];
        end
    end
end

