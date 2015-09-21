package sisviagem

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Veiculo)
class VeiculoSpec extends Specification {

   void "test Contraints valid"() {
		when: "quando preencho todos os campos do veiculo"
			def v = new Veiculo(placa: "AAA 1234", passageiros: 5, descricao: "Veiculo teste")
		then: "posso cadastrar ou alterar setor"
			assert v.validate()
    }
	
	void "test Contraints invalid"() {
		when: "quando não preencho todos os dados do veiculo"
			def v = new Veiculo()
		then: "não passa na validação"
			assert !v.validate()
	}
	
	void "test unicidade placa"(){
		when: "quando tento salvar um veiculo que já esta cadastrado"
			def v1 	= new Veiculo(placa: "AAA 1234", passageiros: 5, descricao: "Veiculo teste")
				v1.save(flush: true)
			def v2 = new Veiculo(placa: "AAA 1234", passageiros: 5, descricao: "Veiculo teste")
		then: "não pode passar na validação"
			assert !v2.validate()
	}
}
