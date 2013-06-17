<%@ page import="com.ulsa.evaluacion.Alumno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script>
			function generar() {
				${remoteFunction(action: 'generarContrasena',
	                       update: 'divContrasena')}
			}

			function validar() {
				if ($('#matricula').val()=="") {
					alert('matricula');
				} else if ($('#nombre').val()=="") {
					alert('nombre');
				}  else if ($('#paterno').val()=="") {
					alert('paterno');
				}  else if ($('#materno').val()=="") {
					alert('materno');
				}  else if ($('#contrasena').val()=="") {
					alert('contrasena');
				}  else if ($('#email').val()=="") {
					alert('email');
				} else {
					$('#formulario').submit();
				}
			}
		</script>
	</head>
	<body>
		<a href="#create-alumno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-alumno" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${alumnoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${alumnoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form id="formulario" name="formulario" action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<input type="button" value="Crear" onClick="validar()"/>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
