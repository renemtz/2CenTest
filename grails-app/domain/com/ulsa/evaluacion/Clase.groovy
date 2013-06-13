package com.ulsa.evaluacion

class Clase {
	
	static belongsTo = [profesor: Profesor, evaluacion:Evaluacion, materia: Materia]
	static hasMany = [calificaciones: Califica]

    static constraints = {
    }
}
