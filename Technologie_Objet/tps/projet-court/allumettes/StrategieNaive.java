package allumettes;
import java.util.Random;

/** Dans ce jeu donné, l'oridinateur choisi aléatoirement le nombre
 * d'allumettes à jouer.
 * @author ncazes2
 */
public class StrategieNaive implements Strategie {

	/** Demander à un joueur le nombre d'allumettes
	 * qu'il veut retirer pour un jeu donné, ici un nombre aléatoire
	 * entre 1 et Jeu.PRISE_MAX.
	 * @param jeu le jeu donné
	 * @return nbAllumettes le nombre d'allumettes que le joueur veut prendre
	 */
	@Override
	public int getPrise(Jeu jeu) {
		Random al = new Random(); //crée un générateur de nombres aléatoires
		int nbAllumettesVoulues;
		int nbAllumettesEnJeu = jeu.getNombreAllumettes();
		do { // nbre alétoire compris entre 1 et Jeu.PRISE_MAX
			nbAllumettesVoulues = al.nextInt(Jeu.PRISE_MAX) + 1;
		} while (nbAllumettesEnJeu > nbAllumettesVoulues);

		return nbAllumettesVoulues;
	}
}
