//package Unlock;

/**
 * Exception qui indique qu'une combinaison est invalide (B+B,R+R,B+G ...)
 * @author ipeltier
 *
 */
public class CombinaisonInvalideException extends Exception{
	public CombinaisonInvalideException (String message) {
			super(message);
		}
}
