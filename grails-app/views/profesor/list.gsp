
<%@ page import="com.ulsa.evaluacion.Profesor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesor.label', default: 'Profesor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-profesor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-profesor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="clave" title="${message(code: 'profesor.clave.label', default: 'Clave')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'profesor.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="paterno" title="${message(code: 'profesor.paterno.label', default: 'Paterno')}" />
					
						<g:sortableColumn property="materno" title="${message(code: 'profesor.materno.label', default: 'Materno')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'profesor.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${profesorInstanceList}" status="i" var="profesorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${profesorInstance.id}">${fieldValue(bean: profesorInstance, field: "clave")}</g:link></td>
					
						<td>${fieldValue(bean: profesorInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "paterno")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "materno")}</td>
					
						<td>${fieldValue(bean: profesorInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${profesorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
