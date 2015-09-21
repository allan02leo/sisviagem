package sisviagem



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
@Transactional(readOnly = true)
class SolicitacaoController {

	def springSecurityService
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	@Secured(['permitAll'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		//def currentUser = springSecurityService.currentUser
        respond Solicitacao.list(params), model:[solicitacaoInstanceCount: Solicitacao.count()]
    }

    def show(Solicitacao solicitacaoInstance) {
        respond solicitacaoInstance
    }

    def create() {
        respond new Solicitacao(params)
    }

    @Transactional
    def save(Solicitacao solicitacaoInstance) {
        if (solicitacaoInstance == null) {
            notFound()
            return
        }

        if (solicitacaoInstance.hasErrors()) {
            respond solicitacaoInstance.errors, view:'create'
            return
        }

        solicitacaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'solicitacao.label', default: 'Solicitacao'), solicitacaoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*' { respond solicitacaoInstance, [status: CREATED] }
        }
    }
	
	
	
}
