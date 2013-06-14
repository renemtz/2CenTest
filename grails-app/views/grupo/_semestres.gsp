<div id="semestres" name="semestres">
	<div id="semestres" name="semestres"
		class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'carrera', 'error')} required">
		<label for="carrera"> <g:message code="grupo.carrera.label"
				default="Semestres" /> <span class="required-indicator">*</span>
		</label>

		<g:if test="${semestres}">
			<g:each var="semestre" in="${semestres}">
				<br>
				<div id="semestre${semestre}" name="semestre${semestre}">
					<g:checkBox id="check${semestre}" name="check${semestre}"
						value="${false}" onChange="habilitar(${semestre})" />
					${semestre}º Semestre
					<div id="div${semestre}" name="div${semestre}"></div>
					<script>
						numeroSemestres= numeroSemestres+1;
					</script>
				</div>
				<br>
			</g:each>
			<script>
				miArray = new Array(numeroSemestres);
			</script>
		</g:if>
		<g:else>
			Seleccione las opciones de arriba
		</g:else>

	</div>
</div>