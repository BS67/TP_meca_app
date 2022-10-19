%% Script pour la résolution du mécanisme de Klann du TP1
clear all;
close all;

%% Configuration initiale (relevée graphiquement sur la figure 1)
Xang0 = [%% à compléter %%]; %% les angles
Xlin0 = [%% à compléter %%];  %% les positions
X0 = [Xang0; Xlin0];
DX0 = [%% à compléter %%];
t = 0;
epsAng = %% à compléter %%; % Tolérance sur les angles
epsLin = %% à compléter %%; % Tolérance sur les positions
Epsilon = [epsAng;epsLin]; 
X = X0;

dt=%%à compléter%%;  %% Incrément temporel
tmax=%%à compléter%%;   %% Temps de fin de simulation
j = 0;    %% Index de la boucle de résolution
Xsol = []; %% Matrice contenant l'ensemble des résultats de géométrie
dotXsol = []; %% Matrice contenant l'ensemble des résultats de cinématique

while t<tmax %% boucle de résolution
    [X1] = NewtonRaphson(t,X,Epsilon); 
    Xsol = [Xsol X1];
    X = X1;
    t = t+dt;
    j = j+1;   
end




%% Visualisation de la solution trouvée
bushingRadius       = 5;
bushingCircleRadius = 5;
jointSize           = 10;
screenInfo          = get(0, 'screensize');
screenSize          = screenInfo(3:4);

%% Ouverture d'une fenêtre
mechPlot = figure('Name', 'Simulation du mécanisme', 'Position', [0 0 0.6*screenSize(1)/2 0.6*screenSize(2)]); 
clf;
axes('position', [.05 0.15 0.9 0.75], 'box','on', ...
    'xcolor','black','ycolor','black', ...
	'fontname', 'times', 'fontsize', 10);
set(gcf, 'color', 'white')
axis([-500 100 -400 200])
grid on

%% Préparation des objets à tracer

% Chargement des paramètres géométriques
[P] = param() ;

% Extraction des données
X = Xsol;
q1 = X(1,:) ;  %% theta_1
q2 = X(2,:) ;  %% theta_2
q3 = X(3,:) ;  %% theta_3
q4 = X(4,:) ;  %% theta_4
q5 = X(5,:) ;  %% theta_5
q6 = X(6,:) ;  %% x_E
q7 = X(7,:) ;  %% y_E

%% Coordonnées des points à tracer
%% Les points fixes
Ax = %% à compléter %%;
Ay = %% à compléter %%;
Bx = %% à compléter %%;
By = %% à compléter %%;
Cx = %% à compléter %%;
Cy = %% à compléter %%;
%% Tracé des liaisons au bâti
drawBushing(Ax,Ay); 
drawBushing(Bx,By); 
drawBushing(Cx,Cy); 

%% Déclaration des objets barres et articulations
jointD = line('xdata', [], 'ydata', [], 'marker', 'o', ...
              'markersize', jointSize, 'color', 'black');
jointF = line('xdata', [], 'ydata', [], 'marker', 'o', ...
              'markersize', jointSize, 'color', 'black');
jointG = line('xdata', [], 'ydata', [], 'marker', 'o', ...
              'markersize', jointSize, 'color', 'black');
jointH = line('xdata', [], 'ydata', [], 'marker', 'o', ...
              'markersize', jointSize, 'color', 'black');

barAD = line('xdata', [], 'ydata' , [], 'linewidth' , 2, 'color', 'k');
barDG = line('xdata', [], 'ydata' , [], 'linewidth' , 2, 'color', 'k');
barCG = line('xdata', [], 'ydata' , [], 'linewidth' , 2, 'color', 'k');
barBH = line('xdata', [], 'ydata' , [], 'linewidth' , 2, 'color', 'k');
barGF = line('xdata', [], 'ydata' , [], 'linewidth' , 2, 'color', 'k');
barHF = line('xdata', [], 'ydata' , [], 'linewidth' , 2, 'color', 'k');
barFE = line('xdata', [], 'ydata' , [], 'linewidth' , 2, 'color', 'k');


%% Les points mobiles
Dx = %% à compléter %%;
Dy = %% à compléter %%;
Gx = %% à compléter %%;
Gy = %% à compléter %%;
Hx = %% à compléter %%;
Hy = %% à compléter %%;
Fx = %% à compléter %%;
Fy = %% à compléter %%;
Ex = %% à compléter %%;
Ey = %% à compléter %%;


for i=1:j
    figure(mechPlot);
    set(jointD, 'xdata', Dx(i), 'ydata', Dy(i));
    set(jointF, 'xdata', Fx(i), 'ydata', Fy(i));
    set(jointG, 'xdata', Gx(i), 'ydata', Gy(i));
    set(jointH, 'xdata', Hx(i), 'ydata', Hy(i));
    
    set(barAD, 'xdata', [Ax Dx(i)], 'ydata', [Ay Dy(i)]);
    set(barDG, 'xdata', [Dx(i) Gx(i)], 'ydata', [Dy(i) Gy(i)]);
    set(barCG, 'xdata', [Cx Gx(i)], 'ydata', [Cy Gy(i)]);
    set(barBH, 'xdata', [Bx Hx(i)], 'ydata', [By Hy(i)]);
    set(barGF, 'xdata', [Gx(i) Fx(i)], 'ydata', [Gy(i) Fy(i)]);
    set(barHF, 'xdata', [Hx(i) Fx(i)], 'ydata', [Hy(i) Fy(i)]);
    set(barFE, 'xdata', [Fx(i) Ex(i)], 'ydata', [Fy(i) Ey(i)]);
    
    drawnow
    pause(0.01) %% Temporisation entre 2 instants successifs
end




hold on;
figure(mechPlot);
plot(Ex,Ey);


%% Tracé de la trajectoire de E 
plot_traj_E = figure('Name', 'Trajectoire du point E', 'Position', [0 0 0.6*screenSize(1)/2 0.6*screenSize(2)]);
plot(Ex,Ey);
hXlabel=xlabel('Angle $x_{E}$ (mm)');
hYlabel=ylabel('Angle $y_{E}$ (mm)');
set(hXlabel,'Interpreter','latex');
set(hYlabel,'Interpreter','latex');
hTitle=title('Trajectoire du point $E$');
set(hTitle,'Interpreter','latex');
grid on;


%% Tracé des vitesses de E selon x et y en fct de theta_1
%% à compléter %%

%% Tracé de l'évolution de theta_5
%% à compléter %%

%% Tracé de l'évolution de dot{theta_5}
%% à compléter %%




