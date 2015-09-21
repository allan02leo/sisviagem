package sisviagem



import grails.test.mixin.*
import spock.lang.*

@TestFor(SolicitacaoController)
@Mock(Solicitacao)
class SolicitacaoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        params["data"] = new Date()
		params["destino"] = 'AB'
		params["origem"] = 'BA'
		params["objetivo"] = 'teste'
		params["observacoes"] = 'Nao tem'
		params["qtd_pessoas"] = '2'
		params["status"] = 'ABERTO'
		params["user_id"] = 1
		def user =  new User(username: 'admin', password: 'admin', email: 'admin@admin.com', siape: '123',  enable: true, accountExpired: false, accountLocked: false, passwordExpired: false )
		params["currentUser"] = user.id
		
		
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.solicitacaoInstanceList
            model.solicitacaoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.solicitacaoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def solicitacao = new Solicitacao()
            solicitacao.validate()
            controller.save(solicitacao)

        then:"The create view is rendered again with the correct model"
            model.solicitacaoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            solicitacao = new Solicitacao(params)

            controller.save(solicitacao)

        then:"A redirect is issued to the index"
            response.redirectedUrl == '/'
            
    }

    
   
}
