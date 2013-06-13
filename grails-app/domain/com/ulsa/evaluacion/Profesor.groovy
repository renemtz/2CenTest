package com.ulsa.evaluacion

class Profesor {
	String clave
	String nombre
	String paterno
	String materno
	String email

	static hasMany = [clases:Clase]
	
    static constraints = {
		clave nullable:false, unique: true
		nombre nullable:false
		paterno nullable:false
		materno nullable:false
		email email:true
    }
	
	String toString() {
		"${clave}, ${nombre}, ${paterno}, ${materno}"
	}
}
