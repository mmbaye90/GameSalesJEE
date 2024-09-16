<link rel="stylesheet"href="CSS/populaire.css">
<div class="section">
	<c:forEach var="jeu" items="${sessionScope.jeuxPop}">
	    <a href=
	    	"
	    		<c:url value = "DetailProduit">
	    		<c:param name='idJeux' value='${jeu.id_jeux }'/>
	    		</c:url>
	    	" 
	    	class="interactable" data-open="false" style="margin:2.5rem;">
	        <img
	            src="${jeu.url_photo}">
	        <p>
	            <div class="contenudesc">
	                ${jeu.resume}	                
	            </div>
	        </p>
	    </a>
	</c:forEach>
</div>
