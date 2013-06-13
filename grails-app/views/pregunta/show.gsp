
<%@ page import="com.ulsa.evaluacion.Pregunta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pregunta.label', default: 'Pregunta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pregunta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pregunta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pregunta">
			
				<g:if test="${preguntaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="pregunta.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${preguntaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${preguntaInstance?.calificaciones}">
				<li class="fieldcontain">
					<span id="calificaciones-label" class="property-label"><g:message code="pregunta.calificaciones.label" default="Calificaciones" /></span>
					
						<g:each in="${preguntaInstance.calificaciones}" var="c">
						<span class="property-value" aria-labelledby="calificaciones-label"><g:link controller="califica" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${preguntaInstance?.evaluacion}">
				<li class="fieldcontain">
					<span id="evaluacion-label" class="property-label"><g:message code="pregunta.evaluacion.label" default="Evaluacion" /></span>
					
						<span class="property-value" aria-labelledby="evaluacion-label"><g:link controller="evaluacion" action="show" id="${preguntaInstance?.evaluacion?.id}">${preguntaInstance?.evaluacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${preguntaInstance?.id}" />
					<g:link class="edit" action="edit" id="${preguntaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
