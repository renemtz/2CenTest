
<%@ page import="com.ulsa.evaluacion.Profesor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesor.label', default: 'Profesor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-profesor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-profesor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list profesor">
			
				<g:if test="${profesorInstance?.clave}">
				<li class="fieldcontain">
					<span id="clave-label" class="property-label"><g:message code="profesor.clave.label" default="Clave" /></span>
					
						<span class="property-value" aria-labelledby="clave-label"><g:fieldValue bean="${profesorInstance}" field="clave"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="profesor.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${profesorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.paterno}">
				<li class="fieldcontain">
					<span id="paterno-label" class="property-label"><g:message code="profesor.paterno.label" default="Paterno" /></span>
					
						<span class="property-value" aria-labelledby="paterno-label"><g:fieldValue bean="${profesorInstance}" field="paterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.materno}">
				<li class="fieldcontain">
					<span id="materno-label" class="property-label"><g:message code="profesor.materno.label" default="Materno" /></span>
					
						<span class="property-value" aria-labelledby="materno-label"><g:fieldValue bean="${profesorInstance}" field="materno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="profesor.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${profesorInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.clases}">
				<li class="fieldcontain">
					<span id="clases-label" class="property-label"><g:message code="profesor.clases.label" default="Clases" /></span>
					
						<g:each in="${profesorInstance.clases}" var="c">
						<span class="property-value" aria-labelledby="clases-label"><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${profesorInstance?.id}" />
					<g:link class="edit" action="edit" id="${profesorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
