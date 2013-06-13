package com.ulsa.evaluacion

class CicloMateria {
	
	static belongsTo = [materias: Materia, ciclos:Ciclo]

    static constraints = {
    }
}
