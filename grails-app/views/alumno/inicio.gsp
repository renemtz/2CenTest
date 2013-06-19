<%@ page import="com.ulsa.evaluacion.Alumno"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="alumno">
<g:set var="entityName"
	value="${message(code: 'alumno.label', default: 'Alumno')}" />
<title>Evaluación</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
	function evaluar (idClase, status)  {
		if (status == '0') {
			document.location.href="/2CenTest/califica/calificar/"+idClase; 
		} else if(status=='2'){
			alert('Contacte al administrador');
		}
		
	}
</script>
</head>
<body>
	<g:if test="${session.alumno}">
		<a href="#create-alumno" class="skip" tabindex="-1"><g:message
				code="default.link.skip.label" default="Skip to content&hellip;" /></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/alumno/inicio')}"><g:message
							code="default.home.label" /></a></li>
				<li><a href="${createLink(uri: '/alumno/login')}">Cerrar Sesión</a></li>
				
			</ul>
		</div>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div id="cambiarContrasena" style="float:right;">
			<br>
			<a href="/2CenTest/alumno/cambiarContrasena">Cambiar contraseña</a>
			<br>
		</div>

		<g:form id="formulario" name="formulario" action="save">
			<fieldset class="form">
				<h1>Evaluación docente</h1>
				<br> <strong>Matrícula:</strong>
				${session?.alumno?.matricula}
				<br> <strong>Nombre:</strong>
				${session?.alumno?.nombre}
				${session?.alumno?.paterno}
				${session?.alumno?.materno}
				<br> <strong>Carrera: </strong>

				<g:if test="${clases.size!=0}">
					${clases?.get(0)?.materia?.carrera?.nombre}
				</g:if>
				<g:else>
					El Alumno no está registrado en alguna carrera
				</g:else>
				<br> <strong>Semestre: </strong>
				<g:if test="${clases.size!=0}">
					${clases?.get(0)?.materia?.grado}º Semestre
				</g:if>
				<g:else>
					El Alumno no está registrado en algún semestre
				</g:else>
				<br> <br>
				<img src="${resource(dir: 'Imagenes', file: 'palomita.png')}"
										width="20" height="20"> = Evaluación realizada &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="${resource(dir: 'Imagenes', file: 'tache.png')}"
										width="19" height="19"> = Evaluación no realizada
			
				<br>
				<br>
				<br>
				<table>
					<tr>
						<th>Asignatura</th>
						<th>Docente</th>
						<th>Evaluar</th>
					</tr>
					<g:each var="clase" in="${clases}" status="i">
						<tr onClick="evaluar(${clase?.id}, ${evaluaciones?.get(i)})">
							<td>
								${clase?.materia?.nombre}
							</td>
							<td>
								${clase?.profesor?.nombre} ${clase?.profesor?.paterno} ${clase?.profesor?.materno}
							</td>
							<td><g:if test="${evaluaciones?.get(i)=='0'}">
									<img src="${resource(dir: 'Imagenes', file: 'tache.png')}"
										width="25" height="25">
								</g:if> <g:elseif test="${evaluaciones?.get(i)=='1'}">
									<img src="${resource(dir: 'Imagenes', file: 'palomita.png')}"
										width="28" height="28">
								</g:elseif> <g:else>
									<img
										src="${resource(dir: 'Imagenes', file: 'noDisponible.png')}"
										width="25" height="25">
								</g:else></td>

						</tr>
					</g:each>


				</table>


			</fieldset>
			
		</g:form>


	</g:if>


	<g:else>
		${redirect(action:"show") }
	</g:else>


	<div id="create-alumno" class="content scaffold-create" role="main">

	</div>
</body>
</html>
