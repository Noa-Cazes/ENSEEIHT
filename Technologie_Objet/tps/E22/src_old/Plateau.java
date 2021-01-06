

public interface Plateau {		
	
		int TAILLE = 3;	// taille du plateau
		
		int NB_CARTE = 10;

	//Définition des événements qui vont influencer le modèle.

		/** Quitter le jeu. */
		void quitter();

		/** Recommencer une nouvelle partie.*/
		void recommencer();

		/** remplir la case (x,y). */
		//@ requires x >= 0 && x < TAILLE;
		//@ requires y >= 0 && y < TAILLE;
		void remplir(int x, int y, Integer n) throws CaseOccupeeException;
		
		
		/**vider la case (x,y). */
		void defausser(int x, int y);
		
	//Requêtes sur le modèle



		/** Obtenir le contenu de la case
		 * @param x colonne de la case
		 * @param y ligne de la case
		 */
		//@ requires x >= 0 && x < TAILLE;
		//@ requires y >= 0 && y < TAILLE;
		Integer AfficherCarte(int x, int y);
		
		/**
		 * Obtenir la carte de numéro n
		 * @param n 
		 */
		void SaisirNumero(int n); //modif
		
		/**
		 * Permet de résoudre une carte code et de finir le jeu
		 * @param n
		 */
		void SaisirCode (int n); //modif (j'ai juste mis un v minuscule)
}
