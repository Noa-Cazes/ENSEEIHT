package allumettes;
//import allumettes2.Joueur;

public class Procuration implements Jeu {

	private Jeu jeu;

	public Procuration(Jeu j) {
		this.jeu = j;
	}

	/** Obtenir le nombre d'allumettes encore en jeu.
	 * @return nombre d'allumettes encore en jeu
	 */
	public int getNombreAllumettes() {
		return jeu.getNombreAllumettes();
	}

	/** Lève une exception si le joueur fait appel à la méthode retirer du jeu.
	 * @param nbPrises nombre d'allumettes prises.
	 */
	@Override
	public void retirer(int nbPrises) {
		throw new OperationInterditeException("");
	}
}
