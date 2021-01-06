import java.awt.Color;

/** Cercle modélise une courbe plane constituée de
* points situés à distance égale d'un point nommé centre.
* Cette distance est appelée rayon du cercle.
* On peut savoir si un point est à l'intérieur d'un cercle au sens large.
*
*@author Noa Cazes <noa.cazes@enseeiht.fr>
*/

public class Cercle implements Mesurable2D {

	/** On munit le cercle d'un centre.
	 */
	private Point centre;
	/** On munit le cercle d'un rayon.
	 */
	private double rayon;
	/** On munit le cercle d'une couleur.
	 */
	private Color couleur;

	/** On définit une constante appelée PI.
	 */
	public static final double PI = Math.PI;

	/** Construire un cercle à partir de son centre et de son rayon.
	 * @param c centre du cercle
	 * @param rayon rayon du cercle
	 */
	public Cercle(Point c, double rayon) {
		assert rayon > 0;
		assert c != null;
		this.centre = new Point(c.getX(), c.getY());
		this.rayon = rayon;
		this.couleur = Color.BLUE;

	}

	/** Construire un cercle à partir de
	 * deux points diamétralement opposés et de sa couleur.
	 * @param p1 un point
	 * @param p2 un point diamétralement opposé à p2
	 */
	public Cercle(Point p1, Point p2) {
		assert p1 != null;
		assert p2 != null;
		assert p1.distance(p2) != 0;
		this.rayon = p1.distance(p2) / 2;
		this.centre = new Point((p1.getX() + p2.getX()) / 2,
	    (p1.getY() + p2.getY()) / 2);
		this.couleur = Color.BLUE;
	}

	/** Construire un cercle à partir de
	 * deux points diamétralement opposés et de sa couleur.
	 * @param p un point
	 * @param p1 un point diamétralement opposé à p
	 * @param nc couleur du cercle
	 */
	public Cercle(Point p, Point p1, Color nc) {
		this(p, p1);
		assert nc != null;
		this.couleur = nc;
	}

	/** Construire un cercle à partir du centre du cercle et d'un point du cercle.
	 * @param c centre du cercle
	 * @param p un point du cercle
	 * @return le cercle créé
	 */
	public static Cercle creerCercle(Point c, Point p) {
		assert c != null;
		assert p != null;
		return new Cercle(c, c.distance(p));
	}

	/** Obtenir le centre du cercle.
	 * @return centre du cercle
	 */
	public Point getCentre() {
		return (new Point((this.centre).getX(),
				(this.centre).getY()));
	}

	/** Obtenir le rayon du cercle.
	 * @return rayon du cercle
	 */
	public double getRayon() {
		return this.rayon;
	}

	/** Obtenir le diamètre du cercle.
	 * @return diamètre du cercle
	 */
	public double getDiametre() {
		return 2 * this.rayon;
	}

	/** Obtenir la couleur du cercle.
	 * @return couleur du cercle
	 */
	public Color getCouleur() {
		return this.couleur;
	}

	/** Changer le rayon du cercle.
	 * @param nr nouveau rayon
	 */
	public void setRayon(double nr) {
		assert nr > 0;
		this.rayon = nr;
	}

	/** Changer le diamètre du cercle.
	 * @param nd le nouveau diamètre
	 */
	public void setDiametre(double nd) {
		assert nd > 0;
		this.rayon = nd / 2;
	}

	/** Changer la couleur du cercle.
	 * @param nouvelleCouleur la nouvelle couleur
	 */
	public void setCouleur(Color nouvelleCouleur) {
		assert nouvelleCouleur != null;
		this.couleur = nouvelleCouleur;
	}

	/** Translater le cercle.
	 * @param dx déplacement suivant l'axe des x
	 * @param dy déplacement suivant l'axe des y
	 */
	public void translater(double dx, double dy) {
		this.centre.translater(dx, dy);
	}

	/** Afficher le cercle.
	 * @return String la chaîne de caractères voulue
	 */
	public String toString() {
		return ("C" + this.rayon + "@" + this.centre.toString());
	}

	/** Savoir si un point est à l'intérieur (au sens large) du cercle.
	 * @param p un point quelconque
	 * @return un booléen
	 */
	public boolean contient(Point p) {
		assert p != null;
		return (p.distance(this.centre) <= this.rayon);
	}

	/** Obtenir le périmètre du cercle.
	 * @return périmètre du cercle
	 */
	public double perimetre() {
		return (2 * PI * this.rayon);
	}

	/** Obtenir l'aire du cercle.
	 * @return aire du cercle
	 */
	public double aire() {
		return (PI * this.rayon * this.rayon);
	}
}
