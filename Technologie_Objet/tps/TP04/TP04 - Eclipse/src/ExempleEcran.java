import java.awt.Color;
import afficheur.*;

/** Création d'un écran muni d'axes sur lesquels sont dessinés des points, un segment, un cercle et un texte.
* @author Noa Cazes
*/

public class ExempleEcran {
    
	/** Construire le schéma et l'afficher.
	 * @param args les arguments de la ligne de commande.
	 */
    public static void main(String[] args) {

        Ecran Ec = new Ecran("Exemple Ecran", 400, 250, 15);

        // Construire l'écran.
        Ec.dessinerAxes();

        // Construire les dessins dessus.
        Ec.dessinerPoint(1,2, Color.green);
        Ec.dessinerLigne(6,2,11,9, Color.red);
        Ec.dessinerCercle(4,4,2.5, Color.yellow);
        Ec.dessinerTexte(1,-2, "Premier dessin", Color.blue);
   }
}

