<%@ page import="com.ulsa.evaluacion.Ciclo" %>



<div class="fieldcontain ${hasErrors(bean: cicloInstance, field: 'clave', 'error')} required">
	<label for="clave">
		<g:message code="ciclo.clave.label" default="Clave" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clave" required="" value="${cicloInstance?.clave}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cicloInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="ciclo.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${cicloInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cicloInstance, field: 'cicloMaterias', 'error')} ">
	<label for="cicloMaterias">
		<g:message code="ciclo.cicloMaterias.label" default="Ciclo Materias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cicloInstance?.cicloMaterias?}" var="c">
    <li><g:link controller="cicloMateria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cicloMateria" action="create" params="['ciclo.id': cicloInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cicloMateria.label', default: 'CicloMateria')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: cicloInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="ciclo.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${cicloInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cicloInstance, field: 'grupos', 'error')} ">
	<label for="grupos">
		<g:message code="ciclo.grupos.label" default="Grupos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cicloInstance?.grupos?}" var="g">
    <li><g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="grupo" action="create" params="['ciclo.id': cicloInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'grupo.label', default: 'Grupo')])}</g:link>
</li>
</ul>

</div>

