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


<div class="fieldcontain ${hasErrors(bean: cicloInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="ciclo.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${cicloInstance?.descripcion}"/>
</div>



