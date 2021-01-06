-- spécification du module Ensembles_Tableau.
generic
    
    Capacite : Integer;   -- l'utilisateur peut choisir la capacité de l'ensemble
    type T_Elts is private; -- type des elts dans le tableau
    
package Ensembles_Tableau is
    
        type T_Tab is private;
	type T_Ensemble is limited private; -- perd le droit à l'affectation et à l'égalité par rapport au type privé. 
       
        -- Sous-programme permet d'initialiser un ensemble.
	procedure Initialiser (Ens : out T_Ensemble) with
            Post => Est_Vide(Ens);
    
        -- Sous-programme qui permet de détruire un ensemble.
        procedure Detruire (Ens : in out T_Ensemble);
    
	-- Savoir si l'ensemble est vide ou non.
	function Est_Vide (Ens : in T_Ensemble) return Boolean;
	    
	-- Obtenir la taille d'un ensemble.
	function Taille_Ensemble (Ens : in T_Ensemble) return Integer with
	    Post => (Taille_Ensemble'Result >= 0) and (Taille_Ensemble'Result <= Capacite);
	
	-- savoir si un élément est présent dans un ensemble.
        function Present (Ens : in T_Ensemble; Elt : in T_Elts) return Boolean;
	
	-- Ajouter un élément dans un ensemble à l'emplacement e.
	procedure Ajouter (Ens : in out T_Ensemble; Elt : in T_Elts) with
	    Pre => Taille_Ensemble(Ens) < Capacite,
	    Post => Present(Ens,Elt) and (Taille_Ensemble(Ens) = Taille_Ensemble(Ens)'Old + 1);
	
	-- Supprimer un élément dans un ensemble.
	procedure Supprimer (Ens : in out T_Ensemble; Elt : in T_Elts) with
	    Pre => Not(Est_Vide(Ens)),
            Post => (Taille_Ensemble(Ens) = Taille_Ensemble(Ens)'Old - 1);
   
    
        -- Sous-programme qui permet d'appliquer une opérateur sur tous les éléments de l'ensemble
        generic
            with procedure Operation (Elt : in T_Elts);
        procedure Appliquer_Sur_Tous (Ens : in T_Ensemble);


private
       type T_Tab is array (1..Capacite) of T_Elts;
       
       type T_Ensemble is record
	   Elements : T_Tab;  -- les éléments de l'ensemble.
	   Taille : Integer;           -- le nombre d'éléments de l'ensemble.
       end record;
end Ensembles_Tableau;
