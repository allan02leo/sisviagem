package sisviagem



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Transactional(readOnly = true)

class UserController {
	
	def springSecurityService // injection of Spring Security

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	@Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }
	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def show(User userInstance) {
        respond userInstance
    }

	@Secured(['permitAll'])
    def create() {
		def user = springSecurityService.getPrincipal()
			[userInstance: new User(params)]
        respond new User(params)
    }

	@Secured(['permitAll'])
    @Transactional
    def save(User userInstance) {
		
		
		if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }
		
		def map=params
		
        userInstance.save flush:true
		
		if (!userInstance.authorities.contains(Role.findByAuthority(params.role))) {
			UserRole.create userInstance, Role.findByAuthority(params.role)
		}
	
		flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
		

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect action: "index", controller:"motorista" , method:"GET"
            }
            '*' { respond userInstance, [status: CREATED] }
        }
		
		
		
	
		
    }

	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def edit(User userInstance) {
        respond userInstance
    }

	@Secured(['ROLE_USER', 'ROLE_ADMIN'])
    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action: "index", controller:"motorista" , method:"GET"
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

	@Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
