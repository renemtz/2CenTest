package com.ulsa.evaluacion

import org.springframework.dao.DataIntegrityViolationException

class GrupoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [grupoInstanceList: Grupo.list(params), grupoInstanceTotal: Grupo.count()]
    }

    def create() {
        [grupoInstance: new Grupo(params)]
    }

    def save() {
        def grupoInstance = new Grupo(params)
        if (!grupoInstance.save(flush: true)) {
            render(view: "create", model: [grupoInstance: grupoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'grupo.label', default: 'Grupo'), grupoInstance.id])
        redirect(action: "show", id: grupoInstance.id)
    }

    def show(Long id) {
        def grupoInstance = Grupo.get(id)
        if (!grupoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupo.label', default: 'Grupo'), id])
            redirect(action: "list")
            return
        }

        [grupoInstance: grupoInstance]
    }

    def edit(Long id) {
        def grupoInstance = Grupo.get(id)
        if (!grupoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupo.label', default: 'Grupo'), id])
            redirect(action: "list")
            return
        }

        [grupoInstance: grupoInstance]
    }

    def update(Long id, Long version) {
        def grupoInstance = Grupo.get(id)
        if (!grupoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupo.label', default: 'Grupo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (grupoInstance.version > version) {
                grupoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'grupo.label', default: 'Grupo')] as Object[],
                          "Another user has updated this Grupo while you were editing")
                render(view: "edit", model: [grupoInstance: grupoInstance])
                return
            }
        }

        grupoInstance.properties = params

        if (!grupoInstance.save(flush: true)) {
            render(view: "edit", model: [grupoInstance: grupoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'grupo.label', default: 'Grupo'), grupoInstance.id])
        redirect(action: "show", id: grupoInstance.id)
    }

    def delete(Long id) {
        def grupoInstance = Grupo.get(id)
        if (!grupoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupo.label', default: 'Grupo'), id])
            redirect(action: "list")
            return
        }

        try {
            grupoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'grupo.label', default: 'Grupo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'grupo.label', default: 'Grupo'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def crear(Long id) {
		def carrera = Carrera.get(id)
		def semestres = new ArrayList()
		for (int i=0; i<8; i++) {
			semestres.add((i+1))
		}
		[carrera: carrera, semestres: semestres]
		
	}
	
	def crear2() {
		
	}
	
	def actualizarSemestres() {
		System.out.println(params)
		def semestres = new ArrayList()
		def carrera
		if(!params.carrera.equals("") && !params.ciclo.equals("")) {
			
			carrera = Carrera.get(Long.parseLong(params.carrera))
			def ciclo = Ciclo.get(Long.parseLong(params.ciclo))
			for (Materia m in carrera.materias){
				for (CicloMateria cM in m.cicloMaterias) {
					if (cM.ciclos.id.equals(Long.parseLong(params.ciclo))) {
						semestres.add(m.grado)
						System.out.println(m.grado)
					}
				}
				
			}
		} else {
			carrera=null
			semestres = new ArrayList()
		}
		
		render(template: "semestres", model: [carrera: carrera, semestres:semestres])
	}
	
	def save_grupo() {
		System.out.println(params)
	}
}
