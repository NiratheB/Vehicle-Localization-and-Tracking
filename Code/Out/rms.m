
sm= load('sm_ca_s3.mat');
es= load('es_ca_s3.mat');
sm_error = [[]];
es_error =[[]];
index=1;
for i=sm.z_arr
    avg = sm.infimum_arr(:,index)+ sm.supremum_arr(:,index);
    avg = avg/2;
    sm_error(:,index) = avg - i; 
    
    avg = es.infimum_arr(:,index)+ es.supremum_arr(:,index);
    avg = avg/2;
    es_error(:,index) = avg - i; 
    index = index+1;
end
[sm_score,sm_mean, sm_sd] = get_score(sm_error);
[es_score,es_mean, es_sd] = get_score(es_error);

% for i = 1:4
%     figure(i);
%     plot(sm.t_arr, sm_error(i,:), 'b');
%     hold on;
%     plot(es.t_arr, es_error(i,:), 'g');
% end