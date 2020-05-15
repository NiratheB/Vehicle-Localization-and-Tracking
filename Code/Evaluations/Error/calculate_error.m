function error = calculate_error(vehicle)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if size(vehicle.z_arr,2) <50
    error =[];
else
    estimation = vehicle.supremum_arr + vehicle.infimum_arr;
    estimation = estimation /2;

    m_size = size(vehicle.z_arr,1);

    error = abs(estimation(1:m_size,50:end) - vehicle.z_arr(:,50:end));

    error = error.*error;
    error = mean(error,2);
    error = sqrt(error);
    error = error./ max(abs(vehicle.z_arr(:,10:end)),[],2)*100;
end

end

