<br>
<br>

<div id="clasesaasignar">
		
		
			<table border="0" cellpadding="3" cellspacing="0">
				<tr>
					<td><select id="Features" name="Features[]" size="9" MULTIPLE>
							<g:each var="clase" in="${clases}">

								<option value="${clase.id}">
									${clase.materia.nombre}
								</option>
							</g:each>
					</select></td>
					<td align="center" valign="middle"><input type="Button"
						value="Agregar >>" style="width: 100px"
						onClick="SelectMoveRows(document.Example.Features,document.Example.FeatureCodes)"><br>
						<br> <input type="Button" value="<< Quitar"
						style="width: 100px"
						onClick="SelectMoveRows(document.Example.FeatureCodes,document.Example.Features)">
					</td>
					<td><select id="FeatureCodes" name="FeatureCodes[]" size="9" MULTIPLE>
							<g:each var="clase" in="${clasesas}">

								<option value="${clase.id}">
									${clase.materia.nombre}
								</option>
							</g:each>
					</select></td>
				</tr>
			</table>

</div>