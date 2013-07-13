import org.springframework.dao.DataIntegrityViolationException

class InstituicaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [instituicaoInstanceList: Instituicao.list(params), instituicaoInstanceTotal: Instituicao.count()]
    }

    def create() {
        [instituicaoInstance: new Instituicao(params)]
    }

    def save() {
        def instituicaoInstance = new Instituicao(params)
        if (!instituicaoInstance.save(flush: true)) {
            render(view: "create", model: [instituicaoInstance: instituicaoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'instituicao.label', default: 'Instituicao'), instituicaoInstance.id])
        redirect(action: "show", id: instituicaoInstance.id)
    }

    def show(Long id) {
        def instituicaoInstance = Instituicao.get(id)
        if (!instituicaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'instituicao.label', default: 'Instituicao'), id])
            redirect(action: "list")
            return
        }

        [instituicaoInstance: instituicaoInstance]
    }

    def edit(Long id) {
        def instituicaoInstance = Instituicao.get(id)
        if (!instituicaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'instituicao.label', default: 'Instituicao'), id])
            redirect(action: "list")
            return
        }

        [instituicaoInstance: instituicaoInstance]
    }

    def update(Long id, Long version) {
        def instituicaoInstance = Instituicao.get(id)
        if (!instituicaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'instituicao.label', default: 'Instituicao'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (instituicaoInstance.version > version) {
                instituicaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'instituicao.label', default: 'Instituicao')] as Object[],
                          "Another user has updated this Instituicao while you were editing")
                render(view: "edit", model: [instituicaoInstance: instituicaoInstance])
                return
            }
        }

        instituicaoInstance.properties = params

        if (!instituicaoInstance.save(flush: true)) {
            render(view: "edit", model: [instituicaoInstance: instituicaoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'instituicao.label', default: 'Instituicao'), instituicaoInstance.id])
        redirect(action: "show", id: instituicaoInstance.id)
    }

    def delete(Long id) {
        def instituicaoInstance = Instituicao.get(id)
        if (!instituicaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'instituicao.label', default: 'Instituicao'), id])
            redirect(action: "list")
            return
        }

        try {
            instituicaoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'instituicao.label', default: 'Instituicao'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'instituicao.label', default: 'Instituicao'), id])
            redirect(action: "show", id: id)
        }
    }
}
