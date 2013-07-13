import org.springframework.dao.DataIntegrityViolationException

class MateriaAvulsaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [materiaAvulsaInstanceList: MateriaAvulsa.list(params), materiaAvulsaInstanceTotal: MateriaAvulsa.count()]
    }

    def create() {
        [materiaAvulsaInstance: new MateriaAvulsa(params)]
    }

    def save() {
        def materiaAvulsaInstance = new MateriaAvulsa(params)
        if (!materiaAvulsaInstance.save(flush: true)) {
            render(view: "create", model: [materiaAvulsaInstance: materiaAvulsaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'materiaAvulsa.label', default: 'MateriaAvulsa'), materiaAvulsaInstance.id])
        redirect(action: "show", id: materiaAvulsaInstance.id)
    }

    def show(Long id) {
        def materiaAvulsaInstance = MateriaAvulsa.get(id)
        if (!materiaAvulsaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materiaAvulsa.label', default: 'MateriaAvulsa'), id])
            redirect(action: "list")
            return
        }

        [materiaAvulsaInstance: materiaAvulsaInstance]
    }

    def edit(Long id) {
        def materiaAvulsaInstance = MateriaAvulsa.get(id)
        if (!materiaAvulsaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materiaAvulsa.label', default: 'MateriaAvulsa'), id])
            redirect(action: "list")
            return
        }

        [materiaAvulsaInstance: materiaAvulsaInstance]
    }

    def update(Long id, Long version) {
        def materiaAvulsaInstance = MateriaAvulsa.get(id)
        if (!materiaAvulsaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materiaAvulsa.label', default: 'MateriaAvulsa'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (materiaAvulsaInstance.version > version) {
                materiaAvulsaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'materiaAvulsa.label', default: 'MateriaAvulsa')] as Object[],
                          "Another user has updated this MateriaAvulsa while you were editing")
                render(view: "edit", model: [materiaAvulsaInstance: materiaAvulsaInstance])
                return
            }
        }

        materiaAvulsaInstance.properties = params

        if (!materiaAvulsaInstance.save(flush: true)) {
            render(view: "edit", model: [materiaAvulsaInstance: materiaAvulsaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'materiaAvulsa.label', default: 'MateriaAvulsa'), materiaAvulsaInstance.id])
        redirect(action: "show", id: materiaAvulsaInstance.id)
    }

    def delete(Long id) {
        def materiaAvulsaInstance = MateriaAvulsa.get(id)
        if (!materiaAvulsaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'materiaAvulsa.label', default: 'MateriaAvulsa'), id])
            redirect(action: "list")
            return
        }

        try {
            materiaAvulsaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'materiaAvulsa.label', default: 'MateriaAvulsa'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'materiaAvulsa.label', default: 'MateriaAvulsa'), id])
            redirect(action: "show", id: id)
        }
    }
}
