<%@ page import="com.ulsa.evaluacion.Grupo"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'grupo.label', default: 'Grupo')}" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<title><g:message code="default.create.label"
		args="[entityName]" /></title>

<script>
			var semestre="";
			var numeroSemestres=0;
			var miArray;
			function habilitar(id) {
				if ($('#check'+id).is(':checked')) {
					var cadena="";
					cadena+="<div align='right'>Número de grupos: <input type='number' min='1' max='10' value='1' id='numGrupos"+id+"' name='numGrupos"+id+"' onChange='agregarGrupo("+id+")'/></div>";
					cadena+="<div id='grupos"+id+"' name='grupos"+id+"'></div>";
					$("#div"+id).html(cadena);
					agregarGrupo(id);
					
				} else {
					$("#div"+id).html("");
				}
			}

			function agregarGrupo(id) {
				var numGrupos = parseInt($("#numGrupos"+id).val());
				var cadena="<table>";
				var aux;
				for (var i=1; i<=numGrupos; i++) {
					aux = $("#semGrupo"+id+"-"+i).val();
					cadena+="<tr>";
					cadena+="<td>Grupo "+i+"</td>";
					if (aux!=undefined) {
						cadena+="<td><input type='text' id='semGrupo"+id+"-"+i+"' name='semGrupo"+id+"-"+i+"' value='"+aux+"'/></td>";
					} else {
						cadena+="<td><input type='text' id='semGrupo"+id+"-"+i+"' name='semGrupo"+id+"-"+i+"'/></td>";
					}
					cadena+="</tr>";
				}
				$('#semestresTxt').val(semestre);
				$('#grupos'+id).html(cadena);
			}

			function validar() {
				var inputs = document.getElementsByTagName('input');
				var pasa = true;
				for ( var i = 0; i < inputs.length; i++) {
					if (inputs[i].type == 'text') {
						if (inputs[i].value=="") {
							pasa = false;
						}
			        }
				}
				//alert(element.childNodes);
				if (pasa) {
					$("#formulario").submit();
				} else {
					alert("Todos los campos deben estar completos");
				}
			}
		</script>
</head>
<body>
	<a href="#create-grupo" class="skip" tabindex="-1"><g:message
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
	<div id="create-grupo" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${grupoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${grupoInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form action="save_grupo" id="formulario" name="formulario">
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
						onchange="${remoteFunction(action: 'actualizarSemestres',
                       update: 'semestres',
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
						onchange="${remoteFunction(action: 'actualizarSemestres',
                       update: 'semestres',
                       params: '\'carrera=\' + this.value+\'&ciclo=\' + ciclo.value')}" />
				</div>

				<g:render template="semestres" />

			</fieldset>
			<fieldset class="buttons">
				<input type="button" name="create" class="save" value="Crear"
					onClick="validar()" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
