with Ensembles_Chainage;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure test_ensembles_sujet_chainage is


	-- Instancier le paquetage Ensembles_Chainage pour avoir un Ensemble
        -- d'entiers
        package Mon_Ensemble is new Ensembles_Chainage(T_Elts => Integer);
        use Mon_Ensemble;

	-- Définir une opération Afficher qui affiche les éléments d'un ensemble
	-- d'entier en s'appuyant sur Appliquer_Sur_Tous.  L'ensemble {5, 28, 10}
	-- sera affiché :
	--           5         28         10
        procedure Afficher_Entier (Entier : in Integer) is
        begin
            Put("           ");
            Put(Entier,1);
        end Afficher_Entier;

        procedure Afficher is new Appliquer_Sur_Tous(Operation => Afficher_Entier);

	Ens1 : T_Ensemble;

begin
        -- Créer un ensemble vide Ens1
        Initialiser(Ens1);
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
        pragma Assert(Est_Vide (Ens1));
        pragma Assert(Taille_Ensemble(Ens1) = 0);
        pragma Assert(not(Present(Ens1,2)));
        pragma Assert(not(Present(Ens1,5)));
        pragma Assert(not(Present(Ens1,7)));
        pragma Assert(not(Present(Ens1,10)));
        -- Ajouter 5 dans Ens1
        Ajouter(Ens1,5);
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
        pragma Assert(not(Est_Vide (Ens1)));
        pragma Assert(Taille_Ensemble(Ens1) = 1);
        pragma Assert(not(Present(Ens1,2)));
        pragma Assert(Present(Ens1,5));
        pragma Assert(not(Present(Ens1,7)));
        pragma Assert(not(Present(Ens1,10)));

        -- Ajouter 28 puis 10 dans Ens1
        Ajouter(Ens1,28);
        Ajouter(Ens1,10);
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
        pragma Assert(not(Est_Vide (Ens1)));
        pragma Assert(Taille_Ensemble(Ens1) = 3);
        pragma Assert(not(Present(Ens1,2)));
        pragma Assert(Present(Ens1,5));
        pragma Assert(not(Present(Ens1,7)));
        pragma Assert(Present(Ens1,10));
        -- Ajouter 7 dans Ens1
        Ajouter(Ens1,7);
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
        pragma Assert(not(Est_Vide (Ens1)));
        pragma Assert(Taille_Ensemble(Ens1) = 4);
        pragma Assert(not(Present(Ens1,2)));
        pragma Assert(Present(Ens1,5));
        pragma Assert(Present(Ens1,7));
        pragma Assert(Present(Ens1,10));
        -- Supprimer 10 en Ens1
        Supprimer(Ens1,10);
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
        pragma Assert(not(Est_Vide (Ens1)));
        pragma Assert(Taille_Ensemble(Ens1) = 3);
        pragma Assert(not(Present(Ens1,2)));
        pragma Assert(Present(Ens1,5));
        pragma Assert(Present(Ens1,7));
        pragma Assert(not(Present(Ens1,10)));
         -- Supprimer 7 en Ens1
        Supprimer(Ens1,7);
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
        pragma Assert(not(Est_Vide (Ens1)));
        pragma Assert(Taille_Ensemble(Ens1) = 2);
        pragma Assert(not(Present(Ens1,2)));
        pragma Assert(Present(Ens1,5));
        pragma Assert(not(Present(Ens1,7)));
        pragma Assert(not(Present(Ens1,10)));
        -- Supprimer 5 en Ens1
        Supprimer(Ens1,5);
	-- Afficher l'ensemble
	Afficher (Ens1);
	New_Line;
	-- Vérifier si vide ou non, sa taille, la présence ou pas de 2, 5, 7, 10
        pragma Assert(not(Est_Vide (Ens1)));
        pragma Assert(Taille_Ensemble(Ens1) = 1);
        pragma Assert(not(Present(Ens1,2)));
        pragma Assert(not(Present(Ens1,5)));
        pragma Assert(not(Present(Ens1,7)));
        pragma Assert(not(Present(Ens1,10)));
        -- Détruire l'ensemble
        Detruire(Ens1);

end test_ensembles_sujet_chainage;


