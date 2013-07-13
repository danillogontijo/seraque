

import org.junit.*
import grails.test.mixin.*

@TestFor(MateriaSemestreController)
@Mock(MateriaSemestre)
class MateriaSemestreControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/materiaSemestre/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.materiaSemestreInstanceList.size() == 0
        assert model.materiaSemestreInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.materiaSemestreInstance != null
    }

    void testSave() {
        controller.save()

        assert model.materiaSemestreInstance != null
        assert view == '/materiaSemestre/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/materiaSemestre/show/1'
        assert controller.flash.message != null
        assert MateriaSemestre.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/materiaSemestre/list'

        populateValidParams(params)
        def materiaSemestre = new MateriaSemestre(params)

        assert materiaSemestre.save() != null

        params.id = materiaSemestre.id

        def model = controller.show()

        assert model.materiaSemestreInstance == materiaSemestre
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/materiaSemestre/list'

        populateValidParams(params)
        def materiaSemestre = new MateriaSemestre(params)

        assert materiaSemestre.save() != null

        params.id = materiaSemestre.id

        def model = controller.edit()

        assert model.materiaSemestreInstance == materiaSemestre
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/materiaSemestre/list'

        response.reset()

        populateValidParams(params)
        def materiaSemestre = new MateriaSemestre(params)

        assert materiaSemestre.save() != null

        // test invalid parameters in update
        params.id = materiaSemestre.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/materiaSemestre/edit"
        assert model.materiaSemestreInstance != null

        materiaSemestre.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/materiaSemestre/show/$materiaSemestre.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        materiaSemestre.clearErrors()

        populateValidParams(params)
        params.id = materiaSemestre.id
        params.version = -1
        controller.update()

        assert view == "/materiaSemestre/edit"
        assert model.materiaSemestreInstance != null
        assert model.materiaSemestreInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/materiaSemestre/list'

        response.reset()

        populateValidParams(params)
        def materiaSemestre = new MateriaSemestre(params)

        assert materiaSemestre.save() != null
        assert MateriaSemestre.count() == 1

        params.id = materiaSemestre.id

        controller.delete()

        assert MateriaSemestre.count() == 0
        assert MateriaSemestre.get(materiaSemestre.id) == null
        assert response.redirectedUrl == '/materiaSemestre/list'
    }
}
