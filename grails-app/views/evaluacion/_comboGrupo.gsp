<div id="combogrupo" name="combogrupo" class="fieldcontain">
					<label for="grupo"> <g:message code="clase.grupo.label"
							default="Grupo" /> <!--<span class="required-indicator">*</span>-->
					</label>
					<g:select id="grupo" name="clase.id"
						from="${grupos}" optionKey="id"
						required="" value="${claseInstance?.grupo?.id}" />
</div>