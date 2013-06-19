<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

</head>
<body>

	


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
