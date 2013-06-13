package com.ulsa.evaluacion

import org.springframework.dao.DataIntegrityViolationException

class CalificaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [calificaInstanceList: Califica.list(params), calificaInstanceTotal: Califica.count()]
    }

    def create() {
        [calificaInstance: new Califica(params)]
    }

    def save() {
        def calificaInstance = new Califica(params)
        if (!calificaInstance.save(flush: true)) {
            render(view: "create", model: [calificaInstance: calificaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'califica.label', default: 'Califica'), calificaInstance.id])
        redirect(action: "show", id: calificaInstance.id)
    }

    def show(Long id) {
        def calificaInstance = Califica.get(id)
        if (!calificaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'califica.label', default: 'Califica'), id])
            redirect(action: "list")
            return
        }

        [calificaInstance: calificaInstance]
    }

    def edit(Long id) {
        def calificaInstance = Califica.get(id)
        if (!calificaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'califica.label', default: 'Califica'), id])
            redirect(action: "list")
            return
        }

        [calificaInstance: calificaInstance]
    }

    def update(Long id, Long version) {
        def calificaInstance = Califica.get(id)
        if (!calificaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'califica.label', default: 'Califica'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (calificaInstance.version > version) {
                calificaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'califica.label', default: 'Califica')] as Object[],
                          "Another user has updated this Califica while you were editing")
                render(view: "edit", model: [calificaInstance: calificaInstance])
                return
            }
        }

        calificaInstance.properties = params

        if (!calificaInstance.save(flush: true)) {
            render(view: "edit", model: [calificaInstance: calificaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'califica.label', default: 'Califica'), calificaInstance.id])
        redirect(action: "show", id: calificaInstance.id)
    }

    def delete(Long id) {
        def calificaInstance = Califica.get(id)
        if (!calificaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'califica.label', default: 'Califica'), id])
            redirect(action: "list")
            return
        }

        try {
            calificaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'califica.label', default: 'Califica'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'califica.label', default: 'Califica'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def calificar(long id) {
		def clase = Clase.get(id)
		if (!clase) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'clase.label', default: 'Clase'), id])
			redirect(controller: "clase", action: "list")
			return
		}
		[clase: clase]
		
	}
	
	def save_calificaciones() {
		System.out.println(params)
	}
}
