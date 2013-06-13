<%@ page import="com.ulsa.evaluacion.Califica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'califica.label', default: 'Califica')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:if test="${clase}">
			
			<g:form action="save_calificaciones" >
				<fieldset class="form">
					<br>
					Profesor: ${clase?.profesor?.nombre} ${clase?.profesor?.paterno} ${clase?.profesor?.materno}
					<br>
					Asignatura: ${clase?.materia}
					<br>
					<br>
					<p>
						Responde según corresponda
						<br>
					</p>
					<p>
						P = Pésimo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						M = Malo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						R = Regular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						MB = Muy bien&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						E = Excelente
					</p>
					<br>
					<br>
					Alumno:
					Clase:<g:field name="clase" type="text" value="${clase?.id}" required=""/>
					<table>
						<g:each var="pregunta" in="${clase?.evaluacion?.preguntas}">
							<tr>
								<td>
								${pregunta?.descripcion} 
								</td>
								<td>
									<g:radioGroup name="p${pregunta.id}" labels="['P','M','R', 'MB', 'E']" values="[1,2,3,4,5]">
										${it.radio} <g:message code="${it.label}" />&nbsp;&nbsp;&nbsp;&nbsp;
									</g:radioGroup>
								</td>
							</tr>
						</g:each>
					</table>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
			
			
		</g:if>
		<g:else>
			No hay preguntas
		</g:else>
	
	
	</body>
</html>