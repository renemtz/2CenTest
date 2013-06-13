package com.ulsa.evaluacion

class Materia {
	
	String clave
	String nombre
	String grado
	
<<<<<<< HEAD
	static belongsTo = [carrera:Carrera, ciclos:Ciclo]
	static hasMany = [ciclos:Ciclo]
=======
	static belongsTo = [carrera:Carrera]
>>>>>>> 0275a8268f894311f3cb78e643c3eb2458f5253d
	
	
    static constraints = {
		clave nullable:false
		nombre nullable:false
		grado nullable:false
    }
	
	String toString() {
		"${nombre}"
	}
}
