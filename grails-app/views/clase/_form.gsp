<%@ page import="com.ulsa.evaluacion.Clase" %>



<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'calificaciones', 'error')} ">
	<label for="calificaciones">
		<g:message code="clase.calificaciones.label" default="Calificaciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${claseInstance?.calificaciones?}" var="c">
    <li><g:link controller="califica" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="califica" action="create" params="['clase.id': claseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'califica.label', default: 'Califica')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'evaluacion', 'error')} required">
	<label for="evaluacion">
		<g:message code="clase.evaluacion.label" default="Evaluacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="evaluacion" name="evaluacion.id" from="${com.ulsa.evaluacion.Evaluacion.list()}" optionKey="id" required="" value="${claseInstance?.evaluacion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'grupo', 'error')} required">
	<label for="grupo">
		<g:message code="clase.grupo.label" default="Grupo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="grupo" name="grupo.id" from="${com.ulsa.evaluacion.Grupo.list()}" optionKey="id" required="" value="${claseInstance?.grupo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'materia', 'error')} required">
	<label for="materia">
		<g:message code="clase.materia.label" default="Materia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materia" name="materia.id" from="${com.ulsa.evaluacion.Materia.list()}" optionKey="id" required="" value="${claseInstance?.materia?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'profe', 'error')} required">
	<label for="profe">
		<g:message code="clase.profe.label" default="Profe" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profe" name="profe.id" from="${com.ulsa.evaluacion.Profesor.list()}" optionKey="id" required="" value="${claseInstance?.profe?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'profesor', 'error')} required">
	<label for="profesor">
		<g:message code="clase.profesor.label" default="Profesor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profesor" name="profesor.id" from="${com.ulsa.evaluacion.Profesor.list()}" optionKey="id" required="" value="${claseInstance?.profesor?.id}" class="many-to-one"/>
</div>

