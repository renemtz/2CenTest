<%@ page import="com.ulsa.evaluacion.Grupo" %>



<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="grupo.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${grupoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'alumnos', 'error')} ">
	<label for="alumnos">
		<g:message code="grupo.alumnos.label" default="Alumnos" />
		
	</label>
	<g:select name="alumnos" from="${com.ulsa.evaluacion.Alumno.list()}" multiple="multiple" optionKey="id" size="5" value="${grupoInstance?.alumnos*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'carrera', 'error')} required">
	<label for="carrera">
		<g:message code="grupo.carrera.label" default="Carrera" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="carrera" name="carrera.id" from="${com.ulsa.evaluacion.Carrera.list()}" optionKey="id" required="" value="${grupoInstance?.carrera?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'ciclo', 'error')} required">
	<label for="ciclo">
		<g:message code="grupo.ciclo.label" default="Ciclo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ciclo" name="ciclo.id" from="${com.ulsa.evaluacion.Ciclo.list()}" optionKey="id" required="" value="${grupoInstance?.ciclo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'clases', 'error')} ">
	<label for="clases">
		<g:message code="grupo.clases.label" default="Clases" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${grupoInstance?.clases?}" var="c">
    <li><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="clase" action="create" params="['grupo.id': grupoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clase.label', default: 'Clase')])}</g:link>
</li>
</ul>

</div>

