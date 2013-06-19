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

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'cicloMateria.label', default: 'CicloMateria'),
			cicloMateriaInstance.id
		])
		redirect(action: "show", id: cicloMateriaInstance.id)
	}

	def show(Long id) {
		def cicloMateriaInstance = CicloMateria.get(id)
		if (!cicloMateriaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'cicloMateria.label', default: 'CicloMateria'),
				id
			])
			redirect(action: "list")
			return
		}

		[cicloMateriaInstance: cicloMateriaInstance]
	}

	def edit(Long id) {
		def cicloMateriaInstance = CicloMateria.get(id)
		if (!cicloMateriaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'cicloMateria.label', default: 'CicloMateria'),
				id
			])
			redirect(action: "list")
			return
		}

		[cicloMateriaInstance: cicloMateriaInstance]
	}

	def update(Long id, Long version) {
		def cicloMateriaInstance = CicloMateria.get(id)
		if (!cicloMateriaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'cicloMateria.label', default: 'CicloMateria'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (cicloMateriaInstance.version > version) {
				cicloMateriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'cicloMateria.label', default: 'CicloMateria')] as Object[],
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

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'cicloMateria.label', default: 'CicloMateria'),
			cicloMateriaInstance.id
		])
		redirect(action: "show", id: cicloMateriaInstance.id)
	}

	def delete(Long id) {
		def cicloMateriaInstance = CicloMateria.get(id)
		if (!cicloMateriaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'cicloMateria.label', default: 'CicloMateria'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			cicloMateriaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'cicloMateria.label', default: 'CicloMateria'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'cicloMateria.label', default: 'CicloMateria'),
				id
			])
			redirect(action: "show", id: id)
		}
	}

	def crear(){
	}

	def actualizarMaterias(){
		System.out.println(params) //ciclo carrera
		def ciclomaterias
		def estan = new ArrayList()
		def noestan = new ArrayList()

		if(!params.ciclo.equals("")) {
			def materias = Materia.findAllByCarrera(Carrera.findById(Long.parseLong(params.carrera)))
			boolean esta
			for (Materia m in materias) {
				esta = false
				for (CicloMateria cm in m.cicloMaterias){
					if(cm.ciclos.id.equals(Long.parseLong(params.ciclo))){
						esta = true
					}
				}
				if(esta) {
					estan.add(m)
				} else {
					noestan.add(m)
				}
			}
		}


		render(template: "msMaterias", model: [ciclomaterias: noestan, materiasas: estan])
	}

	def asignarCicloMateria() {

		def ciclomaterias
		def estan = new ArrayList()

		boolean esta
		if(!params.ciclo.equals("")) {
			def materias = Materia.findAllByCarrera(Carrera.findById(Long.parseLong(params.carrera.id)))
			for (Materia m in materias) {
				esta = false
				for (CicloMateria cm in m.cicloMaterias){
					if(cm.ciclos.id.equals(Long.parseLong(params.ciclos.id))){
						esta = true
					}
				}
				if(esta) {
					estan.add(m)
				}
			}
		}


		def materias = params.list('FeatureCodes[]')
		def cicloMateria
		def ciclo = Ciclo.findById(Long.parseLong(params.ciclos.id))
		def materia

		//Buscamos si alguna de las materias ya no está en las que estaban anteriormente
		
		for (Materia matObj in estan) {
			esta=false
			for (String m in materias) {
				if (matObj.id.toString().equals(m)){
					esta=true
				}
			}
			if(!esta) {
				//buscamos el cicloMateria para eliminarlo
				def cicloMateriaDelete = CicloMateria.findByMateriasAndCiclos(matObj, ciclo)
				matObj.removeFromCicloMaterias(cicloMateriaDelete)
				ciclo.removeFromCicloMaterias(cicloMateriaDelete)
				matObj.save()
				ciclo.save()
				cicloMateriaDelete.delete()
			}
		}
		for (String m in materias){



			materia = Materia.findById(Long.parseLong(m))
			cicloMateria = CicloMateria.findByMateriasAndCiclos(materia, ciclo)
			if (!cicloMateria) {
				cicloMateria = new CicloMateria(ciclos: ciclo, materias: materia)
				if(cicloMateria.save()) {
					System.out.println("se guardo")
				} else {
					System.out.println("error")
				}
			}
		}
		redirect(controller: 'cicloMateria', action: "crear")
	}
	
}
