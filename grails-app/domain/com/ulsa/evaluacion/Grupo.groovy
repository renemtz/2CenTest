package com.ulsa.evaluacion

class Grupo {
	String nombre
	
	static hasMany = [alumnos: Alumno, clases: Clase]
	static belongsTo = [carrera: Carrera, ciclo: Ciclo]
	
    static constraints = {
		nombre nullable:false
    }
}
