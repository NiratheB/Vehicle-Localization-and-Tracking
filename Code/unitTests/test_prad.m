function res = test_prad
%TEST_PRAD unit test function for prad minimizer
try
% init model
model = CVModel(0.1);

prad = Prad(model);

est = prad.estimate([1002;1020]);
res = 1;
catch
    res = 0;
end
end

