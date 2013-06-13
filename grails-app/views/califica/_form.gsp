<%@ page import="com.ulsa.evaluacion.Califica" %>



<div class="fieldcontain ${hasErrors(bean: calificaInstance, field: 'alumno', 'error')} required">
	<label for="alumno">
		<g:message code="califica.alumno.label" default="Alumno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="alumno" name="alumno.id" from="${com.ulsa.evaluacion.Alumno.list()}" optionKey="id" required="" value="${calificaInstance?.alumno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calificaInstance, field: 'clase', 'error')} required">
	<label for="clase">
		<g:message code="califica.clase.label" default="Clase" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="clase" name="clase.id" from="${com.ulsa.evaluacion.Clase.list()}" optionKey="id" required="" value="${calificaInstance?.clase?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calificaInstance, field: 'pregunta', 'error')} required">
	<label for="pregunta">
		<g:message code="califica.pregunta.label" default="Pregunta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pregunta" name="pregunta.id" from="${com.ulsa.evaluacion.Pregunta.list()}" optionKey="id" required="" value="${calificaInstance?.pregunta?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calificaInstance, field: 'puntuacion', 'error')} required">
	<label for="puntuacion">
		<g:message code="califica.puntuacion.label" default="Puntuacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="puntuacion" type="number" value="${calificaInstance.puntuacion}" required=""/>
</div>

