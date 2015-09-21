package sisviagem

class Solicitacao {
	
	Date data = new Date()
	String origem
	String destino
	String objetivo
	String observacoes
	String status = "Aberto"
	Integer qtd_pessoas = 1
	
	static belongsTo = [user: User] 
	
    static constraints = {
		origem blank: false, nullable: false
		destino blank: false, nullable: false
		objetivo blank: false, nullable: false
		observacoes nullable: true, blank: true
		status nullable: true, blank: true
		
		
		
    }
	
	static mapping = {
		data sqlType: "date"
	}
}
