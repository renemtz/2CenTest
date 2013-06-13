
<%@ page import="com.ulsa.evaluacion.Califica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'califica.label', default: 'Califica')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-califica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-califica" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="califica.alumno.label" default="Alumno" /></th>
					
						<th><g:message code="califica.clase.label" default="Clase" /></th>
					
						<th><g:message code="califica.pregunta.label" default="Pregunta" /></th>
					
						<g:sortableColumn property="puntuacion" title="${message(code: 'califica.puntuacion.label', default: 'Puntuacion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${calificaInstanceList}" status="i" var="calificaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${calificaInstance.id}">${fieldValue(bean: calificaInstance, field: "alumno")}</g:link></td>
					
						<td>${fieldValue(bean: calificaInstance, field: "clase")}</td>
					
						<td>${fieldValue(bean: calificaInstance, field: "pregunta")}</td>
					
						<td>${fieldValue(bean: calificaInstance, field: "puntuacion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${calificaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
