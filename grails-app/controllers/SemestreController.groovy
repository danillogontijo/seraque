import org.springframework.dao.DataIntegrityViolationException

class SemestreController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [semestreInstanceList: Semestre.list(params), semestreInstanceTotal: Semestre.count()]
    }

    def create() {
        [semestreInstance: new Semestre(params)]
    }

    def save() {
        def semestreInstance = new Semestre(params)
        if (!semestreInstance.save(flush: true)) {
            render(view: "create", model: [semestreInstance: semestreInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'semestre.label', default: 'Semestre'), semestreInstance.id])
        redirect(action: "show", id: semestreInstance.id)
    }

    def show(Long id) {
        def semestreInstance = Semestre.get(id)
        if (!semestreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'semestre.label', default: 'Semestre'), id])
            redirect(action: "list")
            return
        }

        [semestreInstance: semestreInstance]
    }

    def edit(Long id) {
        def semestreInstance = Semestre.get(id)
        if (!semestreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'semestre.label', default: 'Semestre'), id])
            redirect(action: "list")
            return
        }

        [semestreInstance: semestreInstance]
    }

    def update(Long id, Long version) {
        def semestreInstance = Semestre.get(id)
        if (!semestreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'semestre.label', default: 'Semestre'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (semestreInstance.version > version) {
                semestreInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'semestre.label', default: 'Semestre')] as Object[],
                          "Another user has updated this Semestre while you were editing")
                render(view: "edit", model: [semestreInstance: semestreInstance])
                return
            }
        }

        semestreInstance.properties = params

        if (!semestreInstance.save(flush: true)) {
            render(view: "edit", model: [semestreInstance: semestreInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'semestre.label', default: 'Semestre'), semestreInstance.id])
        redirect(action: "show", id: semestreInstance.id)
    }

    def delete(Long id) {
        def semestreInstance = Semestre.get(id)
        if (!semestreInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'semestre.label', default: 'Semestre'), id])
            redirect(action: "list")
            return
        }

        try {
            semestreInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'semestre.label', default: 'Semestre'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'semestre.label', default: 'Semestre'), id])
            redirect(action: "show", id: id)
        }
    }
}
