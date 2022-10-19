function [X] = NewtonRaphson(t,X0,Epsilon)

%
% Newton Raphson pour le mécanisme de Klann du TP1
%

% Chargement des paramètres géométriques
[P] = param();

% Initialisation des variables
DX = ones(7,1);
X = X0 ;
i=0; %% index boucle de résolution

% Boucle de Newton-Raphson
while (abs(DX)>Epsilon)
    %% à compléter %%
    i=i+1;
    if inv() 
        F = FonctionF(t,X) ;
        DX = -Jacobian(X)'*F;
        X = X+DX;
    else
        disp('Jacobienne non inversible')
        break
    end
end
