function drawBushing(x,y)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

bushingRadius       = 5;
bushingCircleRadius = 5;
jointSize           = 10;
screenInfo          = get(0, 'screensize');
screenSize          = screenInfo(3:4);
%%%global bushingRadius bushingCircleRadius jointSize screenSize

bushPoints = bushing(bushingRadius, x, y, 20, 0);
bushCirclePoints = circle(bushingCircleRadius, x, y, 20);
line('xdata', bushPoints(:,1), 'ydata', bushPoints(:,2), ...
             'linestyle', '-', 'color', 'r');
line('xdata', bushCirclePoints(:,1), ...
                   'ydata', bushCirclePoints(:,2), ...
                   'linestyle', '-', 'color', 'r');
end