package sisviagem

class Setor {

    String nome
	
    static constraints = {
		nome blank: false, nullable: false, unique: true
    }
	
	static hasMany = [users: User]
}
