<div id="divContrasena"  class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'contrasena', 'error')} ">
	<label for="contrasena">
		<g:message code="alumno.contrasena.label" default="Contrasena" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contrasena" maxlength="15" value="${contrasena}" required=""/>
	<input type="button" onClick="generar()" value="Generar"/>
</div>