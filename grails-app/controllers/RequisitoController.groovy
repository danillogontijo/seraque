import org.springframework.dao.DataIntegrityViolationException

class RequisitoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [requisitoInstanceList: Requisito.list(params), requisitoInstanceTotal: Requisito.count()]
    }

    def create() {
        [requisitoInstance: new Requisito(params)]
    }

    def save() {
        def requisitoInstance = new Requisito(params)
        if (!requisitoInstance.save(flush: true)) {
            render(view: "create", model: [requisitoInstance: requisitoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'requisito.label', default: 'Requisito'), requisitoInstance.id])
        redirect(action: "show", id: requisitoInstance.id)
    }

    def show(Long id) {
        def requisitoInstance = Requisito.get(id)
        if (!requisitoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requisito.label', default: 'Requisito'), id])
            redirect(action: "list")
            return
        }

        [requisitoInstance: requisitoInstance]
    }

    def edit(Long id) {
        def requisitoInstance = Requisito.get(id)
        if (!requisitoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requisito.label', default: 'Requisito'), id])
            redirect(action: "list")
            return
        }

        [requisitoInstance: requisitoInstance]
    }

    def update(Long id, Long version) {
        def requisitoInstance = Requisito.get(id)
        if (!requisitoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requisito.label', default: 'Requisito'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (requisitoInstance.version > version) {
                requisitoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'requisito.label', default: 'Requisito')] as Object[],
                          "Another user has updated this Requisito while you were editing")
                render(view: "edit", model: [requisitoInstance: requisitoInstance])
                return
            }
        }

        requisitoInstance.properties = params

        if (!requisitoInstance.save(flush: true)) {
            render(view: "edit", model: [requisitoInstance: requisitoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'requisito.label', default: 'Requisito'), requisitoInstance.id])
        redirect(action: "show", id: requisitoInstance.id)
    }

    def delete(Long id) {
        def requisitoInstance = Requisito.get(id)
        if (!requisitoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requisito.label', default: 'Requisito'), id])
            redirect(action: "list")
            return
        }

        try {
            requisitoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'requisito.label', default: 'Requisito'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'requisito.label', default: 'Requisito'), id])
            redirect(action: "show", id: id)
        }
    }
}
