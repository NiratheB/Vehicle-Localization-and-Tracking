function res = test_frad
%TEST_FRAD unit test function for frad minimizer
try
% init model
model = PMModel(0.1);

hinf = Hinf(model);

est = hinf.estimate([1002;1020]);
res = 1;
catch
    res = 0;
end
end

