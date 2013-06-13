
<%@ page import="com.ulsa.evaluacion.Califica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'califica.label', default: 'Califica')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-califica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-califica" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list califica">
			
				<g:if test="${calificaInstance?.alumno}">
				<li class="fieldcontain">
					<span id="alumno-label" class="property-label"><g:message code="califica.alumno.label" default="Alumno" /></span>
					
						<span class="property-value" aria-labelledby="alumno-label"><g:link controller="alumno" action="show" id="${calificaInstance?.alumno?.id}">${calificaInstance?.alumno?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${calificaInstance?.clase}">
				<li class="fieldcontain">
					<span id="clase-label" class="property-label"><g:message code="califica.clase.label" default="Clase" /></span>
					
						<span class="property-value" aria-labelledby="clase-label"><g:link controller="clase" action="show" id="${calificaInstance?.clase?.id}">${calificaInstance?.clase?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${calificaInstance?.pregunta}">
				<li class="fieldcontain">
					<span id="pregunta-label" class="property-label"><g:message code="califica.pregunta.label" default="Pregunta" /></span>
					
						<span class="property-value" aria-labelledby="pregunta-label"><g:link controller="pregunta" action="show" id="${calificaInstance?.pregunta?.id}">${calificaInstance?.pregunta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${calificaInstance?.puntuacion}">
				<li class="fieldcontain">
					<span id="puntuacion-label" class="property-label"><g:message code="califica.puntuacion.label" default="Puntuacion" /></span>
					
						<span class="property-value" aria-labelledby="puntuacion-label"><g:fieldValue bean="${calificaInstance}" field="puntuacion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${calificaInstance?.id}" />
					<g:link class="edit" action="edit" id="${calificaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
