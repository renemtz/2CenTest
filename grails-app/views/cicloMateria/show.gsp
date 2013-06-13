
<%@ page import="com.ulsa.evaluacion.CicloMateria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cicloMateria.label', default: 'CicloMateria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cicloMateria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cicloMateria" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cicloMateria">
			
				<g:if test="${cicloMateriaInstance?.ciclos}">
				<li class="fieldcontain">
					<span id="ciclos-label" class="property-label"><g:message code="cicloMateria.ciclos.label" default="Ciclos" /></span>
					
						<span class="property-value" aria-labelledby="ciclos-label"><g:link controller="ciclo" action="show" id="${cicloMateriaInstance?.ciclos?.id}">${cicloMateriaInstance?.ciclos?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cicloMateriaInstance?.materias}">
				<li class="fieldcontain">
					<span id="materias-label" class="property-label"><g:message code="cicloMateria.materias.label" default="Materias" /></span>
					
						<span class="property-value" aria-labelledby="materias-label"><g:link controller="materia" action="show" id="${cicloMateriaInstance?.materias?.id}">${cicloMateriaInstance?.materias?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cicloMateriaInstance?.id}" />
					<g:link class="edit" action="edit" id="${cicloMateriaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
