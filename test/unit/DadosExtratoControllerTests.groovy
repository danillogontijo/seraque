

import org.junit.*
import grails.test.mixin.*

@TestFor(DadosExtratoController)
@Mock(DadosExtrato)
class DadosExtratoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dadosExtrato/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dadosExtratoInstanceList.size() == 0
        assert model.dadosExtratoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.dadosExtratoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dadosExtratoInstance != null
        assert view == '/dadosExtrato/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dadosExtrato/show/1'
        assert controller.flash.message != null
        assert DadosExtrato.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dadosExtrato/list'

        populateValidParams(params)
        def dadosExtrato = new DadosExtrato(params)

        assert dadosExtrato.save() != null

        params.id = dadosExtrato.id

        def model = controller.show()

        assert model.dadosExtratoInstance == dadosExtrato
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dadosExtrato/list'

        populateValidParams(params)
        def dadosExtrato = new DadosExtrato(params)

        assert dadosExtrato.save() != null

        params.id = dadosExtrato.id

        def model = controller.edit()

        assert model.dadosExtratoInstance == dadosExtrato
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dadosExtrato/list'

        response.reset()

        populateValidParams(params)
        def dadosExtrato = new DadosExtrato(params)

        assert dadosExtrato.save() != null

        // test invalid parameters in update
        params.id = dadosExtrato.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dadosExtrato/edit"
        assert model.dadosExtratoInstance != null

        dadosExtrato.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dadosExtrato/show/$dadosExtrato.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dadosExtrato.clearErrors()

        populateValidParams(params)
        params.id = dadosExtrato.id
        params.version = -1
        controller.update()

        assert view == "/dadosExtrato/edit"
        assert model.dadosExtratoInstance != null
        assert model.dadosExtratoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dadosExtrato/list'

        response.reset()

        populateValidParams(params)
        def dadosExtrato = new DadosExtrato(params)

        assert dadosExtrato.save() != null
        assert DadosExtrato.count() == 1

        params.id = dadosExtrato.id

        controller.delete()

        assert DadosExtrato.count() == 0
        assert DadosExtrato.get(dadosExtrato.id) == null
        assert response.redirectedUrl == '/dadosExtrato/list'
    }
}
