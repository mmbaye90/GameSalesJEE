 <link rel="stylesheet" href="CSS/recommande.css">
<h1 class="text-center my-3 text-white">Jeux recommandés</h1>
<div class="wrapper">
	<c:choose>	
	
	        <c:when test="${not empty sessionScope.jeuxRecom}">
	              		<c:forEach var = "r" items="${sessionScope.jeuxRecom}">
							    <div class="card">
									
									        <div class="face front">
									            <img src="${r.url_photo}"
									                alt="city">
									            <h1 class="text-h1">${r.titre}</h1>
									        </div>
									
									        <div class="face back">
									            <h2 class="text-h2">${r.titre}</h2>
									            <p class="text-p">
									                ${r.resume}
									            </p>
									            <div class="links">
									                <a class="link-a" href=
									                	"
									                		<c:url value ="/DetailProduit">
							    								<c:param name='idJeux' value='${r.id_jeux }'/>
							    							</c:url>
									                	"
									                >
									                	View Game
									                </a>
									            </div>
									        </div>
								   
							     </div>
							</c:forEach> 
	        </c:when>
	        
        	<c:otherwise>
            	<h3 class="text-danger text-center">Pas de jeux recommandés !!!</h3>
        	</c:otherwise>
    </c:choose>

 
</div>