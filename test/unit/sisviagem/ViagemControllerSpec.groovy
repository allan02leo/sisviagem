package sisviagem



import grails.test.mixin.*
import spock.lang.*

@TestFor(ViagemController)
@Mock(Viagem)
class ViagemControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        params["data_retorno"] = new Date()
		params["data_saida"] = new Date()
		params["km_chegada"] = '10'
		params["km_saida"] = '1'
		params["motorista_id"] = new Motorista(nome: "Motorista1", cnh:"123456789", cat_cnh:'AB')
		params["solicitacao_id"] = new Solicitacao(data: new Date(), destino: 'AB', origem: 'BA', objetivo: 'teste', observacoes: 'Nao tem', qtd_pessoas: 2, status: 'ABERTO', user: new User(username: 'admin', password: 'admin', email: 'admin@admin.com', siape: '123',  enable: true, accountExpired: false, accountLocked: false, passwordExpired: false ))
		params["veiculo_id"] = new Veiculo(placa: "AAA 1234", passageiros: 5, descricao: "Veiculo teste")
		params["status"] = 'ABERTO'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.viagemInstanceList
            model.viagemInstanceCount == 0
    }

       void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def viagem = new Viagem(params)
            controller.show(viagem)

        then:"A model is populated containing the domain instance"
            model.viagemInstance == viagem
    }

     
}
