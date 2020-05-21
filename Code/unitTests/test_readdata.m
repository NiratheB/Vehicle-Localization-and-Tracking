function res = test_readdata
%TEST_READDATA unit test function for read data

directory = 'Data/*.csv';

files = dir(directory);
n = length(files);
for i = 1:n
    fileid = files(i).folder+"/"+files(i).name;
    f = FileReader(fileid);
    data = f.read_nextline();
    expected = [1 1018.991 1003 -3.167 -2.734];
    res = isequal(data, expected);
    linecount =1;
    while(~isempty(data))
        data = f.read_nextline();
        linecount = linecount + 1;
    end
    res = res & (linecount == 41);
end
end

