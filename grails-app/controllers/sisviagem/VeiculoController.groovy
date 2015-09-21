package sisviagem



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured;

@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class VeiculoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Veiculo.list(params), model:[veiculoInstanceCount: Veiculo.count()]
    }

    def show(Veiculo veiculoInstance) {
        respond veiculoInstance
    }

    def create() {
        respond new Veiculo(params)
    }

    @Transactional
    def save(Veiculo veiculoInstance) {
        if (veiculoInstance == null) {
            notFound()
            return
        }

        if (veiculoInstance.hasErrors()) {
            respond veiculoInstance.errors, view:'create'
            return
        }

        veiculoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'veiculo.label', default: 'Veiculo'), veiculoInstance.id])
                redirect veiculoInstance
            }
            '*' { respond veiculoInstance, [status: CREATED] }
        }
    }

    def edit(Veiculo veiculoInstance) {
        respond veiculoInstance
    }

    @Transactional
    def update(Veiculo veiculoInstance) {
        if (veiculoInstance == null) {
            notFound()
            return
        }

        if (veiculoInstance.hasErrors()) {
            respond veiculoInstance.errors, view:'edit'
            return
        }

        veiculoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Veiculo.label', default: 'Veiculo'), veiculoInstance.id])
                redirect veiculoInstance
            }
            '*'{ respond veiculoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Veiculo veiculoInstance) {

        if (veiculoInstance == null) {
            notFound()
            return
        }

        veiculoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Veiculo.label', default: 'Veiculo'), veiculoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'veiculo.label', default: 'Veiculo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
