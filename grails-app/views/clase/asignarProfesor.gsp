<%@ page import="com.ulsa.evaluacion.Clase"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'clase.label', default: 'Clase')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
		<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
</head>
<body>
	<a href="#create-clase" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-clase" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${claseInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${claseInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form action="save">
			<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'ciclo', 'error')} required">
					<label for="ciclo"> <g:message code="grupo.ciclo.label"
							default="Ciclo escolar" /> <span class="required-indicator">*</span>
					</label>
					<g:select id="ciclo" name="ciclo.id"
						noSelection="['':'Seleccione un ciclo']"
						from="${com.ulsa.evaluacion.Ciclo.list()}" optionKey="id"
						required="" value="${grupoInstance?.ciclo?.id}"
						class="many-to-one"
						onchange="${remoteFunction(action: 'actualizarGrupos',
                       update: 'comboGrupos',
                       params: '\'ciclo=\' + this.value+\'&carrera=\' + carrera.value')}" />
				</div>

				<div
					class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'carrera', 'error')} required">
					<label for="carrera"> <g:message code="grupo.carrera.label"
							default="Carrera" /> <span class="required-indicator">*</span>
					</label>
					<g:select id="carrera" name="carrera.id"
						noSelection="['':'Seleccione una carrera']"
						from="${com.ulsa.evaluacion.Carrera.list()}" optionKey="id"
						required="" value="${grupoInstance?.carrera?.id}"
						class="many-to-one"
						onchange="${remoteFunction(action: 'actualizarGrupos',
                       update: 'comboGrupos',
                       params: '\'carrera=\' + this.value+\'&ciclo=\' + ciclo.value')}" />
				</div>
				
				<g:render template="comboGrupo" />
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
