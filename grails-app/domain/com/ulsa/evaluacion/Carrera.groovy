package com.ulsa.evaluacion

class Carrera {
	String clave
	String nombre
	String responsable

	static hasMany = [materias: Materia, grupos: Grupo]
	
    static constraints = {
		clave nullable:false, blank: false
		nombre nullable:false 
    }
	
	String toString() {
		"${clave} ${nombre}"
	}
}
