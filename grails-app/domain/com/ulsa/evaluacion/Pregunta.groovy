package com.ulsa.evaluacion

class Pregunta {
	
	String descripcion
	
	static belongsTo = [evaluacion:Evaluacion]
	static hasMany = [calificaciones:Califica]
		
    static constraints = {
		descripcion nullable:false
    }
	
	String toString() {
		"${descripcion}"
	}
}
