package com.ulsa.evaluacion

class Materia {
	
	String clave
	String nombre
	int grado
	
	static belongsTo = [carrera:Carrera]
	static hasMany = [cicloMaterias: CicloMateria]
	
	
	static constraints = {
		clave nullable:false
		nombre nullable:false
		grado nullable:false
	}
	
	String toString() {
		"${nombre}"
	}
}
