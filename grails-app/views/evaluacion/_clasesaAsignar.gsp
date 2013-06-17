<div id="wrapper"> 

    <form action="index.html">
    <select id="countries" class="multiselect" multiple="multiple" name="countries[]">
    <g:each var="clase" in="${clases}">
    	<option value="${clase.id}">${clase.materia.nombre}</option>
	</g:each>
      
        <option value="AFG">Afghanistan</option>
        <option value="ALB">Albania</option>
        <option value="DZA">Algeria</option>
        <option value="AND">Andorra</option>
        <option value="ARG">Argentina</option>
        <option value="ARM">Armenia</option>
        <option value="ABW">Aruba</option>
        <option value="AUS">Australia</option>
        <option value="AUT" selected="selected">Austria</option>
      </select>
      <br/>
      <input type="submit" value="Submit Form"/>
    </form>
    
    <script type="text/javascript"
      src="http://jqueryui.com/themeroller/themeswitchertool/">
    </script>
    <div id="switcher"></div>
    
</div>