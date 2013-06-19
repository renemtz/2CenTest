<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
<g:layoutHead />
<r:layoutResources />
</head>
<body>

	<div id="grailsLogo" role="banner">
		<a href="http://grails.org"><img
			src="${resource(dir: 'Imagenes', file: 'logo.png')}" alt="Grails" /></a>
	</div>
	
	
	
	
	<div id="menu">
		<ul id="css3menu1" class="topmenu">
			<li class="topfirst"><a href="/2CenTest/"
				style="height: 18px; line-height: 18px;">Inicio</a></li>
			<li class="topmenu"><a href="#"
				style="height: 18px; line-height: 18px;"><span>Listados</span></a>
				<ul>
					<li><a href="/2CenTest/ciclo/list" title="Listado de Ciclos">Ciclos</a></li>
					<li><a href="/2CenTest/carrera/list" title="Listado de Carreras">Carreras</a></li>
					<li><a href="/2CenTest/materia/list" title="Listado de Materias">Materias</a></li>
					<li><a href="/2CenTest/grupo/list" title="Listado de Grupos">Grupos</a></li>
					<li><a href="/2CenTest/clase/list" title="Listado de Clases">Clases</a></li>
					<li><a href="/2CenTest/profesor/list" title="Listado de Profesores">Profesores</a></li>
					<li><a href="/2CenTest/alumno/list" title="Listado de Alumnos">Alumnos</a></li>
					<li><a href="/2CenTest/evaluacion/list" title="Listado de Evaluaciones">Evaluaciones</a></li>
				</ul></li>
			<li class="topmenu"><a href="#"
				style="height: 18px; line-height: 18px;"><span>Procesos</span></a>
				<ul>
					<li><a href="/2CenTest/grupo/inscribirb" title="Asigna los alumnos a grupos">Inscripciones</a></li>
					<li><a href="/2CenTest/evaluacion/asignar">Asignar evaluación</a></li>
					<li><a href="/2CenTest/clase/asignarProfesor">Asignar profesores a
							clases</a></li>
					<li><a href="/2CenTest/cicloMateria/crear">Crear plan de estudio</a></li>
					<li><a href="/2CenTest/grupo/crear">Autogenerar grupos y clases</a></li>
				</ul></li>
			<li class="topmenu"><a href="#"
				style="height: 18px; line-height: 18px;"><span>Reportes</span></a>
				<ul>
					<li><a href="/2CenTest/califica/reporte" >Generar reporte</a></li>
				</ul></li>
			<li class="topmenu"><a href="#"
				style="height: 18px; line-height: 18px;">Ayuda</a></li>
			<li class="topmenu"><a href="#"
				style="height: 18px; line-height: 18px;">Acerca de</a></li>

			<li class="toplast"><a href="#"
				style="height: 18px; line-height: 180px;"></a></li>
			<li class="topmenu"><a href="/2CenTest/alumno/login"
				style="height: 18px; line-height: 18px;"> <img src="${resource(dir: 'Imagenes', file: 'logout.png')}"
										width="25" height="25"/>&nbsp;&nbsp;&nbsp;Salir </a></li>
		</ul>
	</div>
	<g:layoutBody />
	
	<div class="footer" role="contentinfo"></div>
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
	
	
	<g:javascript library="application" />
	

	<r:layoutResources />
</body>
</html>
