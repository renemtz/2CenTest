<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Crear Evaluaciones</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<meta name="layout" content="main">
<script>
	var nopreguntas = 0;

	function agregar() {
		var valor = "";
		nopreguntas = nopreguntas + 1;
		$("#tamano").val(nopreguntas);
		var aux;
		var bandera = 0;

		for ( var i = 1; i <= nopreguntas; i++) {

			if (i == nopreguntas) {
				valor = valor
						+ "<div id='cont"+i+"' name='cont"+i+"'>"
						+ "<input id='p"+i+"' name='p"+i+"' type='text' value=''>"
						+ "<input id='e" + i
						+ "' type='button' value='X' onclick='eliminar(" + i
						+ ");'><br>" + "</div>";
			} else {
				aux = $("#p" + i).val();
				if (aux == "") {
					bandera = 1;
				} else {
					if (aux != undefined) {
						valor = valor
								+ "<div id='cont"+i+"' name='cont"+i+"'>"
								+ "<input id='p"+i+"' name='p"+i+"' type='text' value='"+aux+"'>"
								+ "<input id='e"
								+ i
								+ "' type='button' value='X' onclick='eliminar("
								+ i + ");'><br>" + "</div>";
					}
				}
			}
		}
		if (bandera == 1) {
			alert("no puede haber campos vacios");
		} else {
			$("#contenedor").html(valor);
		}

	}

	function eliminar(id) {
		$("#cont" + id).remove();
	}
</script>
<link rel="stylesheet" type="text/css" href="estilo.css" />
</head>
<body>
	<a href="#create-evaluacion" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="list">
					<g:message code="Lista de evaluaciones" />
				</g:link></li>
		</ul>
	</div>

	<div id="create-evaluacion" class="content scaffold-create" role="main">
		<h1>
			<g:message code="Crear Evaluación" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${evaluacionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${evaluacionInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form action="save_evaluacion">
			<fieldset class="form">

				<div
					class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'clave', 'error')} ">
					<label for="clave"> <g:message
							code="evaluacion.clave.label" default="Clave" />

					</label>
					<g:textField name="clave" value="${evaluacionInstance?.clave}" />
				</div>

				<div
					class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'nombre', 'error')} ">
					<label for="nombre"> <g:message
							code="evaluacion.nombre.label" default="Nombre" />

					</label>
					<g:textField name="nombre" value="${evaluacionInstance?.nombre}" />
				</div>

				<div
					class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'descripcion', 'error')} ">
					<label for="descripcion"> <g:message
							code="evaluacion.descripcion.label" default="Descripcion" />

					</label>
					<g:textArea id="descripcion" name="descripcion" rows="5" cols="40"></g:textArea>
				</div>
				
				<div
					class="fieldcontain ${hasErrors(bean: evaluacionInstance, field: 'descripcion', 'error')} ">
					<label for="contenedor"> <g:message
							code="evaluacion.descripcion.label" default="Preguntas" />

					</label>
					<div id="contenedor" name="contenedor" class="preguntas"></div>
				</div>
				
				<input type="button" onClick="agregar();" value="+"><br>
				<input type="submit" value="Terminar">
				<g:hiddenField id="tamano" name="tamano" />
			</fieldset>

		</g:form>
	</div>

</body>
</html>