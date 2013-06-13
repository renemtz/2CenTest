package com.ulsa.evaluacion

class Materia {
	
	String clave
	String nombre
	String grado
	
	static hasMany = [ciclos:Ciclo]
	static belongsTo = [carrera:Carrera, ciclos:Ciclo]
	
    static constraints = {
		clave nullable:false
		nombre nullable:false
		grado nullable:false
    }
	
	String toString() {
		"${nombre}"
	}
}
