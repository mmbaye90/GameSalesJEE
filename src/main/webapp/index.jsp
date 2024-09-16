<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="CSS/index.css">
</head>
<body>
   
   <%-- <jsp:include page="header.jsp" /> --%>
   <c:import url="./Header"></c:import>
     
   <!-- ==================================================== -->
	<h1 class="text-white text-center my-3">Liste des Jeux</h1>
	<section class ="container" style="display:flex;flex-wrap:wrap; justify-content: center">
		  <c:forEach var="j" items="${jeuxAvecPhoto}">
		  
				<div class="card rounded-pill text-center overflow-hidden border-0 shadow m-4" style="max-width: 18rem;">
					  
						  <img src="${j.url_media }" class="card-img-top" alt="...">
						  <div class="card-body bg-dark text-white">						  	
							    <h5 
							    	class="card-title fw-bold text-white"
							    	style=
							    	"
							    		 white-space: nowrap;
    									 overflow: hidden;
    									 text-overflow: ellipsis;
							    	"
							    >
							    	${j.jeu.titre}
							    </h5>
							    <p 
							    	class="card-text"
							    	style=
							    	"
							    		 white-space: nowrap;
    									 overflow: hidden;
    									 text-overflow: ellipsis;
							    	"
							    	>
							    	${j.jeu.resume}
							    </p>
							    <a href=
							    
							    "
							    	<c:url value ="/DetailProduit">
							    		<c:param name='idJeux' value='${j.jeu.id_jeux }'/>
							    	</c:url>
							    "
							    class="btn btn-light px-3 rounded-pill text-black">
							    	View Game
								    </a>
							    <p class="mt-3">$${j.jeu.prix}</p>							
						  </div>
					  
				</div>
		    </c:forEach>
    </section>


<!-- 	================== POPULAIRE COMPONENT ====== -->
	<h1 class="text-center text-white my-3">Les plus populaires</h1>
	
	<c:choose>
        <c:when test="${not empty sessionScope.jeuxPop}">
            <jsp:include page="populaire.jsp" />     
        </c:when>
        <c:otherwise>
            <h3 class="text-danger text-center">Aucun jeu populaire pour le moment</h3>
        </c:otherwise>
    </c:choose>
 
      
<!--      ======================== Component Footer ========  --> 
        <%-- <c:import url="Footer"></c:import> --%>
   <jsp:include page="footer.jsp" />

 <script defer>

    </script>
</body>
</html>
