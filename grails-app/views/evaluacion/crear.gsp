<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Productos</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	
<script>
	var nopreguntas=0;

	function agregar() {
		var valor="";
		nopreguntas=nopreguntas+1;
		var aux;
		var bandera=0;

		for (var i=1;i<=nopreguntas;i++)
		{	
			
			if (i==nopreguntas)
			{
				valor = valor + 
				"<div id='cont"+i+"' name='cont"+i+"'>"+
			"<input id='p"+i+"' name='p"+i+"' type='text' value=''>"+
			"<input id='e"+i+"' type='button' value='X' onclick='eliminar("+i+");'><br>"+	
				"</div>";
			}
			else
			{
				aux=$("#p"+i).val();
				if(aux==""){
					bandera = 1;
				}else{
					if (aux!=undefined){
						valor = valor + 
					"<div id='cont"+i+"' name='cont"+i+"'>"+
				"<input id='p"+i+"' name='p"+i+"' type='text' value='"+aux+"'>"+
				"<input id='e"+i+"' type='button' value='X' onclick='eliminar("+i+");'><br>"+	
					"</div>";
					}
				}
			}
		}
		if (bandera==1){
			alert("no puede haber campos vacios");
		}else{
			$("#contenedor").html(valor);
		}
		
	}

	
	function eliminar(id){
		$("#cont"+id).remove();
	}
	
</script>
	<link rel="stylesheet" type="text/css" href="estilo.css" />
</head>
<body>
<form method="post" action="asdas.ass">
Clave: <input type="text" name="clave"><br>
Nombre: <input type="text" name="nombre"><br>
Descripción: <textarea id="txtArea" rows="5" cols="40"></textarea><br>
<br>
Preguntas
<div id="contenedor" name="contenedor" class="preguntas"></div>
<input type="button" onClick="agregar();" value="+"><br>
<input type="submit" value="Terminar">
</form>
</body>
</html>