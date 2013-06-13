package com.ulsa.evaluacion

import org.springframework.dao.DataIntegrityViolationException

class EvaluacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [evaluacionInstanceList: Evaluacion.list(params), evaluacionInstanceTotal: Evaluacion.count()]
    }

    def create() {
        [evaluacionInstance: new Evaluacion(params)]
    }

    def save() {
        def evaluacionInstance = new Evaluacion(params)
        if (!evaluacionInstance.save(flush: true)) {
            render(view: "create", model: [evaluacionInstance: evaluacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'evaluacion.label', default: 'Evaluacion'), evaluacionInstance.id])
        redirect(action: "show", id: evaluacionInstance.id)
    }

    def show(Long id) {
        def evaluacionInstance = Evaluacion.get(id)
        if (!evaluacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evaluacion.label', default: 'Evaluacion'), id])
            redirect(action: "list")
            return
        }

        [evaluacionInstance: evaluacionInstance]
    }

    def edit(Long id) {
        def evaluacionInstance = Evaluacion.get(id)
        if (!evaluacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evaluacion.label', default: 'Evaluacion'), id])
            redirect(action: "list")
            return
        }

        [evaluacionInstance: evaluacionInstance]
    }

    def update(Long id, Long version) {
        def evaluacionInstance = Evaluacion.get(id)
        if (!evaluacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evaluacion.label', default: 'Evaluacion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (evaluacionInstance.version > version) {
                evaluacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'evaluacion.label', default: 'Evaluacion')] as Object[],
                          "Another user has updated this Evaluacion while you were editing")
                render(view: "edit", model: [evaluacionInstance: evaluacionInstance])
                return
            }
        }

        evaluacionInstance.properties = params

        if (!evaluacionInstance.save(flush: true)) {
            render(view: "edit", model: [evaluacionInstance: evaluacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'evaluacion.label', default: 'Evaluacion'), evaluacionInstance.id])
        redirect(action: "show", id: evaluacionInstance.id)
    }

    def delete(Long id) {
        def evaluacionInstance = Evaluacion.get(id)
        if (!evaluacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'evaluacion.label', default: 'Evaluacion'), id])
            redirect(action: "list")
            return
        }

        try {
            evaluacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'evaluacion.label', default: 'Evaluacion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'evaluacion.label', default: 'Evaluacion'), id])
            redirect(action: "show", id: id)
        }
    }
}
