<%@ page import="com.ulsa.evaluacion.Alumno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	</head>
	<body>
		
		<div id="create-alumno" class="content scaffold-create" role="main">
			<g:form id="formulario" name="formulario" action="save" >
				<fieldset class="form">
					
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
