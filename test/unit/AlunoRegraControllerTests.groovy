

import org.junit.*
import grails.test.mixin.*

@TestFor(AlunoRegraController)
@Mock(AlunoRegra)
class AlunoRegraControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/alunoRegra/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.alunoRegraInstanceList.size() == 0
        assert model.alunoRegraInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.alunoRegraInstance != null
    }

    void testSave() {
        controller.save()

        assert model.alunoRegraInstance != null
        assert view == '/alunoRegra/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/alunoRegra/show/1'
        assert controller.flash.message != null
        assert AlunoRegra.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/alunoRegra/list'


        populateValidParams(params)
        def alunoRegra = new AlunoRegra(params)

        assert alunoRegra.save() != null

        params.id = alunoRegra.id

        def model = controller.show()

        assert model.alunoRegraInstance == alunoRegra
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/alunoRegra/list'


        populateValidParams(params)
        def alunoRegra = new AlunoRegra(params)

        assert alunoRegra.save() != null

        params.id = alunoRegra.id

        def model = controller.edit()

        assert model.alunoRegraInstance == alunoRegra
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/alunoRegra/list'

        response.reset()


        populateValidParams(params)
        def alunoRegra = new AlunoRegra(params)

        assert alunoRegra.save() != null

        // test invalid parameters in update
        params.id = alunoRegra.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/alunoRegra/edit"
        assert model.alunoRegraInstance != null

        alunoRegra.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/alunoRegra/show/$alunoRegra.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        alunoRegra.clearErrors()

        populateValidParams(params)
        params.id = alunoRegra.id
        params.version = -1
        controller.update()

        assert view == "/alunoRegra/edit"
        assert model.alunoRegraInstance != null
        assert model.alunoRegraInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/alunoRegra/list'

        response.reset()

        populateValidParams(params)
        def alunoRegra = new AlunoRegra(params)

        assert alunoRegra.save() != null
        assert AlunoRegra.count() == 1

        params.id = alunoRegra.id

        controller.delete()

        assert AlunoRegra.count() == 0
        assert AlunoRegra.get(alunoRegra.id) == null
        assert response.redirectedUrl == '/alunoRegra/list'
    }
}
