function  [Beta_chapeau2]= MCO2(x,y)

% Détermination de la matrice A
A = [ x.*x, x.*y y.*y, x, y, ones(200,1)]
A = [ x.*y, -x.*x + y.*y, x, y, ones(200,1), x.*x]
B = zeros(200, 1);
Beta_chapeau2 = A\B;
end