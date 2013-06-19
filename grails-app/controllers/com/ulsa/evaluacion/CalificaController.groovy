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
	
	def calificar(Long id) {
		def clase = Clase.get(id)
		boolean esta=false
		def alumno = session.alumno
		//verificamos si la clase le corresponde al alumno
		if (clase) {
			def grupo = clase.grupo
			
			
			for (Alumno a in grupo.alumnos) {
				if (alumno.id == a.id) {
					esta=true
				}
			}
		}
		
		if (esta) {
			//verificamos si ya contestó la evaluación
			def califica = Califica.findByClaseAndAlumno(clase, alumno)
			if (califica) {
				//Ya la ha contestado
				redirect(controller: "alumno", action: "inicio")
			} else {
				//No la ha contestado
				[clase: clase]
			}
			
		} else {
			redirect(controller: "alumno", action: "inicio")
		}
		
		
		
		
		
	}
	
	def save_calificaciones() {
		System.out.println("key "+params.keySet().toList())
		System.out.println("values "+params.values().toList())
		//Identificamos los índices de donde se encuentran los valores
		String name
		for (int i=0; i<params.keySet().toList().size; i++) {
			name = params.keySet().toList().get(i)
			if (name.contains("p")) {
				name = name.replaceAll("p", "")
				def califica = new Califica(puntuacion: Integer.parseInt(params.values().toList().get(i)), pregunta:Pregunta.findById(Long.parseLong(name)), clase: Clase.findById(Long.parseLong(params.idClase)), alumno: session.alumno)
				if (califica.save()) {
					System.out.println("Correcto")
					
				} else {
					System.out.println("Error")
				}
			}
		}
		flash.message = message(code: 'La evaluación se ha realizado correctamente')
		redirect(controller: "alumno", action: "inicio")
	}
	
	def reporte() {

		
		
		 //Buscamos el porcentaje de evaluaciones terminadas
		def ultimoCiclo = Ciclo.last()
		def cicloMateria = CicloMateria.findAllByCiclos(ultimoCiclo)
		def clases = new ArrayList()
		def evaluaciones = new ArrayList()
		if (cicloMateria) {
			for (CicloMateria cm in cicloMateria) {
				clases.addAll(cm.materias.clases)
			}
		}
		//preguntas contestadas
		int numCalificaciones=0
		for (Clase c in clases) {
			numCalificaciones+=c.calificaciones.size()
			evaluaciones.add(c.evaluacion)
		}
		
		
		//preguntas que se deben contestar
		int numPreguntas = 0
		for (Evaluacion e in evaluaciones) {
			numPreguntas += e.preguntas.size()
		}
		int porcentajeContestado=0
		int porcentajeSinContestar=0
		if (numPreguntas!=0) {
			porcentajeContestado = (numCalificaciones*100)/numPreguntas
			porcentajeSinContestar = 100-porcentajeContestado
		}
		
		System.out.println("Contestadas: "+numCalificaciones +"; sin contestar "+numPreguntas)
		
		
		[contestado: porcentajeContestado, sincontestar: porcentajeSinContestar] 
	}
	
}
