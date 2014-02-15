package br.com.soaexpert;
import javax.ejb.Local;

@Local
public interface CalculoEJBLocal {

	public int somar(int nr1, int nr2);
}
