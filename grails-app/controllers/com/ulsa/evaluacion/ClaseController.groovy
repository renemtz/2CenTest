package com.ulsa.evaluacion

import org.springframework.dao.DataIntegrityViolationException

class ClaseController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[claseInstanceList: Clase.list(params), claseInstanceTotal: Clase.count()]
	}

	def create() {
		[claseInstance: new Clase(params)]
	}

	def save() {
		def claseInstance = new Clase(params)
		if (!claseInstance.save(flush: true)) {
			render(view: "create", model: [claseInstance: claseInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'clase.label', default: 'Clase'),
			claseInstance.id
		])
		redirect(action: "show", id: claseInstance.id)
	}

	def show(Long id) {
		def claseInstance = Clase.get(id)
		if (!claseInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'clase.label', default: 'Clase'),
				id
			])
			redirect(action: "list")
			return
		}

		[claseInstance: claseInstance]
	}

	def edit(Long id) {
		def claseInstance = Clase.get(id)
		if (!claseInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'clase.label', default: 'Clase'),
				id
			])
			redirect(action: "list")
			return
		}

		[claseInstance: claseInstance]
	}

	def update(Long id, Long version) {
		def claseInstance = Clase.get(id)
		if (!claseInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'clase.label', default: 'Clase'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (claseInstance.version > version) {
				claseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'clase.label', default: 'Clase')] as Object[],
						"Another user has updated this Clase while you were editing")
				render(view: "edit", model: [claseInstance: claseInstance])
				return
			}
		}

		claseInstance.properties = params

		if (!claseInstance.save(flush: true)) {
			render(view: "edit", model: [claseInstance: claseInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'clase.label', default: 'Clase'),
			claseInstance.id
		])
		redirect(action: "show", id: claseInstance.id)
	}

	def delete(Long id) {
		def claseInstance = Clase.get(id)
		if (!claseInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'clase.label', default: 'Clase'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			claseInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'clase.label', default: 'Clase'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'clase.label', default: 'Clase'),
				id
			])
			redirect(action: "show", id: id)
		}
	}

	def asignarProfesor() {
		System.out.println(params)
	}

	def actualizarGrupos() {
		System.out.println(params)
		def grupos

		if(!params.carrera.equals("") && !params.ciclo.equals("")) {
			def criterio = Grupo.createCriteria()
			if (criterio) {
				grupos = criterio.listDistinct {
					carrera {
						eq 'id', Long.parseLong(params.carrera)
					}
					and {
						ciclo {
							eq 'id', Long.parseLong(params.ciclo)
						}
					}
				}
			}
		}
		System.out.println("entra "+(grupos!=null?grupos.size():"0"))

		render(template: "comboGrupo", model: [grupos: grupos])
	}


	def actualizarMostrarClases() {
		System.out.println(params)
		def clases

		if(!params.grupo.equals("") && !params.carrera.equals("") && !params.ciclo.equals("")) {
			def criterio = Clase.createCriteria()
			if (criterio) {
				clases = criterio.listDistinct {
					grupo {
						eq 'id', Long.parseLong(params.grupo)
					}
					materia { order("nombre", "desc") }
				}
			}
		}
		System.out.println("entra "+(clases!=null?clases.size():"0"))

		render(template: "mostrarClases", model: [clases: clases])
	}

	def save_asignacion_profesor() {
		System.out.println(params)
		String name
		def profesor
		def clase
		for (int i=0; i<params.keySet().toList().size; i++) {
			name = params.keySet().toList().get(i)
			if (name.contains("profesor.id")) {
				clase = Clase.findById(Long.parseLong(name.replaceAll("profesor.id", "")))
				profesor = Profesor.findById(Long.parseLong(params.values().toList().get(i)))
				profesor.addToClases(clase)
				if (!profesor.save(flush: true)) {
					render(view: "list")
					return
				}
			}
		}
		redirect(action: "list")
	}
}
