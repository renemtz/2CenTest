<div id="mostrarClases" name="mostrarClases">
	<div
		class="fieldcontain ${hasErrors(bean: claseInstance, field: 'grupo', 'error')} required">
		<label for="grupo"> <g:message code="clase.grupo.label"
				default="Grupo" /> <span class="required-indicator">*</span>
		</label>
		<g:if test="${clases}">
			<table>
				<g:each var="clase" in="${clases}">
					<tr>
						<td>${clase.materia}</td>
						<td>
							<div
								class="fieldcontain ${hasErrors(bean: claseInstance, field: 'profesor', 'error')} required">
								<label for="profesor"> <g:message
										code="clase.profesor.label" default="Profesor" /> <span
									class="required-indicator">*</span>
								</label>
								<g:select id="profesor" name="profesor.id"
									from="${com.ulsa.evaluacion.Profesor.list()}" optionKey="id"
									required="" value="${claseInstance?.profesor?.id}"
									class="many-to-one" />
							</div>
						</td>
					</tr>
				</g:each>
			</table>
		</g:if>
	</div>
</div>