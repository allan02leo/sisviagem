package sisviagem;

public enum ViagemStatus {
	
	ABERTO("Aberto"), ANDAMENTO("Em andamento"), CONCLUIDO("Concluído"), CANCELADO("Cancelado")
	 
    final String value
    ViagemStatus(String value){ this.value = value }
 
    @Override
    String toString(){ value }
    String getKey() { name() }
	
}
