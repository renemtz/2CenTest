<div id="clasesaasignar" name="clasesaasignar"
					class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'clases', 'error')} ">
					<label for="clases"> <g:message code="grupo.clases.label"
							default="Clases" />

					</label>
					<g:select name="clasesaasignar" from="${clases}"
						multiple="multiple" optionKey="id" size="5"
						value="${grupoInstance?.clase*.id}" class="many-to-one" />
				</div>