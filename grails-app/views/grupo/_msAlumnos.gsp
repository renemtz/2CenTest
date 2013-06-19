<br>
<br>

<div id="alumnosD">
		
		
			<table border="0" cellpadding="3" cellspacing="0">
				<tr>
					<td><select id="Features" name="Features[]" size="9" MULTIPLE>
							<g:each var="alumno" in="${alumnos}">

								<option value="${alumno.id}">
									${alumno.matricula} 
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
							<g:each var="alumno" in="${alumnosasi}">

								<option value="${alumno.id}">
									${alumno.matricula}
								</option>
							</g:each>
					</select></td>
				</tr>
			</table>

</div>