package sisviagem

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Solicitacao)
class SolicitacaoSpec extends Specification {

	
	void "test Contraints invalid"() {
		when: "quando não preencho todos os dados da solicitacao"
			def sol = new Solicitacao()
		then: "não passa na validação"
			assert !sol.validate()
	}
}
