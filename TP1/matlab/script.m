%% Script pour la r�solution du m�canisme de Klann du TP1
clear all;
close all;

%% Configuration initiale (relev�e graphiquement sur la figure 1)
Xang0 = [%% � compl�ter %%]; %% les angles
Xlin0 = [%% � compl�ter %%];  %% les positions
X0 = [Xang0; Xlin0];
DX0 = [%% � compl�ter %%];
t = 0;
epsAng = %% � compl�ter %%; % Tol�rance sur les angles
epsLin = %% � compl�ter %%; % Tol�rance sur les positions
Epsilon = [epsAng;epsLin]; 
X = X0;

dt=%%� compl�ter%%;  %% Incr�ment temporel
tmax=%%� compl�ter%%;   %% Temps de fin de simulation
j = 0;    %% Index de la boucle de r�solution
Xsol = []; %% Matrice contenant l'ensemble des r�sultats de g�om�trie
dotXsol = []; %% Matrice contenant l'ensemble des r�sultats de cin�matique

while t<tmax %% boucle de r�solution
    [X1] = NewtonRaphson(t,X,Epsilon); 
    Xsol = [Xsol X1];
    X = X1;
    t = t+dt;
    j = j+1;   
end




%% Visualisation de la solution trouv�e
bushingRadius       = 5;
bushingCircleRadius = 5;
jointSize           = 10;
screenInfo          = get(0, 'screensize');
screenSize          = screenInfo(3:4);

%% Ouverture d'une fen�tre
mechPlot = figure('Name', 'Simulation du m�canisme', 'Position', [0 0 0.6*screenSize(1)/2 0.6*screenSize(2)]); 
clf;
axes('position', [.05 0.15 0.9 0.75], 'box','on', ...
    'xcolor','black','ycolor','black', ...
	'fontname', 'times', 'fontsize', 10);
set(gcf, 'color', 'white')
axis([-500 100 -400 200])
grid on

%% Pr�paration des objets � tracer

% Chargement des param�tres g�om�triques
[P] = param() ;

% Extraction des donn�es
X = Xsol;
q1 = X(1,:) ;  %% theta_1
q2 = X(2,:) ;  %% theta_2
q3 = X(3,:) ;  %% theta_3
q4 = X(4,:) ;  %% theta_4
q5 = X(5,:) ;  %% theta_5
q6 = X(6,:) ;  %% x_E
q7 = X(7,:) ;  %% y_E

%% Coordonn�es des points � tracer
%% Les points fixes
Ax = %% � compl�ter %%;
Ay = %% � compl�ter %%;
Bx = %% � compl�ter %%;
By = %% � compl�ter %%;
Cx = %% � compl�ter %%;
Cy = %% � compl�ter %%;
%% Trac� des liaisons au b�ti
drawBushing(Ax,Ay); 
drawBushing(Bx,By); 
drawBushing(Cx,Cy); 

%% D�claration des objets barres et articulations
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
Dx = %% � compl�ter %%;
Dy = %% � compl�ter %%;
Gx = %% � compl�ter %%;
Gy = %% � compl�ter %%;
Hx = %% � compl�ter %%;
Hy = %% � compl�ter %%;
Fx = %% � compl�ter %%;
Fy = %% � compl�ter %%;
Ex = %% � compl�ter %%;
Ey = %% � compl�ter %%;


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


%% Trac� de la trajectoire de E 
plot_traj_E = figure('Name', 'Trajectoire du point E', 'Position', [0 0 0.6*screenSize(1)/2 0.6*screenSize(2)]);
plot(Ex,Ey);
hXlabel=xlabel('Angle $x_{E}$ (mm)');
hYlabel=ylabel('Angle $y_{E}$ (mm)');
set(hXlabel,'Interpreter','latex');
set(hYlabel,'Interpreter','latex');
hTitle=title('Trajectoire du point $E$');
set(hTitle,'Interpreter','latex');
grid on;


%% Trac� des vitesses de E selon x et y en fct de theta_1
%% � compl�ter %%

%% Trac� de l'�volution de theta_5
%% � compl�ter %%

%% Trac� de l'�volution de dot{theta_5}
%% � compl�ter %%




