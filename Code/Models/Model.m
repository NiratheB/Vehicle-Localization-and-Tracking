classdef Model
    %MODEL Model to map from 4 to 4
    %   
    
    properties
        A
        C
        W
        V
        dim_x = 4;
        dim_y = 4;
        delT = 1;
    end
    
    methods
        function obj = Model(delT)
            %MODEL Construct an instance of this class
            %   Detailed explanation goes here
            obj.delT = delT;
            obj.A = [1 0 obj.delT 0.5*obj.delT*obj.delT;
                0 1 0 0
                0 0 1 obj.delT;
                0 0 0 1];
            obj.C = eye(obj.dim_x);
            obj.W = [0.1;0.1;0.1;0.4];
            obj.V = [0.1;0.1;0.1;0.1];
        end
    end
end

