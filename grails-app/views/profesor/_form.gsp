<%@ page import="com.ulsa.evaluacion.Profesor" %>



<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'clave', 'error')} ">
	<label for="clave">
		<g:message code="profesor.clave.label" default="Clave" />
		
	</label>
	<g:textField name="clave" value="${profesorInstance?.clave}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="profesor.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${profesorInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'paterno', 'error')} ">
	<label for="paterno">
		<g:message code="profesor.paterno.label" default="Paterno" />
		
	</label>
	<g:textField name="paterno" value="${profesorInstance?.paterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'materno', 'error')} ">
	<label for="materno">
		<g:message code="profesor.materno.label" default="Materno" />
		
	</label>
	<g:textField name="materno" value="${profesorInstance?.materno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="profesor.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${profesorInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'clases', 'error')} ">
	<label for="clases">
		<g:message code="profesor.clases.label" default="Clases" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${profesorInstance?.clases?}" var="c">
    <li><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="clase" action="create" params="['profesor.id': profesorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clase.label', default: 'Clase')])}</g:link>
</li>
</ul>

</div>

