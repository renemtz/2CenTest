
<%@ page import="com.ulsa.evaluacion.Ciclo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ciclo.label', default: 'Ciclo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ciclo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ciclo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ciclo">
			
				<g:if test="${cicloInstance?.clave}">
				<li class="fieldcontain">
					<span id="clave-label" class="property-label"><g:message code="ciclo.clave.label" default="Clave" /></span>
					
						<span class="property-value" aria-labelledby="clave-label"><g:fieldValue bean="${cicloInstance}" field="clave"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cicloInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="ciclo.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${cicloInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cicloInstance?.cicloMaterias}">
				<li class="fieldcontain">
					<span id="cicloMaterias-label" class="property-label"><g:message code="ciclo.cicloMaterias.label" default="Ciclo Materias" /></span>
					
						<g:each in="${cicloInstance.cicloMaterias}" var="c">
						<span class="property-value" aria-labelledby="cicloMaterias-label"><g:link controller="ciclo" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cicloInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="ciclo.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${cicloInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cicloInstance?.grupos}">
				<li class="fieldcontain">
					<span id="grupos-label" class="property-label"><g:message code="ciclo.grupos.label" default="Grupos" /></span>
					
						<g:each in="${cicloInstance.grupos}" var="g">
						<span class="property-value" aria-labelledby="grupos-label"><g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cicloInstance?.id}" />
					<g:link class="edit" action="edit" id="${cicloInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
