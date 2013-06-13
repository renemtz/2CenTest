package com.ulsa.evaluacion

class Califica {
	
	int puntuacion
	static belongsTo = [alumno:Alumno, pregunta:Pregunta, clase:Clase]
	

    static constraints = {
    }
}
