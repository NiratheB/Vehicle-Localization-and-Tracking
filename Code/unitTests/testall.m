verbose = 1;

files = dir('unitTests/test_*.m');
nfiles = size(files,1);
ntests = 0;
fails = 0;
for i=1:nfiles
    [~,funcname] = fileparts(files(i).name);
    [~,res] = evalc(funcname);
    
    if(res== 1)
        fprintf("%s: Passed\n",funcname);
    else
        fprintf("%s: Failed\n", funcname);
        fails = fails +1;
    end
    
    ntests = ntests+1;
  
end

fprintf("%d out of %d tests failed\n", fails, ntests);