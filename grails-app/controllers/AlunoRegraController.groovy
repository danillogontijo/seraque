import org.springframework.dao.DataIntegrityViolationException

class AlunoRegraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [alunoRegraInstanceList: AlunoRegra.list(params), alunoRegraInstanceTotal: AlunoRegra.count()]
    }

    def create() {
        [alunoRegraInstance: new AlunoRegra(params)]
    }

    def save() {
        def alunoRegraInstance = new AlunoRegra(params)
        if (!alunoRegraInstance.save(flush: true)) {
            render(view: "create", model: [alunoRegraInstance: alunoRegraInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'alunoRegra.label', default: 'AlunoRegra'), alunoRegraInstance.id])
        redirect(action: "show", id: alunoRegraInstance.id)
    }

    def show() {
        def alunoRegraInstance = AlunoRegra.get(params.id)
        if (!alunoRegraInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alunoRegra.label', default: 'AlunoRegra'), params.id])
            redirect(action: "list")
            return
        }

        [alunoRegraInstance: alunoRegraInstance]
    }

    def edit() {
        def alunoRegraInstance = AlunoRegra.get(params.id)
        if (!alunoRegraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'alunoRegra.label', default: 'AlunoRegra'), params.id])
            redirect(action: "list")
            return
        }

        [alunoRegraInstance: alunoRegraInstance]
    }

    def update() {
        def alunoRegraInstance = AlunoRegra.get(params.id)
        if (!alunoRegraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'alunoRegra.label', default: 'AlunoRegra'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (alunoRegraInstance.version > version) {
                alunoRegraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'alunoRegra.label', default: 'AlunoRegra')] as Object[],
                          "Another user has updated this AlunoRegra while you were editing")
                render(view: "edit", model: [alunoRegraInstance: alunoRegraInstance])
                return
            }
        }

        alunoRegraInstance.properties = params

        if (!alunoRegraInstance.save(flush: true)) {
            render(view: "edit", model: [alunoRegraInstance: alunoRegraInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'alunoRegra.label', default: 'AlunoRegra'), alunoRegraInstance.id])
        redirect(action: "show", id: alunoRegraInstance.id)
    }

    def delete() {
        def alunoRegraInstance = AlunoRegra.get(params.id)
        if (!alunoRegraInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alunoRegra.label', default: 'AlunoRegra'), params.id])
            redirect(action: "list")
            return
        }

        try {
            alunoRegraInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'alunoRegra.label', default: 'AlunoRegra'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'alunoRegra.label', default: 'AlunoRegra'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
