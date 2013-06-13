package com.ulsa.evaluacion

class Evaluacion {
	String clave
	String nombre
	String descripcion

    static constraints = {
		clave nullable:false, unique:true
		nombre nullable:false
		descripcion nullable:false
    }
	
	String toString() {
		"${clave}, ${nombre}"
	}
}
