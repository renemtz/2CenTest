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
			alert('completos');
			$("#formulario").submit();
		} else {
			alert('incompletos');
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

		<g:form id="formulario" name="formulario" action="save_calificaciones">
			<fieldset class="form">
				<br> Profesor:
				${clase?.profesor?.nombre}
				${clase?.profesor?.paterno}
				${clase?.profesor?.materno}
				<br> Asignatura:
				${clase?.materia}
				<br> <br>
				<p>
					Responde según corresponda <br>
				</p>
				<p>P = Pésimo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; M =
					Malo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R =
					Regular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MB = Muy
					bien&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; E = Excelente</p>
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