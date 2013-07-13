

import org.junit.*
import grails.test.mixin.*

@TestFor(MateriaAvulsaController)
@Mock(MateriaAvulsa)
class MateriaAvulsaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/materiaAvulsa/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.materiaAvulsaInstanceList.size() == 0
        assert model.materiaAvulsaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.materiaAvulsaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.materiaAvulsaInstance != null
        assert view == '/materiaAvulsa/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/materiaAvulsa/show/1'
        assert controller.flash.message != null
        assert MateriaAvulsa.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/materiaAvulsa/list'

        populateValidParams(params)
        def materiaAvulsa = new MateriaAvulsa(params)

        assert materiaAvulsa.save() != null

        params.id = materiaAvulsa.id

        def model = controller.show()

        assert model.materiaAvulsaInstance == materiaAvulsa
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/materiaAvulsa/list'

        populateValidParams(params)
        def materiaAvulsa = new MateriaAvulsa(params)

        assert materiaAvulsa.save() != null

        params.id = materiaAvulsa.id

        def model = controller.edit()

        assert model.materiaAvulsaInstance == materiaAvulsa
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/materiaAvulsa/list'

        response.reset()

        populateValidParams(params)
        def materiaAvulsa = new MateriaAvulsa(params)

        assert materiaAvulsa.save() != null

        // test invalid parameters in update
        params.id = materiaAvulsa.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/materiaAvulsa/edit"
        assert model.materiaAvulsaInstance != null

        materiaAvulsa.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/materiaAvulsa/show/$materiaAvulsa.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        materiaAvulsa.clearErrors()

        populateValidParams(params)
        params.id = materiaAvulsa.id
        params.version = -1
        controller.update()

        assert view == "/materiaAvulsa/edit"
        assert model.materiaAvulsaInstance != null
        assert model.materiaAvulsaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/materiaAvulsa/list'

        response.reset()

        populateValidParams(params)
        def materiaAvulsa = new MateriaAvulsa(params)

        assert materiaAvulsa.save() != null
        assert MateriaAvulsa.count() == 1

        params.id = materiaAvulsa.id

        controller.delete()

        assert MateriaAvulsa.count() == 0
        assert MateriaAvulsa.get(materiaAvulsa.id) == null
        assert response.redirectedUrl == '/materiaAvulsa/list'
    }
}
