<!DOCTYPE html>
<html>
  <head>
  	<meta name="layout" content="main">
    <meta charset='UTF-8'>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'estilo.css')}" type="text/css">
<title>Login</title>
</head>



<body>
	<div class="container">
	  <div class="login">
	    <h1>Login</h1>
	    <form method="post" action="verificarUsuario">
	      <p><input type="text" name="login" value="" placeholder="Usuario"></p>
	      <p><input type="password" name="password" value="" placeholder="Contraseña"></p>
	      <p class="remember_me">
	       
	      </p>
	      <p class="submit"><input type="submit" name="commit" value="Login"></p>
	    </form>
	  </div>
	  <g:if test="${session.error}">
	  		${session.error}
	  </g:if>
	 
	  <div class="login-help">
	    <p>Olvidaste tu contraseña? <a href="#">Click aqui para resetear</a>.</p>
	  </div>
	</div>
</body>
</html>