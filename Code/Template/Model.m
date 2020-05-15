classdef Model
    %MODEL Model Template
    %   delT: time step
    
    properties
        A
        C
        W
        V
        initial
        dim_x; % estimate dimension
        dim_y; % measurement dimension
        delT = 0.1;
    end
    
    methods
        function obj = Model(delT)
            %MODEL Construct an instance of this class
            %   Initializes the model variables
            obj.delT = delT;
            
            % Assign parameters here
        end
    end
end


