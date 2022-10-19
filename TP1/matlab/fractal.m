function fractal(n)
x=[1 3 2 1];
y=[1 1 1+sqrt(3) 1];
xp=1; yp=1;
figure()
hold on;
axis('equal');
axis('off');
plot(x,y);
hold on;
tic;
for i=1:n
de=fix(round(rand*6+0.5));
if (de == 1 | de == 2)
xp=(xp+x(1))/2; yp=(yp+y(1))/2;
elseif (de == 3 | de == 4)
xp=(xp+x(2))/2; yp=(yp+y(2))/2;
elseif (de == 5 | de == 6)
xp=(xp+x(3))/2; yp=(yp+y(3))/2;
end
plot(xp,yp,'r.');
end
toc;
hold off;