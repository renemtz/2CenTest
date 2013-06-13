
<%@ page import="com.ulsa.evaluacion.Materia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materia.label', default: 'Materia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-materia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-materia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="clave" title="${message(code: 'materia.clave.label', default: 'Clave')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'materia.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="grado" title="${message(code: 'materia.grado.label', default: 'Grado')}" />
					
						<th><g:message code="materia.carrera.label" default="Carrera" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${materiaInstanceList}" status="i" var="materiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${materiaInstance.id}">${fieldValue(bean: materiaInstance, field: "clave")}</g:link></td>
					
						<td>${fieldValue(bean: materiaInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: materiaInstance, field: "grado")}</td>
					
						<td>${fieldValue(bean: materiaInstance, field: "carrera")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${materiaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
