-------------------------------------------------------------------------------
--  Fichier  : main.adb
--  Auteur   : MOUDDENE Hamza & CAZES Noa
--  Objectif : Programme principal
--  Crée     : Dimanche Nov 25 2019
--------------------------------------------------------------------------------

 
with Arbre_Genealogique;	use Arbre_Genealogique;
with Registre;			use Registre;
with Input;			use Input;
with Display_Shell;		use Display_Shell;


procedure main is


    Ab : T_ABG;
    Registre : T_Registre;
    ID, ID1, ID2, New_ID, Choice, Flag, Generation: Integer;
	

begin
    -- Afficher la barre d'initialisation.
    Init_Bar;
    
    <<RESTART>>
    loop
        Display_Menu;
        Input_Choice (Choice);

        case Choice is
      
            when 1 =>  -- Créer un arbre minimal.
                begin
                    -- Génerer un ID unique.
                    ID := Generate_ID (Ab);
                
                    -- Création du nouveau noeud.
                    Creer_Arbre_Minimal (Ab, ID);
                    Display_New_ID (ID);
                    Inserer_R (Registre, ID, Demander_Donnee);
                    Display_Success_Minimal_Tree_Ceation;
                    Afficher_Arbre_Noeud (Ab, ID);
                
                exception -- Gérez les exceptions.
                    when ARBRE_NON_VIDE_EXCEPTION =>
                        Display_ARBRE_NON_VIDE_EXCEPTION;
                        goto RESTART;
                end;

            when 2 =>  -- Ajouter un parent.
                <<TRY>>
                begin
                    -- Entrer l'ID de l'individu qu'on lui ajoutera un parent.
                    Input_ID ( ID, "Entrez l'ID de l'individu qu'on lui ajoutera un parent : ");
					
                    -- Entrer 0 s'il s'agit d'un père, 1 si c'est la mère.
                    Input_Flag (Flag);
                    
                    -- Génerer un ID unique.
                    New_ID := Generate_ID (Ab);
                    
                    -- Ajout du nouveau parent.
                    Ajouter_Parent (Ab, ID, New_ID, Flag);
                    Display_New_ID (New_ID);
                    Inserer_R (Registre, New_ID, Demander_Donnee);
                    Display_Success_Add_Parent;
                    Afficher_Arbre_Noeud (Ab, ID);

                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("L'ajout du parent a échoué.", 1);
                        goto RESTART;
                    when ID_ABSENT_EXCEPTION => 
                        Display_ID_ABSENT_EXCEPTION ("L'ajout du parent a échoué.", 0);
                        goto TRY;
                    when DEUX_PARENTS_PRESENTS_EXCEPTION => 
                        Display_DEUX_PARENTS_PRESENTS_EXCEPTION;
                        goto TRY;
                end;

            when 3 =>  -- Obtenir le nombre d'ancêtres.
                begin
                    -- Entrer l'ID de votre nouveau noeud.
                    Input_ID ( ID, "Entrez l'ID de l'individu que vous souhaitez connaitre le nombre de ses ancetres : ");
                    
                    -- Afficher le nombre d'ancetres.
                    Display_Number_Ancestors (Ab, ID);
                    
                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Nombre d'ancêtres a échoué.", 1);
                        goto RESTART;
                    when ID_ABSENT_EXCEPTION =>
                        Display_ID_ABSENT_EXCEPTION ("Nombre d'ancetres a échoué.", 1);
                        goto RESTART;
                end;

            when 4 =>  -- Obtenir l'ensemble des ancêtres situés à une certaine génération.
                begin
                    -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                    Input_ID ( ID, "Entrez l'ID de l'individu que vous souhaitez connaitre ses ancetres : ");
                
                    -- Entrez la géneration de ses ancetres.
                    Input_Generation (Generation);
                
                    -- Obtenir l'ensemble de ces ancetres.
                    Ancetres_N_Generation (Ab, ID, Generation);
                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Nombre d'ancêtres situés à la génération n a échoué.", 1);
                        goto RESTART;
                    when ID_ABSENT_EXCEPTION =>
                        Display_ID_ABSENT_EXCEPTION ("Nombre d'ancetres situés à la générations n a échoué.", 1);
                        goto RESTART;
                end;

            when 5 =>  -- Afficher l'arbre génealogqiue.
                begin
                    -- Entrez l'ID de l'individu que vous souhaitez afficher son arbre génealogique.
                    Input_ID ( ID, "Entrez l'ID de l'individu que vous souhaitez afficher son arbre génealogique : ");
                
                    -- Afficher l'arbre correspondante a l'ID lu au clavier.
                    Afficher_Arbre_Noeud (Ab, ID);
                
                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Afficher l'arbre génealogique a échoué.", 1);
                        goto RESTART;
                    when ID_ABSENT_EXCEPTION =>
                        Display_ID_ABSENT_EXCEPTION ("Afficher l'arbre génealogique a échoué.", 1);
                        goto RESTART;
                end;

            when 6 =>  -- Supprimer l'arbre généalogique.
                begin
                    -- Entrez l'ID de l'individu que vous souhaitez afficher son arbre génealogique.
                    Input_ID ( ID, "Entrez l'ID de l'individu que vous souhaitez supprimer son arbre génealogique : ");
                    
                    -- Supprimer l'arbre correspondant à l'ID lu au clavier..
                    Supprimer (Ab, ID);
                    Display_Success ("La Suppression de l'arbre ");
                    
                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Supprimer l'arbre généalogique a échoué.", 1);
                        goto RESTART;
                    when ID_ABSENT_EXCEPTION =>
                        Display_ID_ABSENT_EXCEPTION ("Supprimer l'arbre généalogique a échoué.", 1);
                        goto RESTART;
                end;
            
            when 7 =>  -- Obtenir l'ensemble des individus qui n'ont qu'un parent connu.
                begin
                    Individus_1_Parent_Connu (Ab);

                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Obtenir l'ensemble des individus qui n'ont qu'un parent connu a échoué.", 1);
                        goto RESTART;
                end;
            when 8 =>  -- Obtenir l'ensemble des individus dont les deux parents sont connus.
                begin
                    Individus_2_Parent_Connu (Ab);

                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Obtenir l'ensemble des individus dont les deux parents sont connus a échoué.", 1);
                        goto RESTART;
                end;
            when 9 =>  -- Obtenir l'ensemble des individus dont les deux parents sont inconnus.
                begin
                    Ensemble_Feuilles (AB);

                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Obtenir l'ensemble des individus dont les deux parents sont inconnus a échoué.", 1);
                        goto RESTART;
                end;
            when 10 =>  -- Identifier les ancêtres d'un individu donné sur N generations données par un noeud donné.
                begin
                    -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                    Input_ID ( ID, "Entrez l'ID de l'individu que vous souhaitez connaitre ses ancetres : ");
                
                    -- Entrez la géneration de ses ancetres.
                    Input_Generation (Generation);
                    
                    -- Identifier les ancêtres d'un individu donné sur N generations.
                    Ancetres_Sur_N_Generation (Ab, ID, Generation);

                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("les ancêtres d'un individu donné sur n generations a échoué.", 1);
                        goto RESTART;
                end;
            
            when 11 =>  -- Vérifier que deux individus n et m ont un ou plusieurs ancêtres homonymes (mêmes non et prénom).
                begin
                    
                -- Entrer l'ID de l'individu que vous souhaitez connaitre ses ancetres.
                Input_ID ( ID1, "Entrez l'ID de l'individu 1 : ");
                Input_ID ( ID2, "Entrez l'ID de l'individu 2 : ");
                
                -- Vérifier que deux individus n et m ont un ou plusieurs ancêtres homonymes (mêmes non et prénom).
                Display_Is_Homonym (Ancetres_Homonymes (Ab, Registre, ID1, ID2));

                exception -- Gérez les exceptions.
                    when ARBRE_VIDE_EXCEPTION =>
                        Display_ARBRE_VIDE_EXCEPTION ("Ancêtres homonymes a échoué.", 1);
                        goto RESTART;
                    when ID_ABSENT_EXCEPTION =>
                        Display_ID_ABSENT_EXCEPTION ("Ancêtres homonymes a échoué.", 1);
                        goto RESTART;
                end;

            when others =>
                Null;
                
        end case;
        
        exit when (choice = 0);  -- Quitter le programme.
    end loop;
	
    -- Afficher la barre de fin d'exécution.
    End_Bar;

end main;
