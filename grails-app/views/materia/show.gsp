
<%@ page import="com.ulsa.evaluacion.Materia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materia.label', default: 'Materia')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-materia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-materia" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list materia">
			
				<g:if test="${materiaInstance?.clave}">
				<li class="fieldcontain">
					<span id="clave-label" class="property-label"><g:message code="materia.clave.label" default="Clave" /></span>
					
						<span class="property-value" aria-labelledby="clave-label"><g:fieldValue bean="${materiaInstance}" field="clave"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="materia.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${materiaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.grado}">
				<li class="fieldcontain">
					<span id="grado-label" class="property-label"><g:message code="materia.grado.label" default="Grado" /></span>
					
						<span class="property-value" aria-labelledby="grado-label"><g:fieldValue bean="${materiaInstance}" field="grado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.carrera}">
				<li class="fieldcontain">
					<span id="carrera-label" class="property-label"><g:message code="materia.carrera.label" default="Carrera" /></span>
					
						<span class="property-value" aria-labelledby="carrera-label"><g:link controller="carrera" action="show" id="${materiaInstance?.carrera?.id}">${materiaInstance?.carrera?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.cicloMaterias}">
				<li class="fieldcontain">
					<span id="cicloMaterias-label" class="property-label"><g:message code="materia.cicloMaterias.label" default="Ciclo Materias" /></span>
					
						<g:each in="${materiaInstance.cicloMaterias}" var="c">
						<span class="property-value" aria-labelledby="cicloMaterias-label"><g:link controller="cicloMateria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${materiaInstance?.id}" />
					<g:link class="edit" action="edit" id="${materiaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
