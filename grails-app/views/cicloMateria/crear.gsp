<%@ page import="com.ulsa.evaluacion.CicloMateria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cicloMateria.label', default: 'CicloMateria')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
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
		<a href="#create-cicloMateria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-cicloMateria" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${cicloMateriaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${cicloMateriaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" name="Example" id="Example" action="asignarCicloMateria" onsubmit="selecciona('FeatureCodes')" >
				<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: cicloMateriaInstance, field: 'ciclos', 'error')} required">
					<label for="ciclos"> <g:message
							code="cicloMateria.ciclos.label" default="Ciclos" /> <span
						class="required-indicator">*</span>
					</label>
					<g:select id="ciclos" name="ciclos.id"
						noSelection="['':'Seleccione un ciclo']"
						from="${com.ulsa.evaluacion.Ciclo.list()}" optionKey="id"
						required="" value="${cicloMateriaInstance?.ciclos?.id}"
						class="many-to-one" />
				</div>
				<div
					class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'carrera', 'error')} required">
					<label for="carrera"> <g:message
							code="materia.carrera.label" default="Carrera" /> <span
						class="required-indicator">*</span>
					</label>
					<g:select id="carrera" name="carrera.id"
						noSelection="['':'Seleccione una carrera']"
						from="${com.ulsa.evaluacion.Carrera.list()}" optionKey="id"
						required="" value="${materiaInstance?.carrera?.id}"
						class="many-to-one"
						onchange="${remoteFunction(action: 'actualizarMaterias',
                       update: 'materias',
                       params: '\'carrera=\' + this.value+\'&ciclo=\' + ciclos.value')}"/>
				</div>
				<g:render template="msMaterias" />
				
			</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Asignar" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>