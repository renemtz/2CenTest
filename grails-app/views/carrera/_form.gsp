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

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'responsable', 'error')} ">
	<label for="responsable">
		<g:message code="carrera.responsable.label" default="Responsable" />
		
	</label>
	<g:textField name="responsable" value="${carreraInstance?.responsable}"/>
</div>

