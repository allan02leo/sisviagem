package sisviagem



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class ViagemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Viagem.list(params), model:[viagemInstanceCount: Viagem.count()]
    }

    def show(Viagem viagemInstance) {
        respond viagemInstance
    }

    def create() {
        respond new Viagem(params), model:[solicitacao: Solicitacao.findById(params.id)]
    }

    @Transactional
    def save(Viagem viagemInstance) {
        if (viagemInstance == null) {
            notFound()
            return
        }

        if (viagemInstance.hasErrors()) {
            respond viagemInstance.errors, view:'create'
            return
        }

        viagemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'viagem.label', default: 'Viagem'), viagemInstance.id])
                redirect viagemInstance
            }
            '*' { respond viagemInstance, [status: CREATED] }
        }
    }

    def edit(Viagem viagemInstance) {
        respond viagemInstance
    }

    @Transactional
    def update(Viagem viagemInstance) {
        if (viagemInstance == null) {
            notFound()
            return
        }

        if (viagemInstance.hasErrors()) {
            respond viagemInstance.errors, view:'edit'
            return
        }

        viagemInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Viagem.label', default: 'Viagem'), viagemInstance.id])
                redirect viagemInstance
            }
            '*'{ respond viagemInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Viagem viagemInstance) {

        if (viagemInstance == null) {
            notFound()
            return
        }

        viagemInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Viagem.label', default: 'Viagem'), viagemInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'viagem.label', default: 'Viagem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
