classdef FileReader < handle
    %FILEREADER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        filename;
        fileId;
        cols;
        ncols;
        delimiter = ',';
        col_idx;
        data;
    end
    
    methods
        function obj = FileReader(filename)
            %FILEREADER Construct an instance of this class
            %   Detailed explanation goes here
            obj.fileId = fopen(filename);
            obj.cols = {'track_id','x','y','vx','vy'};
            obj.ncols = size(obj.cols, 2);
            obj.col_idx = zeros(1,obj.ncols);
            obj.data = zeros(1,obj.ncols);
            obj.read_columns();
        end
        
        function read_columns(obj)
            header = fgetl(obj.fileId);
            header = regexp(header, obj.delimiter, 'split');
            col_num = 1;
            for col= obj.cols
                index = strmatch(col, header);
                obj.col_idx(col_num) = index;
                col_num = col_num+1;
            end
            
        end
        
        function data = read_nextline(obj)
            data = obj.data;
            if(feof(obj.fileId))
                data = [];
                obj.close();
                return;
            end
            
            line = fgetl(obj.fileId);
            line = strtrim(line);
            if(isempty(line))
                data = [];
                obj.close();
                return;
            end
            
            % find cols
            line = regexp(line, obj.delimiter, 'split');
            index =1;
            for i= obj.col_idx
                data(index) =  str2double(line(i));
                index = index+1;
            end
            
        end
        
        function close(obj)
            fclose(obj.fileId);
        end
    end
end

