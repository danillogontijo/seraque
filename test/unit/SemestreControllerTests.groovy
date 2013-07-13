

import org.junit.*
import grails.test.mixin.*

@TestFor(SemestreController)
@Mock(Semestre)
class SemestreControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/semestre/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.semestreInstanceList.size() == 0
        assert model.semestreInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.semestreInstance != null
    }

    void testSave() {
        controller.save()

        assert model.semestreInstance != null
        assert view == '/semestre/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/semestre/show/1'
        assert controller.flash.message != null
        assert Semestre.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/semestre/list'

        populateValidParams(params)
        def semestre = new Semestre(params)

        assert semestre.save() != null

        params.id = semestre.id

        def model = controller.show()

        assert model.semestreInstance == semestre
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/semestre/list'

        populateValidParams(params)
        def semestre = new Semestre(params)

        assert semestre.save() != null

        params.id = semestre.id

        def model = controller.edit()

        assert model.semestreInstance == semestre
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/semestre/list'

        response.reset()

        populateValidParams(params)
        def semestre = new Semestre(params)

        assert semestre.save() != null

        // test invalid parameters in update
        params.id = semestre.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/semestre/edit"
        assert model.semestreInstance != null

        semestre.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/semestre/show/$semestre.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        semestre.clearErrors()

        populateValidParams(params)
        params.id = semestre.id
        params.version = -1
        controller.update()

        assert view == "/semestre/edit"
        assert model.semestreInstance != null
        assert model.semestreInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/semestre/list'

        response.reset()

        populateValidParams(params)
        def semestre = new Semestre(params)

        assert semestre.save() != null
        assert Semestre.count() == 1

        params.id = semestre.id

        controller.delete()

        assert Semestre.count() == 0
        assert Semestre.get(semestre.id) == null
        assert response.redirectedUrl == '/semestre/list'
    }
}
