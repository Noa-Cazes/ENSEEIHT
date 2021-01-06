package allumettes;

/** Pour cette stratégie, l'ordinateur prend le maximum d'allumettes possible
 * (de manière à ce que la partie se termlien le plus rapidement possible).
 * @author ncazes2
 */
public class StrategieRapide implements Strategie {

	/** Demander à un joueur le nombre d'allumettes
	 * qu'il veut rétirer pour un jeu donné.
	 * @param jeu le jeu donné
	 * @return nbAllumettes le nombre d'allumettes que le joueur veut prendre
	 */
	@Override
	public int getPrise(Jeu jeu) {
		int nbAllumettesPrises = 0;
		int nbAllumettesEnJeu = jeu.getNombreAllumettes();

		if (nbAllumettesEnJeu > 0) {
			if (nbAllumettesEnJeu > Jeu.PRISE_MAX) {
				nbAllumettesPrises = Jeu.PRISE_MAX;
			} else { // 1 <= nbAllumettesPrises <= Jeu.PRISE_MAX
				nbAllumettesPrises = nbAllumettesEnJeu;
			}
		}
		return nbAllumettesPrises;

	}
}
