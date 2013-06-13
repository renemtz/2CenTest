<%@ page import="com.ulsa.evaluacion.Alumno" %>



<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'matricula', 'error')} ">
	<label for="matricula">
		<g:message code="alumno.matricula.label" default="Matricula" />
		
	</label>
	<g:textField name="matricula" value="${alumnoInstance?.matricula}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="alumno.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${alumnoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'paterno', 'error')} ">
	<label for="paterno">
		<g:message code="alumno.paterno.label" default="Paterno" />
		
	</label>
	<g:textField name="paterno" value="${alumnoInstance?.paterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'materno', 'error')} ">
	<label for="materno">
		<g:message code="alumno.materno.label" default="Materno" />
		
	</label>
	<g:textField name="materno" value="${alumnoInstance?.materno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'contrasena', 'error')} ">
	<label for="contrasena">
		<g:message code="alumno.contrasena.label" default="Contrasena" />
		
	</label>
	<g:textField name="contrasena" maxlength="15" value="${alumnoInstance?.contrasena}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="alumno.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${alumnoInstance?.email}"/>
</div>

