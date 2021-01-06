import afficheur.*;
import afficheur.AfficheurSVG;
import java.awt.Color;

/** Construire le schéma proposé dans le sujet de TP avec des points,
  * et des segments.
  *
  * @author	Xavier Crégut
  * @version	$Revision: 1.7 $
  */
public class ExempleSchema1 {

	/** Construire le schéma et le manipuler.
	  * Le schéma est affiché.
	  * @param args les arguments de la ligne de commande
	  */
	public static void main(String[] args)
	{
		// Créer les trois segments
		Point p1 = new Point(3, 2);
		Point p2 = new Point(6, 9);
		Point p3 = new Point(11, 4);
		Segment s12 = new Segment(p1, p2);
		Segment s23 = new Segment(p2, p3);
		Segment s31 = new Segment(p3, p1);

		// Créer le barycentre
		double sx = p1.getX() + p2.getX() + p3.getX();
		double sy = p1.getY() + p2.getY() + p3.getY();
		Point barycentre = new Point(sx / 3, sy / 3);
        
		// Afficher les données du schéma
	    System.out.println("Le schéma est composé de : ");
	    s12.afficher();		System.out.println();
	    s23.afficher();		System.out.println();
	    s31.afficher();		System.out.println();
	    barycentre.afficher();	System.out.println();
	    
	    AfficheurTexte afft = new AfficheurTexte();
	    afft.dessinerLigne(p1.getX(), p1.getY(), p2.getX(), p2.getY(), Color.blue);
		afft.dessinerLigne(p2.getX(), p2.getY(), p3.getX(), p3.getY(), Color.red);
		afft.dessinerLigne(p3.getX(), p3.getY(), p1.getX(), p1.getY(), Color.green);
		afft.dessinerPoint(barycentre.getX(), barycentre.getY(), Color.pink);
		
		// Afficher les 3 segments et le barycentre graphiquement
		Ecran Ec = new Ecran("Schéma 1", 600, 400, 20);
		Ec.dessinerAxes();
		Ec.dessinerLigne(p1.getX(), p1.getY(), p2.getX(), p2.getY(), Color.blue);
		Ec.dessinerLigne(p2.getX(), p2.getY(), p3.getX(), p3.getY(), Color.red);
		Ec.dessinerLigne(p3.getX(), p3.getY(), p1.getX(), p1.getY(), Color.green);
		Ec.dessinerPoint(barycentre.getX(), barycentre.getY(), Color.pink);
		
		AfficheurSVG aff = new AfficheurSVG("Exercice 3", "AfficheurSVG du schéma", 600, 400);
		aff.dessinerLigne(p1.getX(), p1.getY(), p2.getX(), p2.getY(), Color.blue);
		aff.dessinerLigne(p2.getX(), p2.getY(), p3.getX(), p3.getY(), Color.red);
		aff.dessinerLigne(p3.getX(), p3.getY(), p1.getX(), p1.getY(), Color.green);
		aff.dessinerPoint(barycentre.getX(), barycentre.getY(), Color.pink);
		aff.ecrire();
		aff.ecrire("schema.svg");
		
		// Translater le schéma sur l'écran
		s12.translater(4, -3);
		s23.translater(4, -3);
		s31.translater(4, -3);
		double sx1 = p1.getX() + p2.getX() + p3.getX();
		double sy1 = p1.getY() + p2.getY() + p3.getY();
		Point barycentre1 = new Point(sx1 / 3, sy1 / 3);
		
        
        // Afficher les points translatés
        System.out.println("Le schéma translaté est composé de : ");
	    s12.afficher();		System.out.println();
	    s23.afficher();		System.out.println();
	    s31.afficher();	    System.out.println();
	    barycentre1.afficher(); System.out.println();
	    
	    afft.dessinerLigne(p1.getX(), p1.getY(), p2.getX(), p2.getY(), Color.blue);
		afft.dessinerLigne(p2.getX(), p2.getY(), p3.getX(), p3.getY(), Color.red);
		afft.dessinerLigne(p3.getX(), p3.getY(), p1.getX(), p1.getY(), Color.green);
		afft.dessinerPoint(barycentre1.getX(), barycentre1.getY(), Color.pink);
        
	    // Afficher les 3 segments et le barycentre graphiquement

    	Ec.dessinerLigne(p1.getX(), p1.getY(), p2.getX(), p2.getY(), Color.blue);
    	Ec.dessinerLigne(p2.getX(), p2.getY(), p3.getX(), p3.getY(), Color.red);
    	Ec.dessinerLigne(p3.getX(), p3.getY(), p1.getX(), p1.getY(), Color.green);
    	Ec.dessinerPoint(barycentre1.getX(), barycentre1.getY(), Color.pink);
	    
    	aff.dessinerLigne(p1.getX(), p1.getY(), p2.getX(), p2.getY(), Color.blue);
    	aff.dessinerLigne(p2.getX(), p2.getY(), p3.getX(), p3.getY(), Color.red);
    	aff.dessinerLigne(p3.getX(), p3.getY(), p1.getX(), p1.getY(), Color.green);
    	aff.dessinerPoint(barycentre1.getX(), barycentre1.getY(), Color.pink);
		aff.ecrire();
		aff.ecrire("schema.svg");
	}

}
