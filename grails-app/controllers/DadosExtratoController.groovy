import org.springframework.dao.DataIntegrityViolationException

class DadosExtratoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [dadosExtratoInstanceList: DadosExtrato.list(params), dadosExtratoInstanceTotal: DadosExtrato.count()]
    }

    def create() {
        [dadosExtratoInstance: new DadosExtrato(params)]
    }

    def save() {
        def dadosExtratoInstance = new DadosExtrato(params)
        if (!dadosExtratoInstance.save(flush: true)) {
            render(view: "create", model: [dadosExtratoInstance: dadosExtratoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'dadosExtrato.label', default: 'DadosExtrato'), dadosExtratoInstance.id])
        redirect(action: "show", id: dadosExtratoInstance.id)
    }

    def show(Long id) {
        def dadosExtratoInstance = DadosExtrato.get(id)
        if (!dadosExtratoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dadosExtrato.label', default: 'DadosExtrato'), id])
            redirect(action: "list")
            return
        }

        [dadosExtratoInstance: dadosExtratoInstance]
    }

    def edit(Long id) {
        def dadosExtratoInstance = DadosExtrato.get(id)
        if (!dadosExtratoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dadosExtrato.label', default: 'DadosExtrato'), id])
            redirect(action: "list")
            return
        }

        [dadosExtratoInstance: dadosExtratoInstance]
    }

    def update(Long id, Long version) {
        def dadosExtratoInstance = DadosExtrato.get(id)
        if (!dadosExtratoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dadosExtrato.label', default: 'DadosExtrato'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dadosExtratoInstance.version > version) {
                dadosExtratoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dadosExtrato.label', default: 'DadosExtrato')] as Object[],
                          "Another user has updated this DadosExtrato while you were editing")
                render(view: "edit", model: [dadosExtratoInstance: dadosExtratoInstance])
                return
            }
        }

        dadosExtratoInstance.properties = params

        if (!dadosExtratoInstance.save(flush: true)) {
            render(view: "edit", model: [dadosExtratoInstance: dadosExtratoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dadosExtrato.label', default: 'DadosExtrato'), dadosExtratoInstance.id])
        redirect(action: "show", id: dadosExtratoInstance.id)
    }

    def delete(Long id) {
        def dadosExtratoInstance = DadosExtrato.get(id)
        if (!dadosExtratoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dadosExtrato.label', default: 'DadosExtrato'), id])
            redirect(action: "list")
            return
        }

        try {
            dadosExtratoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dadosExtrato.label', default: 'DadosExtrato'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dadosExtrato.label', default: 'DadosExtrato'), id])
            redirect(action: "show", id: id)
        }
    }
}
