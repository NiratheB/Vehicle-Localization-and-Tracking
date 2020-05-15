% go to dir
directory = '../Data/*.csv';
out_directory ='';

files = dir(directory);
n = length(files);
delT = 0.1;
model = PMModel(delT);
estimator = Frad(model);
selectRange = [1,2];
for i = 1:n
    fileid = files(i).folder+"/"+files(i).name;
    f = FileReader(fileid);
    data = f.read_nextline();

    vehicles = [];
    vehicles_ids = zeros(5000,1);
    while(~isempty(data))
        veh_id = data(1)+1;
        list_index = vehicles_ids(veh_id);
        if(list_index == 0)
            list_index = size(vehicles,1)+1;
            new_vehicle = Vehicle(veh_id);
            new_vehicle.add_estimator(estimator);
            vehicles = [vehicles; new_vehicle];
            vehicles_ids(veh_id) = list_index;
        end
        measurement = transpose(data(2:end));
        vehicles(list_index).add_measurement(measurement, selectRange);      
        data = f.read_nextline();
    end
    filename = regexprep(files(i).name, '.csv', '.mat');
    filename = join([out_directory, filename]);
    save(filename,'vehicles');
    fprintf("%d out of %d : Done",i,n);
end