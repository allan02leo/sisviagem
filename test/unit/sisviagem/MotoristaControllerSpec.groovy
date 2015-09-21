package sisviagem



import grails.test.mixin.*
import spock.lang.*

@TestFor(MotoristaController)
@Mock(Motorista)
class MotoristaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
		params["nome"] = 'Motorista de teste'
		params["cnh"] = '123131321'
		params["cat_cnh"] = 'AB'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.motoristaInstanceList
            model.motoristaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.motoristaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def motorista = new Motorista()
            motorista.validate()
            controller.save(motorista)

        then:"The create view is rendered again with the correct model"
            model.motoristaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            motorista = new Motorista(params)

            controller.save(motorista)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/motorista/show/1'
            controller.flash.message != null
            Motorista.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def motorista = new Motorista(params)
            controller.show(motorista)

        then:"A model is populated containing the domain instance"
            model.motoristaInstance == motorista
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def motorista = new Motorista(params)
            controller.edit(motorista)

        then:"A model is populated containing the domain instance"
            model.motoristaInstance == motorista
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/motorista/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def motorista = new Motorista()
            motorista.validate()
            controller.update(motorista)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.motoristaInstance == motorista

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            motorista = new Motorista(params).save(flush: true)
            controller.update(motorista)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/motorista/show/$motorista.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/motorista/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def motorista = new Motorista(params).save(flush: true)

        then:"It exists"
            Motorista.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(motorista)

        then:"The instance is deleted"
            Motorista.count() == 0
            response.redirectedUrl == '/motorista/index'
            flash.message != null
    }
}
