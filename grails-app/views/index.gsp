<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
</style>
</head>
<body>

	<ul id="css3menu1" class="topmenu">
		<li class="topfirst"><a href="/2CenTest/"
			style="height: 18px; line-height: 18px;">Inicio</a></li>
		<li class="topmenu"><a href="#"
			style="height: 18px; line-height: 18px;"><span>Listados</span></a>
			<ul>
				<li><a href="ciclo/list" title="Listado de Ciclos">Ciclos</a></li>
				<li><a href="carrera/list" title="Listado de Carreras">Carreras</a></li>
				<li><a href="materia/list" title="Listado de Materias">Materias</a></li>
				<li><a href="grupo/list" title="Listado de Grupos">Grupos</a></li>
				<li><a href="clase/list" title="Listado de Clases">Clases</a></li>
				<li><a href="profesor/list" title="Listado de Profesores">Profesores</a></li>
				<li><a href="alumno/list" title="Listado de Alumnos">Alumnos</a></li>
				<li><a href="evaluacion/list" title="Listado de Evaluaciones">Evaluaciones</a></li>
			</ul></li>
		<li class="topmenu"><a href="#"
			style="height: 18px; line-height: 18px;"><span>Procesos</span></a>
			<ul>
				<li><a href="inscribirb" title="Asigna los alumnos a grupos">Inscripciones</a></li>
				<li><a href="evaluacion/asignar">Asignar evaluación</a></li>
				<li><a href="clase/asignarProfesor">Asignar profesores a
						clases</a></li>
				<li><a href="cicloMateria/crear">Crear plan de estudio</a></li>
				<li><a href="grupo/crear">Autogenerar grupos y clases</a></li>
			</ul></li>
		<li class="topmenu"><a href="#"
			style="height: 18px; line-height: 18px;"><span>Reportes</span></a>
			<ul>
				<li><a href="#" target="_blank">Generar reporte</a></li>
			</ul></li>
		<li class="topmenu"><a href="#"
			style="height: 18px; line-height: 18px;">Ayuda</a></li>
		<li class="topmenu"><a href="#"
			style="height: 18px; line-height: 18px;">Acerca de</a></li>

		<li class="toplast"><a href="#"
			style="height: 18px; line-height: 180px;"></a></li>
		<li class="topmenu"><a href="#"
			style="height: 18px; line-height: 18px;"> Salir </a></li>
	</ul>





	<IMG style="display: block; margin-left: auto; margin-right: auto;"
		SRC="Imagenes/2centest_grande.jpg">

	<div id="controller-list" role="navigation">
		<h2>Available Controllers:</h2>
		<ul>
			<g:each var="c"
				in="${grailsApplication.controllerClasses.sort { it.fullName } }">
				<li class="controller"><g:link
						controller="${c.logicalPropertyName}">
						${c.fullName}
					</g:link></li>
			</g:each>
		</ul>
	</div>






</body>
</html>
