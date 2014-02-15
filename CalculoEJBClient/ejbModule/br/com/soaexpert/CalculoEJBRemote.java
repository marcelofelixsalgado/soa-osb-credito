package br.com.soaexpert;
import javax.ejb.Remote;

@Remote
public interface CalculoEJBRemote {

	public int somar(int nr1, int nr2);
	
}
