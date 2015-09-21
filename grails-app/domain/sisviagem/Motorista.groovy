package sisviagem

class Motorista {

    String nome
	String cnh
	String cat_cnh

	static constraints = {
		nome nullable:false, blank:false
		cnh  nullable:false, blank:false, maxSize:20, unique:true
		cat_cnh nullable:false, blank:false, maxSize:2
	}
	
	static hasMany = [viagens: Viagem]
  
}
