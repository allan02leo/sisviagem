package sisviagem

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Setor)
class SetorSpec extends Specification {

   void "test Contraints valid"() {
		when: "quando preencho todos os campos do setor"
			def st = new Setor(nome: "Transporte")
		then: "posso cadastrar ou alterar setor"
			assert st.validate()
    }
	
	void "test Contraints invalid"() {
		when: "quando não preencho todos os dados do motorista"
			def st = new Setor()
		then: "não passa na validação"
			assert !st.validate()
	}
	
	void "test unicidade nome"(){
		when: "quando tento salvar um setor que já esta cadastrado"
			def st 	= new Setor(nome: "Transporte")
				st.save(flush: true)
			def nst = new Setor(nome: "Transporte")
		then: "não pode passar na validação"
			assert !nst.validate()
	}
}
