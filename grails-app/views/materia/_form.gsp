<%@ page import="com.ulsa.evaluacion.Materia" %>



<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'clave', 'error')} ">
	<label for="clave">
		<g:message code="materia.clave.label" default="Clave" />
		
	</label>
	<g:textField name="clave" value="${materiaInstance?.clave}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="materia.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${materiaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'grado', 'error')} ">
	<label for="grado">
		<g:message code="materia.grado.label" default="Grado" />
		
	</label>
	<g:textField name="grado" value="${materiaInstance?.grado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'carrera', 'error')} required">
	<label for="carrera">
		<g:message code="materia.carrera.label" default="Carrera" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="carrera" name="carrera.id" from="${com.ulsa.evaluacion.Carrera.list()}" optionKey="id" required="" value="${materiaInstance?.carrera?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'cicloMaterias', 'error')} ">
	<label for="cicloMaterias">
		<g:message code="materia.cicloMaterias.label" default="Ciclo Materias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${materiaInstance?.cicloMaterias?}" var="c">
    <li><g:link controller="cicloMateria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cicloMateria" action="create" params="['materia.id': materiaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cicloMateria.label', default: 'CicloMateria')])}</g:link>
</li>
</ul>

</div>

