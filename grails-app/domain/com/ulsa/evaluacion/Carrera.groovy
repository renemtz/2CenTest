package com.ulsa.evaluacion

class Carrera {
	String clave
	String nombre
	String responsable
	int numSemestres

    static constraints = {
		clave nullable:false, blank: false
		nombre nullable:false 
    }
	
	String toString() {
		"${clave} ${nombre}"
	}
}
