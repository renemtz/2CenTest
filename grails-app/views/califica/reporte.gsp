<%@ page import="com.ulsa.evaluacion.Califica"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'califica.label', default: 'Califica')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>

<link href="${resource(dir: 'kendo', file: 'examples-offline.css')}"
	rel="stylesheet">
<link href="${resource(dir: 'kendo', file: 'kendo.dataviz.min.css')}"
	rel="stylesheet">
<script src="${resource(dir: 'kendo', file: 'jquery.min.js')}"></script>
<script src="${resource(dir: 'kendo', file: 'kendo.dataviz.min.js')}"></script>
<script src="${resource(dir: 'kendo', file: 'console.js')}"></script>



</head>
<body>
	<a href="#create-califica" class="skip" tabindex="-1"><g:message
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
	<div id="create-califica" class="content scaffold-create" role="main">
		<h1>Reporte</h1>
		<g:form action="save">
			<fieldset class="form">
				<h2>Porcentaje de preguntas contestadas</h2>
				<g:if test="${!(contestado==0 && sincontestar==0)}">
					<div id="example" class="k-content">
						<div class="chart-wrapper">
							<div id="chart"></div>
						</div>
						
						<script>
						function createChart() {
							$("#chart")
									.kendoChart(
											{
												theme : $(document).data(
														"kendoSkin")
														|| "default",
												title : {
													text : "Porcentaje de preguntas contestadas (todos los alumnos)"
												},
												legend : {
													position : "bottom",
													labels : {
														template : "#= text # (#= value #%)"
													}
												},
												seriesDefaults : {
													labels : {
														visible : true,
														format : "{0}%"
													}
												},
												series : [ {
													type : "pie",
													data : [ {
														category : "Sin contestar",
														value : ${sincontestar}
													}, {
														category : "Contestado",
														value : ${contestado}
													} ]
												} ],
												tooltip : {
													visible : true,
													format : "{0}%"
												}
											});
						}

						$(document).ready(
								function() {
									setTimeout(function() {
										// Initialize the chart with a delay to make sure
										// the initial animation is visible
										createChart();

										$("#example").bind("kendo:skinChange",
												function(e) {
													createChart();
												});
									}, 400);
								});
					</script>
					</div>
				</g:if>
				<g:else>
					Debe asignar una evaluación para ver este reporte
				</g:else>
				
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
                       params: '\'ciclo=\' + this.value+\'&carrera=\' + carrera.value')}" 
                       onclick="${remoteFunction(action: 'actualizarMostrarClases',
                       update: 'mostrarClases',
                       params: '\'grupo=\' + grupo.value+\'&ciclo=\' + this.value+\'&carrera=\' + carrera.value')}"/>
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
                       params: '\'carrera=\' + this.value+\'&ciclo=\' + ciclo.value')}"
						onclick="${remoteFunction(action: 'actualizarMostrarClases',
                       update: 'mostrarClases',
                       params: '\'grupo=\' + grupo.value+\'&ciclo=\' + ciclo.value+\'&carrera=\' + this.value')}" />
				</div>

				<g:render template="comboGrupo" />
				<g:render template="mostrarClases" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
