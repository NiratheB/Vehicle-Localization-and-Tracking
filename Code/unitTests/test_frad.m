function res = test_frad
%TEST_FRAD unit test function for frad minimizer
try
% init model
model = CAModel(0.1);

frad = Frad(model);

est = frad.estimate([1002;1020]);
res = 1;
catch
    res = 0;
end
end

