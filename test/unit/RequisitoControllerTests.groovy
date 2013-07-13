

import org.junit.*
import grails.test.mixin.*

@TestFor(RequisitoController)
@Mock(Requisito)
class RequisitoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/requisito/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.requisitoInstanceList.size() == 0
        assert model.requisitoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.requisitoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.requisitoInstance != null
        assert view == '/requisito/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/requisito/show/1'
        assert controller.flash.message != null
        assert Requisito.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/requisito/list'

        populateValidParams(params)
        def requisito = new Requisito(params)

        assert requisito.save() != null

        params.id = requisito.id

        def model = controller.show()

        assert model.requisitoInstance == requisito
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/requisito/list'

        populateValidParams(params)
        def requisito = new Requisito(params)

        assert requisito.save() != null

        params.id = requisito.id

        def model = controller.edit()

        assert model.requisitoInstance == requisito
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/requisito/list'

        response.reset()

        populateValidParams(params)
        def requisito = new Requisito(params)

        assert requisito.save() != null

        // test invalid parameters in update
        params.id = requisito.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/requisito/edit"
        assert model.requisitoInstance != null

        requisito.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/requisito/show/$requisito.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        requisito.clearErrors()

        populateValidParams(params)
        params.id = requisito.id
        params.version = -1
        controller.update()

        assert view == "/requisito/edit"
        assert model.requisitoInstance != null
        assert model.requisitoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/requisito/list'

        response.reset()

        populateValidParams(params)
        def requisito = new Requisito(params)

        assert requisito.save() != null
        assert Requisito.count() == 1

        params.id = requisito.id

        controller.delete()

        assert Requisito.count() == 0
        assert Requisito.get(requisito.id) == null
        assert response.redirectedUrl == '/requisito/list'
    }
}
