import org.springframework.dao.DataIntegrityViolationException

class RegraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [regraInstanceList: Regra.list(params), regraInstanceTotal: Regra.count()]
    }

    def create() {
        [regraInstance: new Regra(params)]
    }

    def save() {
        def regraInstance = new Regra(params)
        if (!regraInstance.save(flush: true)) {
            render(view: "create", model: [regraInstance: regraInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'regra.label', default: 'Regra'), regraInstance.id])
        redirect(action: "show", id: regraInstance.id)
    }

    def show() {
        def regraInstance = Regra.get(params.id)
        if (!regraInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'regra.label', default: 'Regra'), params.id])
            redirect(action: "list")
            return
        }

        [regraInstance: regraInstance]
    }

    def edit() {
        def regraInstance = Regra.get(params.id)
        if (!regraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regra.label', default: 'Regra'), params.id])
            redirect(action: "list")
            return
        }

        [regraInstance: regraInstance]
    }

    def update() {
        def regraInstance = Regra.get(params.id)
        if (!regraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regra.label', default: 'Regra'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (regraInstance.version > version) {
                regraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'regra.label', default: 'Regra')] as Object[],
                          "Another user has updated this Regra while you were editing")
                render(view: "edit", model: [regraInstance: regraInstance])
                return
            }
        }

        regraInstance.properties = params

        if (!regraInstance.save(flush: true)) {
            render(view: "edit", model: [regraInstance: regraInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'regra.label', default: 'Regra'), regraInstance.id])
        redirect(action: "show", id: regraInstance.id)
    }

    def delete() {
        def regraInstance = Regra.get(params.id)
        if (!regraInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'regra.label', default: 'Regra'), params.id])
            redirect(action: "list")
            return
        }

        try {
            regraInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'regra.label', default: 'Regra'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'regra.label', default: 'Regra'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
