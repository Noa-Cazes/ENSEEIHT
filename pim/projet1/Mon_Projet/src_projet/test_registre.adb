with Ada.Text_IO; use Ada.Text_IO;
with registre; use registre;
with Ada.Characters.Latin_1;    use Ada.Characters.Latin_1;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;


procedure test_registre is


    -- Création d'un registre avec un Id et ses données.
    procedure Initialiser_Le_Test (Registre : out T_Registre) is
        Donnee : T_Donnee;
    begin
        -- Initialisation du registre.
        Initialiser_R(Registre);

        -- Inscription d'une donnée.
        Donnee := Initialiser_Donnee (To_Unbounded_String("Max"),To_Unbounded_String("Lili"),18091999,To_Unbounded_String("Paris"),00000000,To_Unbounded_String("Vivant"),'F',To_Unbounded_String("Lili.Max@gmail.com"),0678953421,7, 21);

        Inserer_R(Registre, 3, Donnee);
    end Initialiser_Le_Test;


    -- Création d'un registre avec un Id et ses données.
    procedure Initialiser_Le_Test_Avec_3_Elts (Registre : in out T_Registre) is
        Donnee1 : T_Donnee;
        Donnee2 : T_Donnee;
        Donnee3 : T_Donnee;
    begin
        -- Initialisation du registre.
        Initialiser_R(Registre);

        -- Inscription de Donnee1.
        Donnee1 := Initialiser_Donnee (To_Unbounded_String("Max"),To_Unbounded_String("Lili"),18091999,To_Unbounded_String("Paris"),00000000,To_Unbounded_String("Vivant"),'F',To_Unbounded_String("Lili.Max@gmail.com"),0678953421,7, 21);

        -- Insertion de l'Id 3, avec Donnee1, dans Registre.
        Inserer_R(Registre, 3, Donnee1);

        -- Inscription de Donnee2.
        Donnee2 := Initialiser_Donnee (To_Unbounded_String("Dupont"),To_Unbounded_String("Baptiste"),21121925,To_Unbounded_String("Toulouse"),01092001,To_Unbounded_String("Toulouse"),'H',To_Unbounded_String("Dupont.Baptiste@gmail.com"),0656673421, 10, 76);
        -- Insertion de l'Id 8, avec Donnee2, dans Registre.
        Inserer_R(Registre, 8, Donnee2);

         -- Inscription de Donnee3.
        Donnee3 := Initialiser_Donnee (To_Unbounded_String("Halwani"),To_Unbounded_String("Jad"),11021998,To_Unbounded_String("Lille"),02052019,To_Unbounded_String("Toulouse"),'H',To_Unbounded_String("Halwani.Jad@gmail.com"),0656693421, -1, 52);
        -- Insertion de l'Id 20, avec Donnee3, dans Registre.
        Inserer_R(Registre, 20, Donnee3);

    end Initialiser_Le_Test_Avec_3_Elts;


    -- Tester les procédures Initialiser_R et Est_Vide_R
    procedure Tester_Initialiser_R_Et_Est_Vide_R is
        Registre : T_Registre;
    begin
        -- Initialisation du registre.
        Initialiser_R(Registre);

        pragma Assert (Est_Vide_R(Registre));

        -- Libération de la mémoire.
        Vider_R(Registre);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Initialiser_R_Et_Est_Vide_R est ");
        Put_Line ("         testée avec succès.");
        New_Line;
    end Tester_Initialiser_R_Et_Est_Vide_R;


    -- Tester la procédure Taille_R
    procedure Tester_Taille_R is
        Registre : T_Registre;
    begin
        -- Création d'un registre avec un 3 Id et leurs données.
        Initialiser_Le_Test_Avec_3_Elts(Registre);

        pragma Assert(Taille_R(Registre)=3);
        pragma Assert(not(Taille_R(Registre)=5));

        -- Suppression de l'Id 3 et de ses données du registre.
        Supprimer_R(Registre,3);
        pragma Assert(Taille_R(Registre)=2);
        pragma Assert(not(Taille_R(Registre)=8));

        -- Suppression de l'Id 8 et de ses données du registre.
        Supprimer_R(Registre,8);
        pragma Assert(Taille_R(Registre)=1);
        pragma Assert(not(Taille_R(Registre)=2));

        -- Libération de la mémoire.
        Vider_R(Registre);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Taille_R est testée avec succès.");
        New_Line;
    end Tester_Taille_R;


    -- Tester la procédure Inserer_R
    procedure Tester_Inserer_R is
        Registre : T_Registre;
        Donnee : T_Donnee;
    begin
        -- Création d'un registre avec un Id et ses données.
        Initialiser_Le_Test(Registre);

        -- Inscription d'une donnée.
        Donnee := Initialiser_Donnee (To_Unbounded_String("Dupont"),To_Unbounded_String("Baptiste"),21121925,To_Unbounded_String("Toulouse"),01092001,To_Unbounded_String("Toulouse"),'H',To_Unbounded_String("Dupont.Baptiste@gmail.com"),0656673421, 10, 76);

        -- Insertion de l'Id 8 avec ses données dans le registre.
        Inserer_R(Registre, 8, Donnee);

        pragma Assert(La_Donnee_R(Registre,8)=Donnee);

        -- Libération de la mémoire.
        Vider_R(Registre);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Inserer_R est testée avec succès.");
        New_Line;
    end Tester_Inserer_R;


    -- Tester la procédure Modifier_R
    procedure Tester_Modifier_R is
        Registre : T_Registre;
        Donnee : T_Donnee;       -- la donnée avec laquelle on en modifie une autre.
    begin
        -- Création d'un registre avec un Id et ses données.
        Initialiser_Le_Test(Registre);

        -- Inscription d'une donnée.
        Donnee := Initialiser_Donnee (To_Unbounded_String("Dupont"),To_Unbounded_String("Baptiste"),21121925,To_Unbounded_String("Toulouse"),01092001,To_Unbounded_String("Toulouse"),'H',To_Unbounded_String("Dupont.Baptiste@gmail.com"),0656673421, 10, 76);

        -- Modification des données de l'Id présent avec Donnee.
        Modifier_R(Registre, 3, Donnee);
        pragma Assert(La_Donnee_R(Registre, 3) = Donnee);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Modifier_R est testée avec succès.");
        New_Line;
    end Tester_Modifier_R;


    -- Tester la procédure Supprimer_R
    procedure Tester_Supprimer_R is
        Registre : T_Registre;
    begin
         -- Création d'un registre avec un 3 Id et leurs données.
        Initialiser_Le_Test_Avec_3_Elts(Registre);
        pragma Assert (Taille_R (Registre) = 3);

        -- Suppression de l'Id 3 et de ses données du registre.
        Supprimer_R(Registre, 3);
        pragma Assert (Taille_R (Registre) = 2);

        -- Suppression de l'Id 8 et de ses données du registre.
        Supprimer_R(Registre, 8);
        pragma Assert (Taille_R (Registre) = 1);

        -- Suppression de l'Id 20 et de ses données du registre.
        Supprimer_R(Registre, 20);
        pragma Assert (Taille_R (Registre) = 0);
        pragma Assert (Est_Vide_R (Registre));

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Supprimer_R est testée avec succès.");
        New_Line;
    end Tester_Supprimer_R;


    -- Tester la procédure La_Donnee_R
    procedure Tester_La_Donnee_R is
        Registre : T_Registre;
        Donnee1 : T_Donnee;
        Donnee2 : T_Donnee;
        Donnee3 : T_Donnee;
    begin
         -- Création d'un registre avec un 3 Id et leurs données.
        Initialiser_Le_Test_Avec_3_Elts(Registre);

        Donnee1 := Initialiser_Donnee (To_Unbounded_String("Max"),To_Unbounded_String("Lili"),18091999,To_Unbounded_String("Paris"),00000000,To_Unbounded_String("Vivant"),'F',To_Unbounded_String("Lili.Max@gmail.com"),0678953421,7, 21);
        Donnee2 := Initialiser_Donnee (To_Unbounded_String("Dupont"),To_Unbounded_String("Baptiste"),21121925,To_Unbounded_String("Toulouse"),01092001,To_Unbounded_String("Toulouse"),'H',To_Unbounded_String("Dupont.Baptiste@gmail.com"),0656673421, 10, 76);
        Donnee3 := Initialiser_Donnee (To_Unbounded_String("Halwani"),To_Unbounded_String("Jad"),11021998,To_Unbounded_String("Lille"),02052019,To_Unbounded_String("Toulouse"),'H',To_Unbounded_String("Halwani.Jad@gmail.com"),0656693421, -1, 52);
        pragma Assert(La_Donnee_R(Registre,3) = Donnee1);
        pragma Assert(La_Donnee_R(Registre,8) = Donnee2);
        pragma Assert(La_Donnee_R(Registre,20) = Donnee3);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_La_Donnee_R est testée avec succès.");
        New_Line;
    end Tester_La_Donnee_R;


    -- Tester la fonction Vider_R
    procedure Tester_Vider_R is
        Registre : T_Registre;
    begin
        -- Création d'un registre avec un Id et ses données.
        Initialiser_Le_Test(Registre);

        Vider_R(Registre);

        pragma Assert(Taille_R(Registre)=0);

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Vider_R est testée avec succès.");
        New_Line;
    end Tester_Vider_R;


    -- Tester la fonction Ecart_Age_Parent_Enfant_R
    procedure Tester_Ecart_Age_Parent_Enfant_R is
        Registre : T_Registre;
        Id : constant Integer := 3;    -- Identifiant de l'enfant
        Parent_0 : T_Tab;              -- l'enfant n'a pas de parent
        Parent_1 : T_Tab;              -- l'enfant a un parent
        Parent_2 : T_Tab;              -- l'enfant a deux parents
    begin
        -- Création d'un registre avec un Id et ses données.
        Initialiser_Le_Test_Avec_3_Elts(Registre);

        Parent_0.Taille := 0;
        Parent_1.Taille := 1;
        Parent_1.Elt(1) := 8;
        Parent_2.Taille := 2;
        Parent_2.Elt(1) := 8;
        Parent_2.Elt(2) := 20;

        pragma Assert(not (Ecart_Age_Parent_Enfant_R(Registre,Id, Parent_0)));
        pragma Assert(Ecart_Age_Parent_Enfant_R(Registre,Id, Parent_1));
        pragma Assert(Ecart_Age_Parent_Enfant_R(Registre,Id,Parent_2));

        New_Line;
        Put_Line (ESC & "[32m" & "RÉUSSI : " & ESC & "[0m" & "Procedure Tester_Ecart_Age_Parent_EnfantSupprimer_R ");
        Put_Line("         est testée avec succès.");
        New_Line;
    end Tester_Ecart_Age_Parent_Enfant_R;


begin
    New_Line;
    Put_Line("*************************** Début ****************************");
    New_Line;

    Tester_Initialiser_R_Et_Est_Vide_R;
    Tester_Taille_R;
    Tester_Inserer_R;
    Tester_Modifier_R;
    Tester_Supprimer_R;
    Tester_La_Donnee_R;
    Tester_Vider_R;
    Tester_Ecart_Age_Parent_Enfant_R;

    New_Line;
    Put_Line("***************************** Fin ****************************");
    New_Line;
end test_registre;
