<%@ page import="com.ulsa.evaluacion.Alumno"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="alumno">
<g:set var="entityName"
	value="${message(code: 'alumno.label', default: 'Alumno')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
			function generar() {
				${remoteFunction(action: 'generarContrasena',
	                       update: 'divContrasena')}
			}

			function validar() {
				if ($('#contrasena').val()=="") {
					alert('Debes llenar todos los campos');
				} else if ($('#nuevaContrasena').val()=="") {
					alert('Debes llenar todos los campos');
				} else if ($('#nuevaContrasena').val().length<5) {
					alert('La contraseña debe ser igual o mayor a 5 caracteres');
				} else if ($('#nuevaContrasena').val().length>15) {
					alert('La contraseña debe ser menor a 15 caracteres');
				} else if ($('#repetir').val()=="") {
					alert('Debes llenar todos los campos');
				} else if ($('#repetir').val()!=$('#nuevaContrasena').val()) {
					alert('Las contraseñas son diferentes');
				} else {
					$('#formulario').submit();
				}
			}
		</script>
</head>
<body>
	<a href="#create-alumno" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/alumno/inicio')}"><g:message
							code="default.home.label" /></a></li>
				<li><a href="${createLink(uri: '/alumno/login')}">Cerrar Sesión</a></li>
				
			</ul>
		</div>
	<div id="create-alumno" class="content scaffold-create" role="main">
		<h1>
			<g:message code="Cambiar contraseña" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${alumnoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${alumnoInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form id="formulario" name="formulario" action="save_nueva_contrasena">
			<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'contrasena', 'error')} ">
					<label for="contrasena"> <g:message
							code="Contraseña actual" /> <span
						class="required-indicator">*</span>
					</label>
					
					<g:passwordField name="contrasena" maxlength="15" value="${contrasena}"
						required="" />
				</div>
				
				<div
					class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'contrasena', 'error')} ">
					<label for="nuevaContrasena"> <g:message
							code="Nueva contraseña" /> <span
						class="required-indicator">*</span>
					</label>
					<g:passwordField name="nuevaContrasena" maxlength="15" value="${contrasena}"
						required="" />
				</div>
				
				<div
					class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'contrasena', 'error')} ">
					<label for="repetir"> <g:message
							code="Repetir contraseña" /> <span
						class="required-indicator">*</span>
					</label>
					<g:passwordField name="repetir" maxlength="15" value="${contrasena}"
						required="" />
				</div>
			</fieldset>
			<fieldset class="buttons">
				<input type="button" value="Aceptar" onClick="validar()" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
