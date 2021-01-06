package allumettes;
public class UnJeu implements Jeu {

	private int nombreAllumettes;

	public UnJeu(int nbAllumettesDebut) {
		this.nombreAllumettes = nbAllumettesDebut;
	}

	/** Obtenir le nombre d'allumettes encore en jeu.
	 * @return nombreAllumettes le nombre d'allumettes encore en jeu
	 */
	public int getNombreAllumettes() {
		return this.nombreAllumettes;
	}

	/** Retirer des allumettes.  Le nombre d'allumettes doit être compris
	 * entre 1 et PRISE_MAX, dans la limite du nombre d'allumettes encore
	 * en jeu.
	 * @param nbPrises nombre d'allumettes prises.
	 * @throws CoupInvalideException tentative de prendre
	 * un nombre invalide d'allumettes
	 */

	public void retirer(int nbPrises) throws CoupInvalideException {
		if (nbPrises <= 0) {
			throw new CoupInvalideException(nbPrises, "< 1");
		} else if (nbPrises > this.nombreAllumettes) {
			throw new CoupInvalideException(nbPrises, "> "
		                    + this.nombreAllumettes);
		} else if (nbPrises > Jeu.PRISE_MAX) {
			throw new CoupInvalideException(nbPrises, "> " + Jeu.PRISE_MAX);
		} else {
			this.nombreAllumettes = this.nombreAllumettes - nbPrises;
		}
	}
}
