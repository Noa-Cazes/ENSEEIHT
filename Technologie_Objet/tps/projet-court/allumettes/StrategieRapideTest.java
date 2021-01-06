package allumettes;
import org.junit.*;
import static org.junit.Assert.*;

/** Classe de tests pour un jeu avec la stratégie rapide.
 * 
 * @author ncazes2
 *
 */
public class StrategieRapideTest {

	// précision sur les comparaisons réelle
	public final static double EPSILON = 0.001;

	// Le joueur
	private Joueur j;

	// Les différents jeu
	private Jeu jeu1, jeu2, jeu3;

	@Before public void setUp() {
		//Créer le joueur
		j = new Joueur("Toto", new StrategieRapide());

		// Créer les différents jeux
		jeu1 = new UnJeu(13); // Un jeu avec initialement 13 allumettes
	    jeu2 = new UnJeu(2);  // Un jeu avec initialement 2 allumettes
	    jeu3 = new UnJeu(1);  // Un jeu avec initialement 1 allumette
	}

	/** Tester la procédure getNom du joueur.
	 */
	@Test public void testerGetNom() {
		assertEquals(j.getNom(), "Toto");
	}

	/** Tester la procédure getStrategie du joueur.
	 */
	@Test public void testerGetStrategie() {
		assertTrue(j.getStrategie() instanceof StrategieRapide);
	}

	/** Tester getPrise sur un jeu de 13 allumettes. 
	 */
	@Test public void testerGetPriseJeu1() {
		try {
			int nbAllumettesPrises = j.getStrategie().getPrise(jeu1);
			assertEquals(nbAllumettesPrises, 3, EPSILON);
		} catch (CoupInvalideException e) {
		}
	}

	/** Tester getPrise sur un jeu de 2 allumettes. 
	 */
	@Test public void testerGetPriseJeu2() {
		try {
			int nbAllumettesPrises = j.getStrategie().getPrise(jeu2);
			assertEquals(nbAllumettesPrises, 2, EPSILON);
		} catch (CoupInvalideException e) {
		}
	}

	/** Tester getPrise sur un jeu de 1 allumette. 
	 */
	@Test public void testerGetPriseJeu3() {
		try {
			int nbAllumettesPrises = j.getStrategie().getPrise(jeu3);
			assertEquals(nbAllumettesPrises, 1, EPSILON);
		} catch (CoupInvalideException e) {
		}
	}
}
