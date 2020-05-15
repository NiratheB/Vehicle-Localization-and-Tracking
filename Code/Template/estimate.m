function [upper, lower]=estimate(obj, measurement)
            C_t = transpose(obj.model.C);
            x_zonotope = (obj.model.A* obj.x_zonotope) + obj.W_zonotope;
            for i = 1:obj.model.dim_y
                y = measurement(i);
                lambda = obj.calculate_lambda(x_zonotope.generators,...
                    obj.model.C(:,i), obj.model.V(i));
                center = x_zonotope.center + ...
                    lambda*(y - (C_t(i,:)*x_zonotope.center));
                generators = [(eye(obj.model.dim_x) -...
                    lambda*C_t(i,:))*x_zonotope.generators...
                    ,obj.model.V(i)*lambda];
                x_zonotope = zonotope([center, generators]);
            end
            obj.x_zonotope = x_zonotope;
            x_interval = interval(obj.x_zonotope);
            % constraint with pointmassmodel
            if obj.model.constraint >0
                a_max_interval = interval(-1*obj.model.a_max(1), ...
                obj.model.a_max(1));
                try
                    x_interval(5) = x_interval(5)& a_max_interval;
                catch
                     x_interval(5) = a_max_interval;
                end
                a_max_interval = interval(-1*obj.model.a_max(2), ...
                obj.model.a_max(2));
                try
                    x_interval(6) = x_interval(6)& a_max_interval;
                catch
                    x_interval(6)= a_max_interval;
                end
            end
            upper = supremum(x_interval);
            lower = infimum(x_interval);
            obj.x_zonotope = obj.x_zonotope.reduce('girard', 20);
end

