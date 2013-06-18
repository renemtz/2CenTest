<br>
<br>

<div id="divAlumnos">
	<g:if test="${alumnos}">
		<script language="Javascript">
			function SelectMoveRows(SS1, SS2) {
				var SelID = '';
				var SelText = '';
				// Move rows from SS1 to SS2 from bottom to top
				for (i = SS1.options.length - 1; i >= 0; i--) {
					if (SS1.options[i].selected == true) {
						SelID = SS1.options[i].value;
						SelText = SS1.options[i].text;
						var newRow = new Option(SelText, SelID);
						SS2.options[SS2.length] = newRow;
						SS1.options[i] = null;
					}
				}
				SelectSort(SS2);
			}
			function SelectSort(SelList) {
				var ID = '';
				var Text = '';
				for (x = 0; x < SelList.length - 1; x++) {
					for (y = x + 1; y < SelList.length; y++) {
						if (SelList[x].text > SelList[y].text) {
							// Swap rows
							ID = SelList[x].value;
							Text = SelList[x].text;
							SelList[x].value = SelList[y].value;
							SelList[x].text = SelList[y].text;
							SelList[y].value = ID;
							SelList[y].text = Text;
						}
					}
				}
			}
		</script>
		<form name="Example" method="get" action="hola.php">
			<table border="0" cellpadding="3" cellspacing="0">
				<tr>
					<td><select name="Features" size="9" MULTIPLE>
						<g:each var="alumno" in="${alumnos}">
						
							<option value="${alumno.id}">${alumno.matricula}</option>
						</g:each>
					</select></td>
					<td align="center" valign="middle"><input type="Button"
						value="Add >>" style="width: 100px"
						onClick="SelectMoveRows(document.Example.Features,document.Example.FeatureCodes)"><br>
						<br> <input type="Button" value="<< Remove"
						style="width: 100px"
						onClick="SelectMoveRows(document.Example.FeatureCodes,document.Example.Features)">
					</td>
					<td><select name="FeatureCodes" size="9" MULTIPLE>
							<g:each var="alumnoInscrito" in="${alumnosInscritos}">
						
							<option value="${alumnoInscrito.id}">${alumnoInscrito.matricula}</option>
						</g:each>
					</select></td>
				</tr>
			</table>
			<input type="submit" id="enviar" name="enviar" value="terminar">
		</form>






	</g:if>
</div>