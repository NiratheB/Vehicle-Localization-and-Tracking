function [score,avg,sd] = get_score(error)
%GET_SCORE Summary of this function goes here
%   Detailed explanation goes here
sd = std(error,0,2);
avg = mean(error,2);
score = (avg.*avg) + (sd.*sd);
avg = avg.*avg;
avg = sqrt(avg);

sd = sd.*sd;
sd = sqrt(sd);
score = sqrt(score);
end

