<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inscripciones</title>
<meta name="layout" content="main">

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<script language="Javascript">
function SelectMoveRows(SS1,SS2)
{
    var SelID='';
    var SelText='';
    // Move rows from SS1 to SS2 from bottom to top
    for (i=SS1.options.length - 1; i>=0; i--)
    {
        if (SS1.options[i].selected == true)
        {
            SelID=SS1.options[i].value;
            SelText=SS1.options[i].text;
            var newRow = new Option(SelText,SelID);
            SS2.options[SS2.length]=newRow;
            SS1.options[i]=null;
        }
    }
    SelectSort(SS2);
}
function SelectSort(SelList)
{
    var ID='';
    var Text='';
    for (x=0; x < SelList.length - 1; x++)
    {
        for (y=x + 1; y < SelList.length; y++)
        {
            if (SelList[x].text > SelList[y].text)
            {
                // Swap rows
                ID=SelList[x].value;
                Text=SelList[x].text;
                SelList[x].value=SelList[y].value;
                SelList[x].text=SelList[y].text;
                SelList[y].value=ID;
                SelList[y].text=Text;
            }
        }
    }
}
</script>
<script>
function selecciona(id)
{
  id=document.getElementById(id);
  for (i=0; ele = id.options[i]; i++)
   {
    ele.selected = true;
   }
}
</script>

</head>
<body>

	<a href="#edit-clase" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="edit-clase" class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${claseInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${claseInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form method="post" name="Example" id="Example" action="asignarEvaluaciones" onsubmit="selecciona('FeatureCodes')">
			<g:hiddenField name="id" value="${claseInstance?.id}" />
			<g:hiddenField name="version" value="${claseInstance?.version}" />

			<fieldset class="form">
				Buscar por nombre: <input type="text" onkeyup="${remoteFunction(action: 'actualizarAlumnos',
                        update: 'alumnosD',
                        params: '\'nombre=\' + this.value+\'&grupoasi=\' + grupoasi.value')}">
				<div
					class="fieldcontain ${hasErrors(bean: claseInstance, field: 'ciclo', 'error')} required">
					<label for="ciclo"> <g:message code="clase.ciclo.label"
							default="Ciclo" /> <!--<span class="required-indicator">*</span>-->
					</label>
					<g:select id="ciclo" name="ciclo.id"
						from="${com.ulsa.evaluacion.Ciclo.list()}" optionKey="id"
						required="" value="${claseInstance?.ciclo?.id}" 
						onchange="${remoteFunction(action: 'actualizarGrupos2',
                       update: 'combogrupo',
                       params: '\'ciclo=\' + this.value+\'&carrera=\' + carrera.value')}" />
				</div>


				<div class="fieldcontain">
					<label for="carrera"> <g:message code="clase.carrera.label"
							default="Carrera" /> <!--<span class="required-indicator">*</span>-->
					</label>
					<g:select id="carrera" name="carrera.id"
						noSelection="['':'Seleccione una carrera']"
						from="${com.ulsa.evaluacion.Carrera.list()}" optionKey="id"
						required="" value="${claseInstance?.carrera?.id}"
						onchange="${remoteFunction(action: 'actualizarGrupos2',
                       update: 'combogrupo',
                       params: '\'carrera=\' + this.value+\'&ciclo=\' + ciclo.value')}" />
				</div>
				<g:render template="comboGrupo2" />
				
				
				------------------------------------------------------------------------------------------------
				
				<div
					class="fieldcontain ${hasErrors(bean: claseInstance, field: 'ciclo', 'error')} required">
					<label for="cicloasi"> <g:message code="clase.ciclo.label"
							default="Ciclo" /> <!--<span class="required-indicator">*</span>-->
					</label>
					<g:select id="cicloasi" name="ciclo.id"
						from="${com.ulsa.evaluacion.Ciclo.list()}" optionKey="id"
						required="" value="${claseInstance?.ciclo?.id}" 
						onchange="${remoteFunction(action: 'actualizarGrupos3',
                       update: 'combogrupoasi',
                       params: '\'ciclo=\' + this.value+\'&carrera=\' + carreraasi.value')}" />
				</div>


				<div class="fieldcontain">
					<label for="carreraasi"> <g:message code="clase.carrera.label"
							default="Carrera" /> <!--<span class="required-indicator">*</span>-->
					</label>
					<g:select id="carreraasi" name="carrera.id"
						noSelection="['':'Seleccione una carrera']"
						from="${com.ulsa.evaluacion.Carrera.list()}" optionKey="id"
						required="" value="${claseInstance?.carrera?.id}"
						onchange="${remoteFunction(action: 'actualizarGrupos3',
                       update: 'combogrupoasi',
                       params: '\'carrera=\' + this.value+\'&ciclo=\' + cicloasi.value')}" />
				</div>
				
				<g:render template="comboGrupoasi" />
				
				 <g:render template="msAlumnos" />
				
			</fieldset>

			<fieldset class="buttons">
				<g:submitButton name="create" class="save" value="Asignar" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>