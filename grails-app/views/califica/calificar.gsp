<%@ page import="com.ulsa.evaluacion.Califica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'califica.label', default: 'Califica')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:if test="${clase}">
			Profesor: ${clase?.profesor?.nombre} ${clase?.profesor?.paterno} ${clase?.profesor?.materno}
			<br>
			Asignatura: ${clase?.materia}
			<br>
			<br>
			<table>
				<g:each var="pregunta" in="${clase?.evaluacion?.preguntas}">
					${pregunta?.descripcion} 
					<g:radioGroup name="myGroup" values="['P',2,3,4,5]" value="1" >
						<g:message code="${it.value}" />: ${it.radio}
					</g:radioGroup>
					<br>
				</g:each>
			</table>
			
		</g:if>
		<g:else>
			No hay preguntas
		</g:else>
	
	
	</body>
</html>