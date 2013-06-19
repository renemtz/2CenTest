<br>
<br>

<div id="materias">
		
		
			<table border="0" cellpadding="3" cellspacing="0">
				<tr>
					<td><select id="Features" name="Features[]" size="9" MULTIPLE>
							<g:each var="ciclomateria" in="${ciclomaterias}">

								<option value="${ciclomateria.id}">
									${ciclomateria.nombre}
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
							<g:each var="materiasa" in="${materiasas}">

								<option value="${materiasa.id}">
									${materiasa.nombre}
								</option>
							</g:each>
					</select></td>
				</tr>
			</table>

</div>