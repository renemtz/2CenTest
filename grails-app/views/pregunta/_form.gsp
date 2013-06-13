<%@ page import="com.ulsa.evaluacion.Pregunta" %>



<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="pregunta.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${preguntaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'calificaciones', 'error')} ">
	<label for="calificaciones">
		<g:message code="pregunta.calificaciones.label" default="Calificaciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${preguntaInstance?.calificaciones?}" var="c">
    <li><g:link controller="califica" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="califica" action="create" params="['pregunta.id': preguntaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'califica.label', default: 'Califica')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'evaluacion', 'error')} required">
	<label for="evaluacion">
		<g:message code="pregunta.evaluacion.label" default="Evaluacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="evaluacion" name="evaluacion.id" from="${com.ulsa.evaluacion.Evaluacion.list()}" optionKey="id" required="" value="${preguntaInstance?.evaluacion?.id}" class="many-to-one"/>
</div>

