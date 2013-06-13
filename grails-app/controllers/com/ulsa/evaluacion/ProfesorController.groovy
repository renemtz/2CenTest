package com.ulsa.evaluacion

import org.springframework.dao.DataIntegrityViolationException

class ProfesorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [profesorInstanceList: Profesor.list(params), profesorInstanceTotal: Profesor.count()]
    }

    def create() {
        [profesorInstance: new Profesor(params)]
    }

    def save() {
        def profesorInstance = new Profesor(params)
        if (!profesorInstance.save(flush: true)) {
            render(view: "create", model: [profesorInstance: profesorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'profesor.label', default: 'Profesor'), profesorInstance.id])
        redirect(action: "show", id: profesorInstance.id)
    }

    def show(Long id) {
        def profesorInstance = Profesor.get(id)
        if (!profesorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profesor.label', default: 'Profesor'), id])
            redirect(action: "list")
            return
        }

        [profesorInstance: profesorInstance]
    }

    def edit(Long id) {
        def profesorInstance = Profesor.get(id)
        if (!profesorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profesor.label', default: 'Profesor'), id])
            redirect(action: "list")
            return
        }

        [profesorInstance: profesorInstance]
    }

    def update(Long id, Long version) {
        def profesorInstance = Profesor.get(id)
        if (!profesorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profesor.label', default: 'Profesor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (profesorInstance.version > version) {
                profesorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'profesor.label', default: 'Profesor')] as Object[],
                          "Another user has updated this Profesor while you were editing")
                render(view: "edit", model: [profesorInstance: profesorInstance])
                return
            }
        }

        profesorInstance.properties = params

        if (!profesorInstance.save(flush: true)) {
            render(view: "edit", model: [profesorInstance: profesorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'profesor.label', default: 'Profesor'), profesorInstance.id])
        redirect(action: "show", id: profesorInstance.id)
    }

    def delete(Long id) {
        def profesorInstance = Profesor.get(id)
        if (!profesorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'profesor.label', default: 'Profesor'), id])
            redirect(action: "list")
            return
        }

        try {
            profesorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'profesor.label', default: 'Profesor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'profesor.label', default: 'Profesor'), id])
            redirect(action: "show", id: id)
        }
    }
}
