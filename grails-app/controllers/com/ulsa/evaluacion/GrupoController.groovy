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

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'grupo.label', default: 'Grupo'),
			grupoInstance.id
		])
		redirect(action: "show", id: grupoInstance.id)
	}

	def show(Long id) {
		def grupoInstance = Grupo.get(id)
		if (!grupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				id
			])
			redirect(action: "list")
			return
		}

		[grupoInstance: grupoInstance]
	}

	def edit(Long id) {
		def grupoInstance = Grupo.get(id)
		if (!grupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				id
			])
			redirect(action: "list")
			return
		}

		[grupoInstance: grupoInstance]
	}

	def update(Long id, Long version) {
		def grupoInstance = Grupo.get(id)
		if (!grupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (grupoInstance.version > version) {
				grupoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'grupo.label', default: 'Grupo')] as Object[],
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

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'grupo.label', default: 'Grupo'),
			grupoInstance.id
		])
		redirect(action: "show", id: grupoInstance.id)
	}

	def delete(Long id) {
		def grupoInstance = Grupo.get(id)
		if (!grupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			grupoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				id
			])
			redirect(action: "show", id: id)
		}
	}

	def crear() {
	}

	def actualizarSemestres() {
		System.out.println(params)

		def semestres = new ArrayList()
		def carrera = null
		if(!params.carrera.equals("") && !params.ciclo.equals("")) {
			carrera = Carrera.get(Long.parseLong(params.carrera))
			def ciclo = Ciclo.get(Long.parseLong(params.ciclo))
			for (Materia m in carrera.materias){
				for (CicloMateria cM in m.cicloMaterias) {
					if (cM.ciclos.id.equals(Long.parseLong(params.ciclo))) {
						boolean esta=false
						for (int i=0; i<semestres.size(); i++) {
							if (semestres.get(i).equals(m.grado)) {
								esta=true
							}
						}
						if (!esta) {
							semestres.add(m.grado)
						}
					}
				}
			}
			//Ordenamos los semestres
			ordenar(semestres)
		}

		render(template: "semestres", model: [carrera: carrera, semestres:semestres])
	}
	

	private void ordenar(ArrayList vector) {

		for(int i = 0; i < vector.size()-1; i++){
			int idx = i;
			for(int j= i +1; j < vector.size() ; j++){
				if(vector.get(j) < vector.get(idx)){
					idx = j;
				}
			}
			if (i != idx){
				int aux = vector.get(idx);
				vector.set(idx, vector.get(i))
				vector.set(i, aux)
			}
		}
	}

	def save_grupo() {
		System.out.println(params)
		System.out.println("ss "+params.keySet().toList())
		System.out.println("ss "+params.values().toList())
		//Identificamos los índices de donde se encuentran los valores
		def ciclo = Ciclo.get(Long.parseLong(params.ciclo.id))
		def carrera = Carrera.get(Long.parseLong(params.carrera.id))
		String name
		for (int i=0; i<params.keySet().toList().size; i++) {
			name = params.keySet().toList().get(i)
			if (name.contains("semGrupo")) {
				def grupo = new Grupo(nombre: params.values().toList().get(i))
				//Buscamos las clases que le corresponden al semestre
				name = name.replaceAll("semGrupo", "")
				System.out.println("name actual "+name)
				//quitar lo que sigue del guión
				boolean pasoGuion=false;
				String semestre=""
				for (int j=0; j<name.length() && !pasoGuion; j++){
					if (name.charAt(j).toString().equals("-")) {
						pasoGuion=true;
					} else {
						semestre+=name.charAt(j).toString()
					}
				}
				//debemos de buscar las materias correspondientes al semestre 'semestre'
				for (Materia m in carrera.materias) {
					for (CicloMateria cM in m.cicloMaterias) {
						if (cM.ciclos.id.equals(Long.parseLong(params.ciclo.id))) {
							if (m.grado.equals(Integer.parseInt(semestre))){
								//La materia pertenece al grupo por lo que debemos crear una clase
								def clase = new Clase();
								grupo.addToClases(clase)
								m.addToClases(clase)
								if (!m.save(validate: false)) {
									render(view: "list")
									return
								}
								
							}
						}
					}
					
				}
				ciclo.addToGrupos(grupo)
				carrera.addToGrupos(grupo)
			}
		}



		if (!carrera.save(flush: true)) {
			render(view: "list")
			return
		}

		if (!ciclo.save(flush: true)) {
			render(view: "list")
			return
		}

		redirect(action: "list")

	}
}
