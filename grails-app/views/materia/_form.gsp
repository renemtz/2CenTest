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

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'grado', 'error')} required">
	<label for="grado">
		<g:message code="materia.grado.label" default="Grado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="grado" type="number" value="${materiaInstance.grado}" min="1" max="10" value="1" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'carrera', 'error')} required">
	<label for="carrera">
		<g:message code="materia.carrera.label" default="Carrera" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="carrera" name="carrera.id" from="${com.ulsa.evaluacion.Carrera.list()}" optionKey="id" required="" value="${materiaInstance?.carrera?.id}" class="many-to-one"/>
</div>


<g:if test="${materiaInstance?.clases?.size()>0}">
<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'clases', 'error')} ">
	<label for="clases">
		<g:message code="materia.clases.label" default="Clases" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${materiaInstance?.clases?}" var="c">
    <li><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="clase" action="create" params="['materia.id': materiaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'clase.label', default: 'Clase')])}</g:link>
</li>
</ul>

</div>
</g:if>

