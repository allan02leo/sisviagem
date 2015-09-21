import sisviagem.Role
import sisviagem.User
import sisviagem.UserRole

class BootStrap {

  def init = { servletContext ->
		Role userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(flush: true)
		Role adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(flush: true)
		
		User admin = User.findByUsername('admin') ?: new User(username: 'admin', password: 'admin', email: 'admin@admin.com', siape: '123',  enable: true, accountExpired: false, accountLocked: false, passwordExpired: false ).save(flush: true)
		User user  = User.findByUsername('user') ?: new User(username: 'user', password: 'user', email: 'user@user.com', siape: '321',  enable: true, accountExpired: false, accountLocked: false, passwordExpired: false ).save(flush: true)
		
		UserRole.findByUserAndRole(admin, adminRole) ?: new UserRole(user: admin, role: adminRole).save(flush: true)
		UserRole.findByUserAndRole(user, userRole) ?: new UserRole(user: user, role: userRole).save(flush: true)
	
		
    }
    def destroy = {
    }
}