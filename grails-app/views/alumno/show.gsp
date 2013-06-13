
<%@ page import="com.ulsa.evaluacion.Alumno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-alumno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-alumno" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list alumno">
			
				<g:if test="${alumnoInstance?.matricula}">
				<li class="fieldcontain">
					<span id="matricula-label" class="property-label"><g:message code="alumno.matricula.label" default="Matricula" /></span>
					
						<span class="property-value" aria-labelledby="matricula-label"><g:fieldValue bean="${alumnoInstance}" field="matricula"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="alumno.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${alumnoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.paterno}">
				<li class="fieldcontain">
					<span id="paterno-label" class="property-label"><g:message code="alumno.paterno.label" default="Paterno" /></span>
					
						<span class="property-value" aria-labelledby="paterno-label"><g:fieldValue bean="${alumnoInstance}" field="paterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.materno}">
				<li class="fieldcontain">
					<span id="materno-label" class="property-label"><g:message code="alumno.materno.label" default="Materno" /></span>
					
						<span class="property-value" aria-labelledby="materno-label"><g:fieldValue bean="${alumnoInstance}" field="materno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.contrasena}">
				<li class="fieldcontain">
					<span id="contrasena-label" class="property-label"><g:message code="alumno.contrasena.label" default="Contrasena" /></span>
					
						<span class="property-value" aria-labelledby="contrasena-label"><g:fieldValue bean="${alumnoInstance}" field="contrasena"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="alumno.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${alumnoInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.calificaciones}">
				<li class="fieldcontain">
					<span id="calificaciones-label" class="property-label"><g:message code="alumno.calificaciones.label" default="Calificaciones" /></span>
					
						<g:each in="${alumnoInstance.calificaciones}" var="c">
						<span class="property-value" aria-labelledby="calificaciones-label"><g:link controller="califica" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.grupos}">
				<li class="fieldcontain">
					<span id="grupos-label" class="property-label"><g:message code="alumno.grupos.label" default="Grupos" /></span>
					
						<g:each in="${alumnoInstance.grupos}" var="g">
						<span class="property-value" aria-labelledby="grupos-label"><g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${alumnoInstance?.id}" />
					<g:link class="edit" action="edit" id="${alumnoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
