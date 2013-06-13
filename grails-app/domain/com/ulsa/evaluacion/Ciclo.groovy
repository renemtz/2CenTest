package com.ulsa.evaluacion

class Ciclo {
	String clave
	String nombre
	String descripcion

    static constraints = {
		clave nullable:false, blank: false
		nombre nullable:false
    }
	
	String toString() {
		"${clave}"
	}
}
