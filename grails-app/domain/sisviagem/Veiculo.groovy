package sisviagem

class Veiculo {

    String placa
	Integer passageiros
	String descricao

    static constraints = {
		placa nullable:false, blank:false, maxSize:8, unique:true
		passageiros nullable:false, blank:false
		descricao nullable:false, blank:false
    }
}
