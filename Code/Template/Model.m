classdef Model
    %MODEL Model Template
    %   dim_x: estimate dimension
    %   dim_y: measurement dimension
    
    properties
        A
        C
        W
        V
        initial
        dim_x;
        dim_;
        delT = 0.1;
    end
    
    methods
        function obj = Model(delT)
            %MODEL Construct an instance of this class
            %   Initializes the model variables
            obj.delT = delT; % add the time step
            
            % Assign parameters here
        end
    end
end


