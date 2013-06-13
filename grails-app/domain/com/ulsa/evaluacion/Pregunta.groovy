package com.ulsa.evaluacion

class Pregunta {
	
	String descripcion
		
    static constraints = {
		descripcion nullable:false
    }
	
	String toString() {
		"${descripcion}"
	}
}
