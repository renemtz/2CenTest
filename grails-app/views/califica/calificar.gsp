<%@ page import="com.ulsa.evaluacion.Califica"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'califica.label', default: 'Califica')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
		<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
	function validar() {
		var element = document.getElementById('tabla');
		var formFieldList = element.getElementsByTagName('input');
		var contador=0;
		for ( var i = 0; i < formFieldList.length; i++) {
			if (formFieldList[i].checked) {
				contador = contador+1;
			}
		}
		if ((formFieldList.length/5)==contador) {
			$("#formulario").submit();
		} else {
			alert('Debes evaluar todos los puntos');
		}
		/*
		for ( var i = 0; i < elementos.length; i++) {
			alert(" Elemento: " + elementos[i].value + "\n Seleccionado: "
					+ elementos[i].checked);
		}*/
	}
</script>
</head>
<body>
	<g:if test="${clase}">
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/alumno/inicio')}"><g:message
							code="Inicio" /></a></li>
				
			</ul>
		</div>

		<g:form id="formulario" name="formulario" action="save_calificaciones">
			<fieldset class="form">
				<br> <strong>Profesor:</strong>
				${clase?.profesor?.nombre}
				${clase?.profesor?.paterno}
				${clase?.profesor?.materno}
				<br> <strong>Asignatura:</strong>
				${clase?.materia}
				<br> <br>
				<p>
					<strong>Responde según corresponda</strong> <br>
				</p>
				<p><strong>P</strong> = Pésimo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>M</strong> =
					Malo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>R</strong> =
					Regular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>MB</strong> = Muy
					bien&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>E</strong> = Excelente</p>
				<br> <br>
				<g:hiddenField name="idClase" value="${clase?.id}" />
				<table id="tabla" name="tabla">
					<g:each var="pregunta" in="${clase?.evaluacion?.preguntas}">
						<tr>
							<td>
								${pregunta?.descripcion}
							</td>
							<td><g:radioGroup name="p${pregunta.id}"
									labels="['P','M','R', 'MB', 'E']" values="[1,2,3,4,5]">
									${it.radio}
									<g:message code="${it.label}" />&nbsp;&nbsp;&nbsp;&nbsp;
									</g:radioGroup></td>
						</tr>
					</g:each>
					<tr>
						<td>Comentarios</td>
						<td>
							<g:textArea id="comentarios" name="comentarios" rows="5" cols="40"/>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="buttons">
				<input type="button" name="create" class="save" value="Crear"
					onClick="validar()" />
			</fieldset>
		</g:form>


	</g:if>
	<g:else>
			No hay preguntas
		</g:else>


</body>
</html>