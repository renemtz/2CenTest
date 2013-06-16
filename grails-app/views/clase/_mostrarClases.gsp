<div id="mostrarClases" name="mostrarClases">
	<div
		class="fieldcontain ${hasErrors(bean: claseInstance, field: 'grupo', 'error')} required">
		<br>
		<g:if test="${clases}">
			<table>
				<tr>
					<th>Materia</th>
					<th>Profesor</th>
				</tr>
				<g:each var="clase" in="${clases}">
					<tr>
						<td>
							${clase.materia}
						</td>
						<td>
							<div
								class="fieldcontain ${hasErrors(bean: claseInstance, field: 'profesor', 'error')} required">
								<label for="profesor"> <g:message
										code="clase.profesor.label" default="Profesor" /> <span
									class="required-indicator">*</span>
								</label>
								<g:select id="profesor${clase.id}" name="profesor.id${clase.id}" 
									noSelection="['':'Seleccione un profesor']"
									from="${com.ulsa.evaluacion.Profesor.list()}" optionKey="id"
									required="" value="${clase?.profesor?.id}"
									class="many-to-one" />
							</div>
						</td>
					</tr>
				</g:each>
			</table>
		</g:if>
	</div>
</div>