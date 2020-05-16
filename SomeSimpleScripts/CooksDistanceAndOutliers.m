%Cooks distance%
X=x;
Y=y;
% Use regstats to calculate Cook's Distance
stats = regstats(Y,X,'linear');
% if Cook's Distance > n/4 is a typical treshold that is used to suggest
% the presence of an outlier
potential_outlier = stats.cookd > 4/length(X);
% Display the index of potential outliers and graph the results
X(potential_outlier)
plot(X,Y, 'b.')
hold on
plot(X(potential_outlier),Y(potential_outlier), 'r.')
pause