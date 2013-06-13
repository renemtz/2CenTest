package com.ulsa.evaluacion

class Materia {
	
	String clave
	String nombre
	String grado
	
	static belongsTo = [carrera:Carrera]
	
	
    static constraints = {
		clave nullable:false
		nombre nullable:false
		grado nullable:false
    }
	
	String toString() {
		"${nombre}"
	}
}
