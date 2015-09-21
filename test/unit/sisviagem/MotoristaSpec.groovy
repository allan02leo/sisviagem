package sisviagem

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Motorista)
class MotoristaSpec extends Specification {

    void "test Contraints valid"() {
		when: "quando preencho todos os campos do motorista"
			def mt = new Motorista(nome: "Motorista1", cnh:"123456789", cat_cnh:'AB')
		then: "posso cadastrar ou alterar motorista"
			assert mt.validate()
    }
	
	void "test Contraints invalid"() {
		when: "quando não preencho todos os dados do motorista"
			def mt = new Motorista()
		then: "não passa na validação"
			assert !mt.validate()
	}
	
	void "test unicidade cnh"(){
		when: "quando tento salvar uma cnh que já esta cadastrada"
			def mt 	= new Motorista(nome: "Motorista1", cnh:"123456789", cat_cnh:'AB')
				mt.save(flush: true)
			def nmt = new Motorista(nome: "Motorista1", cnh:"123456789", cat_cnh:'AB')
		then: "não pode passar na validação"
			assert !nmt.validate()
	}
}
