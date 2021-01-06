package body ensembles_tableau is


    -- Sous-programme permet d'initialiser un ensemble.
    procedure Initialiser (Ens : out T_Ensemble) is
    begin
        Ens.Taille := 0;
    end Initialiser;

       -- Sous-programme qui permet de détruire un ensemble.
    procedure Detruire (Ens : in out T_Ensemble) is
    begin
        null;
    end Detruire;

    -- Savoir si l'ensemble est vide ou non.
    function Est_Vide (Ens : in T_Ensemble) return Boolean is
    begin
        return (Ens.Taille = 0);
    end;

    -- Obtenir la taille d'un ensemble.
    function Taille_Ensemble (Ens : in T_Ensemble) return Integer is
    begin
        return Ens.Taille;
    end Taille_Ensemble;

    -- savoir si un élément est présent dans un ensemble.
    function Present (Ens : in T_Ensemble; Elt : in T_Elts) return Boolean is
        indice : Integer;
    begin
        indice := 1;
        while (indice <= Ens.Taille) and then (Ens.Elements(indice) /= Elt) loop
            indice := indice +1;
        end loop;
        -- (indice > Ens.Taille) ou (Ens.Elements(indice) = Elt)
        return indice <= Ens.Taille;
    end Present;


    -- Ajouter un élément dans un ensemble à l'emplacement e.
    procedure Ajouter (Ens : in out T_Ensemble; Elt : in T_Elts) is
    begin
        Ens.Taille := Ens.Taille + 1;
        Ens.Elements(Ens.Taille) := Elt;
    end Ajouter;

    -- Supprimer un élément dans un ensemble.
    procedure Supprimer (Ens : in out T_Ensemble; Elt : in T_Elts) is
        indice : Integer;
    begin
        indice := 1;
        while indice <= Capacite and then Ens.Elements(indice) /= Elt loop
            indice := indice + 1;
        end loop;
        --  (indice > Capacite) ou (Ens.Elements(indice) = Elt)
        if indice > Capacite then -- on est plus dans l'ensemble
            null;
        else
            Ens.Elements(indice) := Ens.Elements(Ens.Taille);
            Ens.Taille := Ens.Taille - 1;
        end if;
    end Supprimer;


    -- Sous-programme qui permet d'appliquer à tous les éléments de l'ensemble une opération.
    procedure Appliquer_Sur_Tous (Ens : in  T_Ensemble) is
    begin
        for indice in 1..Ens.Taille loop
            Operation(Ens.Elements(indice));
        end loop;
    end Appliquer_Sur_Tous;

end ensembles_tableau;


