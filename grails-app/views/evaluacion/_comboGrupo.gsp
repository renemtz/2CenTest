<div id="combogrupo" name="combogrupo" class="fieldcontain">
					<label for="grupo"> <g:message code="clase.grupo.label"
							default="Grupo" /> <!--<span class="required-indicator">*</span>-->
					</label>
					<g:select id="grupo" name="grupo.id"
					noSelection="['':'Seleccione una grupo']"
						from="${grupos}" optionKey="id"
						required="" value="${claseInstance?.grupo?.id}"
						onchange="${remoteFunction(action: 'actualizarClasesAsignar',
                        update: 'clasesaasignar',
                        params: '\'grupo=\' + this.value+\'&evaluacion=\' + evaluacion.value')}"/>
</div>