import org.springframework.dao.DataIntegrityViolationException

class DisciplinaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [disciplinaInstanceList: Disciplina.list(params), disciplinaInstanceTotal: Disciplina.count()]
    }

    def create() {
        [disciplinaInstance: new Disciplina(params)]
    }

    def save() {
        def disciplinaInstance = new Disciplina(params)
        if (!disciplinaInstance.save(flush: true)) {
            render(view: "create", model: [disciplinaInstance: disciplinaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), disciplinaInstance.id])
        redirect(action: "show", id: disciplinaInstance.id)
    }

    def show(Long id) {
        def disciplinaInstance = Disciplina.get(id)
        if (!disciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), id])
            redirect(action: "list")
            return
        }

        [disciplinaInstance: disciplinaInstance]
    }

    def edit(Long id) {
        def disciplinaInstance = Disciplina.get(id)
        if (!disciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), id])
            redirect(action: "list")
            return
        }

        [disciplinaInstance: disciplinaInstance]
    }

    def update(Long id, Long version) {
        def disciplinaInstance = Disciplina.get(id)
        if (!disciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (disciplinaInstance.version > version) {
                disciplinaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'disciplina.label', default: 'Disciplina')] as Object[],
                          "Another user has updated this Disciplina while you were editing")
                render(view: "edit", model: [disciplinaInstance: disciplinaInstance])
                return
            }
        }

        disciplinaInstance.properties = params

        if (!disciplinaInstance.save(flush: true)) {
            render(view: "edit", model: [disciplinaInstance: disciplinaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), disciplinaInstance.id])
        redirect(action: "show", id: disciplinaInstance.id)
    }

    def delete(Long id) {
        def disciplinaInstance = Disciplina.get(id)
        if (!disciplinaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), id])
            redirect(action: "list")
            return
        }

        try {
            disciplinaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'disciplina.label', default: 'Disciplina'), id])
            redirect(action: "show", id: id)
        }
    }
}
