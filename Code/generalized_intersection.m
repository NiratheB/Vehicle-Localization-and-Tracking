function z = generalized_intersection(z1,z2,R)
%GENERALIZED_INTERSECTION generalized intersection of z1 and z2 such that
%z1 = Rz2
%   Detailed explanation goes here
center_1 = z1.Z(:,1);
center_2 = z2.Z(:,1);
generator_1 = z1.Z(:,2:end);
generator_2 = z2.Z(:,2:end);
dim_1 = size(generator_1,1);
dim_2 = size(generator_2,2);
generators = [generator_1, zeros(dim_1, dim_2)];
A1 = z1.A;
A2 = z2.A;
A = [A1 zeros(size(A1,1),size(A2,2));
    zeros(size(A2,1), size(A1,2)), A2;
    R*generator_1, -generator_2];

b = [z1.b; z2.b; center_2 - (R* center_1)];
z = conZonotope([center_1, generators], A,b);
end

