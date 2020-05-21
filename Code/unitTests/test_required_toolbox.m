function res = test_required_toolbox
%TEST_REQUIRED_TOOLBOX Test if required toolbox is included
p = path;
res = ~isempty(strfind(p, 'contSet')); % CORA

res = res& ~isempty(strfind(p, 'mosek')); % mosek
end

