<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Asignar Evaluaciones</title>
<meta name="layout" content="main">
<script>
	
</script>
<link rel="stylesheet" type="text/css" href="estilo.css" />
<link rel="stylesheet" href="cssms/common.css" type="text/css" />
	<link type="text/css" rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/ui-lightness/jquery-ui.css" />
	<link type="text/css" href="cssms/ui.multiselect.css" rel="stylesheet" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/jquery-ui.min.js"></script>
	<script type="text/javascript" src="jsms/plugins/localisation/jquery.localisation-min.js"></script>
	<script type="text/javascript" src="jsms/plugins/scrollTo/jquery.scrollTo-min.js"></script>
	<script type="text/javascript" src="jsms/ui.multiselect.js"></script>
	<script type="text/javascript">
		$(function(){
			$.localise('ui-multiselect', {/*language: 'en',*/ path: 'jsms/locale/'});
			$(".multiselect").multiselect();
			$('#switcher').themeswitcher();
		});
	</script>
</head>
<body>
	<a href="#edit-clase" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="edit-clase" class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
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
		<g:form method="post">
			<g:hiddenField name="id" value="${claseInstance?.id}" />
			<g:hiddenField name="version" value="${claseInstance?.version}" />

			<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: claseInstance, field: 'evaluacion', 'error')} required">
					<label for="evaluacion"> Evaluación </label>
					<g:select id="evaluacion" name="evaluacion.id"
						from="${com.ulsa.evaluacion.Evaluacion.list()}" optionKey="id"
						required="" value="${claseInstance?.evaluacion?.id}"
						class="many-to-one"
						onchange="${remoteFunction(action: 'actualizarGrupos',
                       update: 'combogrupo',
                       params: '\'carrera=\' + carrera.value+\'&ciclo=\' + ciclo.value+\'&evaluacion=\' + this.value')}"/>
				</div>

				<div
					class="fieldcontain ${hasErrors(bean: claseInstance, field: 'ciclo', 'error')} required">
					<label for="ciclo"> <g:message code="clase.ciclo.label"
							default="Ciclo" /> <!--<span class="required-indicator">*</span>-->
					</label>
					<g:select id="ciclo" name="ciclo.id"
						from="${com.ulsa.evaluacion.Ciclo.list()}" optionKey="id"
						required="" value="${claseInstance?.ciclo?.id}" 
						onchange="${remoteFunction(action: 'actualizarGrupos',
                       update: 'combogrupo',
                       params: '\'ciclo=\' + this.value+\'&carrera=\' + carrera.value+\'&evaluacion=\' + evaluacion.value')}" />
				</div>


				<div class="fieldcontain">
					<label for="carrera"> <g:message code="clase.carrera.label"
							default="Carrera" /> <!--<span class="required-indicator">*</span>-->
					</label>
					<g:select id="carrera" name="carrera.id"
						noSelection="['':'Seleccione una carrera']"
						from="${com.ulsa.evaluacion.Carrera.list()}" optionKey="id"
						required="" value="${claseInstance?.carrera?.id}"
						onchange="${remoteFunction(action: 'actualizarGrupos',
                       update: 'combogrupo',
                       params: '\'carrera=\' + this.value+\'&ciclo=\' + ciclo.value+\'&evaluacion=\' + evaluacion.value')}" />
				</div>
				
				<g:render template="comboGrupo" />

				<g:render template="clasesaAsignar" />
				
			</fieldset>

			<fieldset class="buttons">
				<g:actionSubmit class="save" action="asignar"
					value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
