package com.ulsa.evaluacion

import org.springframework.dao.DataIntegrityViolationException

class CicloMateriaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cicloMateriaInstanceList: CicloMateria.list(params), cicloMateriaInstanceTotal: CicloMateria.count()]
    }

    def create() {
        [cicloMateriaInstance: new CicloMateria(params)]
    }

    def save() {
        def cicloMateriaInstance = new CicloMateria(params)
        if (!cicloMateriaInstance.save(flush: true)) {
            render(view: "create", model: [cicloMateriaInstance: cicloMateriaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cicloMateria.label', default: 'CicloMateria'), cicloMateriaInstance.id])
        redirect(action: "show", id: cicloMateriaInstance.id)
    }

    def show(Long id) {
        def cicloMateriaInstance = CicloMateria.get(id)
        if (!cicloMateriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cicloMateria.label', default: 'CicloMateria'), id])
            redirect(action: "list")
            return
        }

        [cicloMateriaInstance: cicloMateriaInstance]
    }

    def edit(Long id) {
        def cicloMateriaInstance = CicloMateria.get(id)
        if (!cicloMateriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cicloMateria.label', default: 'CicloMateria'), id])
            redirect(action: "list")
            return
        }

        [cicloMateriaInstance: cicloMateriaInstance]
    }

    def update(Long id, Long version) {
        def cicloMateriaInstance = CicloMateria.get(id)
        if (!cicloMateriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cicloMateria.label', default: 'CicloMateria'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cicloMateriaInstance.version > version) {
                cicloMateriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cicloMateria.label', default: 'CicloMateria')] as Object[],
                          "Another user has updated this CicloMateria while you were editing")
                render(view: "edit", model: [cicloMateriaInstance: cicloMateriaInstance])
                return
            }
        }

        cicloMateriaInstance.properties = params

        if (!cicloMateriaInstance.save(flush: true)) {
            render(view: "edit", model: [cicloMateriaInstance: cicloMateriaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cicloMateria.label', default: 'CicloMateria'), cicloMateriaInstance.id])
        redirect(action: "show", id: cicloMateriaInstance.id)
    }

    def delete(Long id) {
        def cicloMateriaInstance = CicloMateria.get(id)
        if (!cicloMateriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cicloMateria.label', default: 'CicloMateria'), id])
            redirect(action: "list")
            return
        }

        try {
            cicloMateriaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cicloMateria.label', default: 'CicloMateria'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cicloMateria.label', default: 'CicloMateria'), id])
            redirect(action: "show", id: id)
        }
    }
}
