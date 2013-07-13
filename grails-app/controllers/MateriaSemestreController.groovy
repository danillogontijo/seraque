import org.springframework.dao.DataIntegrityViolationException

class MateriaSemestreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [materiaSemestreInstanceList: MateriaSemestre.list(params), materiaSemestreInstanceTotal: MateriaSemestre.count()]
    }

    def create() {
        [materiaSemestreInstance: new MateriaSemestre(params)]
    }

    def save() {
        def materiaSemestreInstance = new MateriaSemestre(params)
        if (!materiaSemestreInstance.save(flush: true)) {
            render(view: "create", model: [materiaSemestreInstance: materiaSemestreInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'materiaSemestre.label', default: 'MateriaSemestre'), materiaSemestreInstance.id])
        redirect(action: "show", id: materiaSemestreInstance.id)
    }

    def show(Long id) {
        def materiaSemestreInstance = MateriaSemestre.get(id)
        if (!materiaSemestreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materiaSemestre.label', default: 'MateriaSemestre'), id])
            redirect(action: "list")
            return
        }

        [materiaSemestreInstance: materiaSemestreInstance]
    }

    def edit(Long id) {
        def materiaSemestreInstance = MateriaSemestre.get(id)
        if (!materiaSemestreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materiaSemestre.label', default: 'MateriaSemestre'), id])
            redirect(action: "list")
            return
        }

        [materiaSemestreInstance: materiaSemestreInstance]
    }

    def update(Long id, Long version) {
        def materiaSemestreInstance = MateriaSemestre.get(id)
        if (!materiaSemestreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materiaSemestre.label', default: 'MateriaSemestre'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (materiaSemestreInstance.version > version) {
                materiaSemestreInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'materiaSemestre.label', default: 'MateriaSemestre')] as Object[],
                          "Another user has updated this MateriaSemestre while you were editing")
                render(view: "edit", model: [materiaSemestreInstance: materiaSemestreInstance])
                return
            }
        }

        materiaSemestreInstance.properties = params

        if (!materiaSemestreInstance.save(flush: true)) {
            render(view: "edit", model: [materiaSemestreInstance: materiaSemestreInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'materiaSemestre.label', default: 'MateriaSemestre'), materiaSemestreInstance.id])
        redirect(action: "show", id: materiaSemestreInstance.id)
    }

    def delete(Long id) {
        def materiaSemestreInstance = MateriaSemestre.get(id)
        if (!materiaSemestreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materiaSemestre.label', default: 'MateriaSemestre'), id])
            redirect(action: "list")
            return
        }

        try {
            materiaSemestreInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'materiaSemestre.label', default: 'MateriaSemestre'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'materiaSemestre.label', default: 'MateriaSemestre'), id])
            redirect(action: "show", id: id)
        }
    }
}
