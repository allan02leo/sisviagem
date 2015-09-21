package sisviagem

class Viagem {
	
	Date data_saida = new Date()
	Date data_retorno = new Date()
	Double km_saida
	Double km_chegada
	String status
	Motorista motorista

	
	
	
	static belongsTo = [veiculo : Veiculo, motorista: Motorista, solicitacao: Solicitacao]
	
    static constraints = {
		km_saida blank: false, nullable: false
		km_chegada blank: true, nullable: true
    }
	
	static mapping = {
		data_saida sqlType: "date"
		data_retorno sqlType: "date"
	}
}
