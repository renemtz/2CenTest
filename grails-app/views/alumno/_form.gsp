<%@ page import="com.ulsa.evaluacion.Alumno" %>



<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'matricula', 'error')} ">
	<label for="matricula">
		<g:message code="alumno.matricula.label" default="Matricula" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="matricula" value="${alumnoInstance?.matricula}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="alumno.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" value="${alumnoInstance?.nombre}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'paterno', 'error')} ">
	<label for="paterno">
		<g:message code="alumno.paterno.label" default="Paterno"/>
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="paterno" value="${alumnoInstance?.paterno}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'materno', 'error')} ">
	<label for="materno">
		<g:message code="alumno.materno.label" default="Materno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="materno" value="${alumnoInstance?.materno}" required="" />
</div>


<g:render template="contrasena"/>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="alumno.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" value="${alumnoInstance?.email}" required=""/>
</div>