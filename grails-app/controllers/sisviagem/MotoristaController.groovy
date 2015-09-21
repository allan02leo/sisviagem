package sisviagem



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class MotoristaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Motorista.list(params), model:[motoristaInstanceCount: Motorista.count()]
    }

    def show(Motorista motoristaInstance) {
        respond motoristaInstance
    }

    def create() {
        respond new Motorista(params)
    }

    @Transactional
    def save(Motorista motoristaInstance) {
        if (motoristaInstance == null) {
            notFound()
            return
        }

        if (motoristaInstance.hasErrors()) {
            respond motoristaInstance.errors, view:'create'
            return
        }

        motoristaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'motorista.label', default: 'Motorista'), motoristaInstance.id])
                redirect motoristaInstance
            }
            '*' { respond motoristaInstance, [status: CREATED] }
        }
    }

    def edit(Motorista motoristaInstance) {
        respond motoristaInstance
    }

    @Transactional
    def update(Motorista motoristaInstance) {
        if (motoristaInstance == null) {
            notFound()
            return
        }

        if (motoristaInstance.hasErrors()) {
            respond motoristaInstance.errors, view:'edit'
            return
        }

        motoristaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Motorista.label', default: 'Motorista'), motoristaInstance.id])
                redirect motoristaInstance
            }
            '*'{ respond motoristaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Motorista motoristaInstance) {

        if (motoristaInstance == null) {
            notFound()
            return
        }

        motoristaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Motorista.label', default: 'Motorista'), motoristaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'motorista.label', default: 'Motorista'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
