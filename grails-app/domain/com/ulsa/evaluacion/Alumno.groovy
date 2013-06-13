package com.ulsa.evaluacion

class Alumno {
	String matricula
	String nombre
	String paterno
	String materno
	String contrasena
	String email
	
	static hasMany = [grupos: Grupo, calificaciones:Califica]
	static belongsTo = [Grupo]
	
    static constraints = {
		matricula nullable:false, unique: true
		nombre nullable:false
		paterno nullable:false
		materno nullable:false
		contrasena nullable:false, size: 5..15
		email email:true
    }
	
	String toString() {
		"${matricula}"
	}
}
