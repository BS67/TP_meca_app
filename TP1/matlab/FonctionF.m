function [F] = FonctionF(t,X)
%
% Fonction de calcul de la géométrie du mecanisme de Klann du TP1
%

% Chargement des paramètres géométriques
%[P] = param();

% Extraction des données
q1 = X(1) ;  %% theta_1
q2 = X(2) ;  %% theta_2
q3 = X(3) ;  %% theta_3
q4 = X(4) ;  %% theta_4
q5 = X(5) ;  %% theta_5
q6 = X(6) ;  %% x_E
q7 = X(7) ;  %% y_E

c1=cos(q1)
s1 =sin(q1)
c2=cos(q2)
s2 =sin(q2)
c3=cos(q3)
s3 =sin(q3)
c4=cos(q4)
s4 =sin(q4)
c5=cos(q5)
s5 =sin(q5)
c6=cos(q6)
s6 =sin(q6)
c7=cos(q7)
s7 =sin(q7)


% Ecriture de la fonction F à résoudre (fermeture des boucles géométriques ADGCA, ABHFGCA, point d'intérêt et pilotage)
F = [-l1*c1+l2b*cos(alpha2+q2)+l2a*c2+l4*c4+l5a*c5+l0a*cos(alpha0a);-l1*s1+l2bsin(alpha2+q2)+l2a*s2+l4*s4+l5a*s5+l0a*sin(alpha0);-l1*c1+l2a*c2+l3*c3+l0b*cos(alpha0);-l1*s1+l2a*s2+l3*s3+l0b*sin(alpha0);l2b*cos(q2+alpha2)+l3*c3+l5b*c5-q6+l0b*cos(alpha0);l2b*sin(q2+alpha2)+l3*s3+l5b*s5-q7+l0b*sin(alpha0);];
     
     
