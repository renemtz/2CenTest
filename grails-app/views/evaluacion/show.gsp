
<%@ page import="com.ulsa.evaluacion.Evaluacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evaluacion.label', default: 'Evaluacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-evaluacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-evaluacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list evaluacion">
			
				<g:if test="${evaluacionInstance?.clave}">
				<li class="fieldcontain">
					<span id="clave-label" class="property-label"><g:message code="evaluacion.clave.label" default="Clave" /></span>
					
						<span class="property-value" aria-labelledby="clave-label"><g:fieldValue bean="${evaluacionInstance}" field="clave"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="evaluacion.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${evaluacionInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="evaluacion.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${evaluacionInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionInstance?.clases}">
				<li class="fieldcontain">
					<span id="clases-label" class="property-label"><g:message code="evaluacion.clases.label" default="Clases" /></span>
					
						<g:each in="${evaluacionInstance.clases}" var="c">
						<span class="property-value" aria-labelledby="clases-label"><g:link controller="clase" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${evaluacionInstance?.preguntas}">
				<li class="fieldcontain">
					<span id="preguntas-label" class="property-label"><g:message code="evaluacion.preguntas.label" default="Preguntas" /></span>
					
						<g:each in="${evaluacionInstance.preguntas}" var="p">
						<span class="property-value" aria-labelledby="preguntas-label"><g:link controller="pregunta" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${evaluacionInstance?.id}" />
					<g:link class="edit" action="edit" id="${evaluacionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
