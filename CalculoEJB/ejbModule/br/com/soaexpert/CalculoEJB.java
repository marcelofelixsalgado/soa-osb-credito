package br.com.soaexpert;

import javax.ejb.Stateless;

/**
 * Session Bean implementation class CalculoEJB
 */
@Stateless(mappedName = "CalculoEJB")
public class CalculoEJB implements CalculoEJBRemote, CalculoEJBLocal {

    /**
     * Default constructor. 
     */
    public CalculoEJB() {
    }

	public int somar(int nr1, int nr2) {
		return nr1 + nr2;
	}
    
}
