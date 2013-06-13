package com.ulsa.evaluacion

class Ciclo {
	String clave
	String nombre
	String descripcion
	
	static hasMany = [grupos: Grupo, materias: Materia]

    static constraints = {
		clave nullable:false, blank: false
		nombre nullable:false
    }
	
	String toString() {
		"${clave}"
	}
}
