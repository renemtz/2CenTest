package com.ulsa.evaluacion

import org.springframework.dao.DataIntegrityViolationException

class CicloController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cicloInstanceList: Ciclo.list(params), cicloInstanceTotal: Ciclo.count()]
    }

    def create() {
        [cicloInstance: new Ciclo(params)]
    }

    def save() {
        def cicloInstance = new Ciclo(params)
        if (!cicloInstance.save(flush: true)) {
            render(view: "create", model: [cicloInstance: cicloInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ciclo.label', default: 'Ciclo'), cicloInstance.id])
        redirect(action: "show", id: cicloInstance.id)
    }

    def show(Long id) {
        def cicloInstance = Ciclo.get(id)
        if (!cicloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ciclo.label', default: 'Ciclo'), id])
            redirect(action: "list")
            return
        }

        [cicloInstance: cicloInstance]
    }

    def edit(Long id) {
        def cicloInstance = Ciclo.get(id)
        if (!cicloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ciclo.label', default: 'Ciclo'), id])
            redirect(action: "list")
            return
        }

        [cicloInstance: cicloInstance]
    }

    def update(Long id, Long version) {
        def cicloInstance = Ciclo.get(id)
        if (!cicloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ciclo.label', default: 'Ciclo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cicloInstance.version > version) {
                cicloInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ciclo.label', default: 'Ciclo')] as Object[],
                          "Another user has updated this Ciclo while you were editing")
                render(view: "edit", model: [cicloInstance: cicloInstance])
                return
            }
        }

        cicloInstance.properties = params

        if (!cicloInstance.save(flush: true)) {
            render(view: "edit", model: [cicloInstance: cicloInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ciclo.label', default: 'Ciclo'), cicloInstance.id])
        redirect(action: "show", id: cicloInstance.id)
    }

    def delete(Long id) {
        def cicloInstance = Ciclo.get(id)
        if (!cicloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ciclo.label', default: 'Ciclo'), id])
            redirect(action: "list")
            return
        }

        try {
            cicloInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ciclo.label', default: 'Ciclo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ciclo.label', default: 'Ciclo'), id])
            redirect(action: "show", id: id)
        }
    }
}
