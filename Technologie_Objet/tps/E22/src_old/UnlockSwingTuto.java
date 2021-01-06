
//package Unlock;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.HashMap;
import java.util.Map;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class UnlockSwingTuto {

	// Le plateau du jeu Unlock
	private Tuto modele;	

    //  Les éléments de la vue (IHM)

	/** Fenêtre principale */
	private JFrame fenetre;


	/** Cases du jeu */
	private final JLabel[][] cases = new JLabel[4][3];
	
	/** Petit menu */
	private final JMenuBar menuBar = new JMenuBar();
	
	private Map<Integer, ImageIcon> images;

	private final JTextField zoneMsg = new JTextField(50);
// Le constructeur
// ---------------

	/** Construire le jeu Unlock */
	public UnlockSwingTuto() {
		this(new Tuto());
	}

	/** Construire le jeu de morpion */
	public UnlockSwingTuto(Tuto modele) {
		// Initialiser le modèle
		this.modele = modele;

		// Créer les cases du jeu Unlock
		for (int i = 0; i < this.cases.length; i++) {
			for (int j = 0; j < this.cases[i].length; j++) {
				this.cases[i][j] = new JLabel();
			}
		}
		// les images à utiliser en fonction de l'état du jeu.
		images = new HashMap<Integer, ImageIcon>();
		 {
			Carte[] jeuCarte = modele.getJeuCarte();
			for (int i=0; i<Plateau.NB_CARTE; i++) {
				images.put( jeuCarte[i].getNumero(), new ImageIcon(jeuCarte[i].getNomImg()));
			}	
		}

		// Initialiser le jeu
		this.recommencer();
		

		// Construire la vue (présentation)
		//	Définir la fenêtre principale
		this.fenetre = new JFrame();
		// Ajouter un titre
		fenetre.setTitle("Unlock tuto");
		// Emplacement de la fenêtre
		//this.fenetre.setLocation(0 ,200);
		Dimension dimension = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
		this.fenetre.setPreferredSize(dimension);
		// Taille de la fenêtre
		//this.fenetre.setSize(700, 100);
		// Redimensionner la fenêtre
		this.fenetre.setResizable(true);
		
		java.awt.Container contenu = this.fenetre.getContentPane(); // contenu de la fenêtre principale
		JPanel grille = new JPanel(new GridLayout(3,4));
		
		//contenu.add(new GridLayout(3,3), BorderLayout.WEST);
		
		// Définir la position des Plateau.TAILLE JLabel des cases
		for (int i = 0; i < this.cases.length; i++) {
			for (int j = 0; j < this.cases[i].length; j++) {
				grille.add(this.cases[i][j]);
				final int x = i;
				final int y = j;
				this.cases[i][j].addMouseListener(new MouseAdapter() {
					@Override
					public void mouseClicked(MouseEvent ev) {
						if (ev.getSource()==cases[x][y]) {
								modele.decouvrir(x, y);
								majImg();
								cases[x][y].setIcon(images.get(modele.AfficherCarte(x, y)));
						}
					}
				});
			}
		}
		contenu.setLayout(new FlowLayout());
		contenu.add(grille);
		//JPanel code = new JPanel(new FlowLayout());
		//code.add(zoneMsg);
		//contenu.add(code, BorderLayout.SOUTH);
		// Crétion du petit menu
		JMenu menu = new JMenu("Jouer");
		this.menuBar.add(menu);
		
		JMenuItem itemNouvellePartie = new JMenuItem("Nouvelle partie");
		itemNouvellePartie.addActionListener(new ActionNouvellePartieTuto());
	    menu.add(itemNouvellePartie);
	    
	    JMenuItem itemQuitter = new JMenuItem("Quitter");
	    itemQuitter.addActionListener(new ActionQuitter());
	    menu.add(itemQuitter);
	    
	    JMenuItem itemSaisirCode = new JMenuItem("Saisir un code");
	    itemSaisirCode.addActionListener(new ActionSaisirCode(this));
	    menu.add(itemSaisirCode);
	    
	    
	    fenetre.setJMenuBar(this.menuBar);
		

		// Construire le contrôleur (gestion des événements)
		this.fenetre.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	
		
		/*
		 * for (int i = 0; i < this.cases.length; i++) { for (int j = 0; j <
		 * this.cases[i].length; j++) { selecCarte clique = new selecCarte(this, i, j);
		 * this.cases[i][j].addMouseListener(clique);
		 * 
		 * }
		 * 
		 * }
		 */

		// afficher la fenêtre
		this.fenetre.pack();			// redimmensionner la fenêtre
		this.fenetre.setVisible(true);	// l'afficher
	}
	
	class ActionNouvellePartieTuto implements ActionListener {
		public void actionPerformed(ActionEvent nouvellePartie) {
			recommencer();
		}
	}

	
	
	
// Les getters utiles
		
		
		/** Obtenir les cases.
		 * @return cases les cases du jeu
		 */
		public JLabel[][] getCases() {
			return this.cases;
		}
		
		/** Obtenir images.
		 * @return images 
		 */
		public Map<Integer, ImageIcon> getImages() {
			return images;
		}
		
		/** Obtenir le modéle.
		 * @return modele le modéle
		 */
		public Plateau getModele() {
			return this.modele; 
		}
// Quelques réactions aux interactions de l'utilisateur
// ----------------------------------------------------

	/** Recommencer une nouvelle partie. */
	public void recommencer() {
		this.modele.recommencer();

		// Vider les cases
		for (int k = 0; k < this.cases.length; k++) {
			for (int l = 0; l < this.cases[k].length; l++) {
				this.cases[k][l].setIcon(images.get(this.modele.AfficherCarte(k, l)));
			}
		}
	}
	
	public void majImg() {
		images = new HashMap<Integer, ImageIcon>();
		 {
			Carte[] jeuCarte = modele.getJeuCarte();
			for (int i=0; i<Plateau.NB_CARTE; i++) {
				images.put( jeuCarte[i].getNumero(), new ImageIcon(jeuCarte[i].getNomImg()));
			}	
		}
	}
	
	public void SaisirNumero(int n) {
		this.modele.SaisirNumero(n);
		
	}

// La méthode principale
// ---------------------

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				new UnlockSwingTuto();
			}
		});
	}

	public void SaisirCode(int n) {
		this.modele.SaisirCode(n);
		
		
	}
}
