<%@ page import="com.ulsa.evaluacion.Prueba" %>



<div class="fieldcontain ${hasErrors(bean: pruebaInstance, field: 'ciclos', 'error')} ">
	<label for="ciclos">
		<g:message code="prueba.ciclos.label" default="Ciclos" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: pruebaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="prueba.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${pruebaInstance?.nombre}"/>
</div>

