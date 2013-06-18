package com.ulsa.evaluacion

import org.springframework.dao.DataIntegrityViolationException

class AlumnoController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[alumnoInstanceList: Alumno.list(params), alumnoInstanceTotal: Alumno.count()]
	}

	def create() {
		[alumnoInstance: new Alumno(params)]
	}

	def save() {
		def alumnoInstance = new Alumno(params)
		if (!alumnoInstance.save(flush: true)) {
			render(view: "create", model: [alumnoInstance: alumnoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'alumno.label', default: 'Alumno'),
			alumnoInstance.id
		])
		redirect(action: "show", id: alumnoInstance.id)
	}

	def show(Long id) {
		def alumnoInstance = Alumno.get(id)
		if (!alumnoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "list")
			return
		}

		[alumnoInstance: alumnoInstance]
	}

	def edit(Long id) {
		def alumnoInstance = Alumno.get(id)
		if (!alumnoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "list")
			return
		}

		[alumnoInstance: alumnoInstance]
	}

	def update(Long id, Long version) {
		def alumnoInstance = Alumno.get(id)
		if (!alumnoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (alumnoInstance.version > version) {
				alumnoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'alumno.label', default: 'Alumno')] as Object[],
						"Another user has updated this Alumno while you were editing")
				render(view: "edit", model: [alumnoInstance: alumnoInstance])
				return
			}
		}

		alumnoInstance.properties = params

		if (!alumnoInstance.save(flush: true)) {
			render(view: "edit", model: [alumnoInstance: alumnoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'alumno.label', default: 'Alumno'),
			alumnoInstance.id
		])
		redirect(action: "show", id: alumnoInstance.id)
	}

	def delete(Long id) {
		def alumnoInstance = Alumno.get(id)
		if (!alumnoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			alumnoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "show", id: id)
		}
	}

	def login() {
	}

	def generarContrasena() {
		String key="23456789ABCDEFGHJKMNPQRSTUVWXYZÑ";
		int length=10;
		String pswd = "";
		for (int i = 0; i < length; i++) {
			pswd+=(key.charAt((int)(Math.random() * key.length())));
		}

		render (template: 'contrasena', model: [contrasena: pswd])
	}
	
	def cambiarContrasena() {
		
	}
	
	def verificarUsuario() {
		def alumno
		if (params.login.equals("admin") && params.password.equals("admin")) { //Si el usuario es administrador
			redirect(action: "show", id: id)
		} else { //puede que el usuario sea un alumno
			alumno = Alumno.findByMatriculaAndContrasena(params.login, params.password)
		}
		if (alumno) {
			session.alumno = alumno
			redirect(action: "inicio", alumno: alumno)
		} else {
		
			session.error="Usuario y/o contraseña incorrectos"
			redirect(action: "login", alumno: null)
		}
	}
	
	def inicio() {
		if (session.alumno!=null){
			//Buscamos las clases a las que el alumno está asignado
			def alumno = session.alumno
			
			System.out.println("El id del alumno es "+alumno.id+alumno.nombre)
			
			
			alumno = Alumno.findById(alumno.id)
			def clases= new ArrayList()
			for (Grupo g in alumno.grupos) {
				def clasesDelGrupo = Clase.findAllByGrupo(g)
				for (Clase c in clasesDelGrupo) {
					
					clases.add(c)
				}
				
			}
			
			//Evaluacion pertenece al alumno y a la clase
			System.out.println("Número de clases "+clases.size)
			[clases: clases]
			
		} else {
			session.error="Debes iniciar sesión"
			redirect(action: "login", alumno: null)
		}
	}
}
