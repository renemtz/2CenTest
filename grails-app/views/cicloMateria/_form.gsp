<%@ page import="com.ulsa.evaluacion.CicloMateria" %>



<div class="fieldcontain ${hasErrors(bean: cicloMateriaInstance, field: 'ciclos', 'error')} required">
	<label for="ciclos">
		<g:message code="cicloMateria.ciclos.label" default="Ciclos" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ciclos" name="ciclos.id" from="${com.ulsa.evaluacion.Ciclo.list()}" optionKey="id" required="" value="${cicloMateriaInstance?.ciclos?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cicloMateriaInstance, field: 'materias', 'error')} required">
	<label for="materias">
		<g:message code="cicloMateria.materias.label" default="Materias" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materias" name="materias.id" from="${com.ulsa.evaluacion.Materia.list()}" optionKey="id" required="" value="${cicloMateriaInstance?.materias?.id}" class="many-to-one"/>
</div>

