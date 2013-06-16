<div id="comboGrupos" name="comboGrupos">
	<div
		class="fieldcontain ${hasErrors(bean: claseInstance, field: 'grupo', 'error')} required">
		<label for="grupo"> <g:message code="clase.grupo.label"
				default="Grupo" /> <span class="required-indicator">*</span>
		</label>
		<g:if test="${grupos}">
			definido
			<g:select id="grupo" name="grupo.id" from="${grupos}" optionKey="id"
				noSelection="['':'Seleccione un grupo']" required=""
				class="many-to-one"
				onchange="${remoteFunction(action: 'actualizarMostrarClases',
                       update: 'mostrarClases',
                       params: '\'grupo=\' + this.value')}" />
		</g:if>
		<g:else>
			no definido
			<g:select id="grupo" name="grupo.id" disabled="true"
				noSelection="['':'Seleccione un grupo']"
				from="${com.ulsa.evaluacion.Grupo.list()}" optionKey="id"
				required="" value="${claseInstance?.grupo?.id}" class="many-to-one" />
		</g:else>
	</div>
</div>