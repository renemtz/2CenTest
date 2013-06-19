package com.ulsa.evaluacion

class Clase {
	Profesor profesor
	Evaluacion evaluacion
	Materia materia
	Grupo grupo
	
	static hasMany = [calificaciones: Califica]

    static constraints = {
		profesor nullable: true
		evaluacion nullable: true
		materia nullable: true
		grupo nullable: true
    }

}
