function [X] = NewtonRaphson(t,X0,Epsilon)

%
% Newton Raphson pour le m�canisme de Klann du TP1
%

% Chargement des param�tres g�om�triques
[P] = param();

% Initialisation des variables
DX = ones(7,1);
X = X0 ;
i=0; %% index boucle de r�solution

% Boucle de Newton-Raphson
while (abs(DX)>Epsilon)
    %% � compl�ter %%
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
