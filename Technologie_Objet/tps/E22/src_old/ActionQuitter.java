
//package Unlock;
import java.awt.event.ActionEvent;
import java.awt.event.*;

/** Permet de définir l'action engendrée lors de l'évènement
 * appuie sur le bouton Q.
 * @author ncaze
 *
 */
public class ActionQuitter implements ActionListener {
	
	public void actionPerformed(ActionEvent quitter) {
		System.exit(1);
	}

}
