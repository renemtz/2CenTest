<%@ page import="com.ulsa.evaluacion.Carrera" %>



<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'clave', 'error')} required">
	<label for="clave">
		<g:message code="carrera.clave.label" default="Clave" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clave" required="" value="${carreraInstance?.clave}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="carrera.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${carreraInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'grupos', 'error')} ">
	<label for="grupos">
		<g:message code="carrera.grupos.label" default="Grupos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${carreraInstance?.grupos?}" var="g">
    <li><g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="grupo" action="create" params="['carrera.id': carreraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'grupo.label', default: 'Grupo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'materias', 'error')} ">
	<label for="materias">
		<g:message code="carrera.materias.label" default="Materias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${carreraInstance?.materias?}" var="m">
    <li><g:link controller="materia" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="materia" action="create" params="['carrera.id': carreraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'materia.label', default: 'Materia')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'responsable', 'error')} ">
	<label for="responsable">
		<g:message code="carrera.responsable.label" default="Responsable" />
		
	</label>
	<g:textField name="responsable" value="${carreraInstance?.responsable}"/>
</div>

