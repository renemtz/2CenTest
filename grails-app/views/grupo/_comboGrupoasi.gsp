<div id="combogrupoasi" name="combogrupoasi" class="fieldcontain">
					<label for="grupoasi"> <g:message code="clase.grupo.label"
							default="Grupo" /> <!--<span class="required-indicator">*</span>-->
					</label>
					<g:select id="grupoasi" name="grupo.id"
					noSelection="['':'Seleccione una grupo']"
						from="${grupos}" optionKey="id"
						required="" value="${claseInstance?.grupo?.id}"
						onchange="${remoteFunction(action: 'actualizarAlumnos',
                        update: 'alumnosD',
                        params: '\'grupoasi=\' + this.value+\'&grupo=\' + grupo.value')}"/>
</div>