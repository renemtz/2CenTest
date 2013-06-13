<%@ page import="com.ulsa.evaluacion.Evaluacion" %>



<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'clave', 'error')} ">
	<label for="clave">
		<g:message code="evaluacion.clave.label" default="Clave" />
		
	</label>
	<g:textField name="clave" value="${evaluacionInstance?.clave}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="evaluacion.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${evaluacionInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="evaluacion.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${evaluacionInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'clases', 'error')} ">
	<label for="clases">
		<g:message code="evaluacion.clases.label" default="Clases" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${evaluacionInstance?.clases?}" var="c">
    <li><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="clase" action="create" params="['evaluacion.id': evaluacionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clase.label', default: 'Clase')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'preguntas', 'error')} ">
	<label for="preguntas">
		<g:message code="evaluacion.preguntas.label" default="Preguntas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${evaluacionInstance?.preguntas?}" var="p">
    <li><g:link controller="pregunta" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pregunta" action="create" params="['evaluacion.id': evaluacionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pregunta.label', default: 'Pregunta')])}</g:link>
</li>
</ul>

</div>

