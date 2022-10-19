function [j] = Jacobian(X)

%
% Fonction calculant la jacobienne pour le mecanisme de Klann du TP1
%
sym q1 q2 q3 q4 q5 q6 q7
% Chargement des paramètres géométriques
[P] = param() ;

% Extraction des données

% Calcul de la jacobienne
X_sym = [q1; q2; q3; q4; q5; q6; q7];
 
c1=cos(q1);
s1 =sin(q1);
c2=cos(q2);
s2 =sin(q2);
c3=cos(q3);
s3 =sin(q3);
c4=cos(q4);
s4 =sin(q4);
c5=cos(q5);
s5 =sin(q5);



% Ecriture de la fonction F à résoudre (fermeture des boucles géométriques ADGCA, ABHFGCA, point d'intérêt et pilotage)
F = [-l1*c1+l2b*cos(alpha2+q2)+l2a*c2+l4*c4+l5a*c5+l0a*cos(alpha0a);-l1*s1+l2bsin(alpha2+q2)+l2a*s2+l4*s4+l5a*s5+l0a*sin(alpha0);-l1*c1+l2a*c2+l3*c3+l0b*cos(alpha0);-l1*s1+l2a*s2+l3*s3+l0b*sin(alpha0);l2b*cos(q2+alpha2)+l3*c3+l5b*c5-q6+l0b*cos(alpha0);l2b*sin(q2+alpha2)+l3*s3+l5b*s5-q7+l0b*sin(alpha0);];

J=jacobian(F,X_sym)
j = subs(J,X_sym,X)