<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Cart</title>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="CSS/panier.css">
</head>

<body class="bg-dark text-white">
	
	<c:import url="Header"></c:import>
	
    <div class="container my-5">
        <h2 class="text-center mb-4 text-white">Recapitulatif du Panier</h2>
        <div class="table-responsive">
            <table class="table table-striped table-hover text-white">
                <thead class="thead-light bg-primary text-white">
                    <tr>
                        <th scope="col">Image</th>
                        <th scope="col">Titre</th>
                        <th scope="col">Langue</th>
                        <th scope="col">Date sortie</th>
                        <th scope="col">Prix</th>
                        <th scope="col">Quantité</th>
                        <th scope="col">Sub Total</th>
                        <th scope="col">Supprimer</th>
                    </tr>
                </thead>
                <tbody>
                
                	<c:if test="${not empty articles}">
                		<c:forEach var="p" items="${articles}">
                		<%-- <c:set var="photoUrl" value="${photosMap[p.jeux.id_jeux]}" /> --%>
		                    <tr>
		                        <td>
		                        	<img 
		                        		src="${photosMap[p.jeux.id_jeux]}" 
		                        		alt="${p.jeux.titre}"
		                        		class="img-thumbnail"
		                        		style=" height: 3.5rem; width: 6rem;"
		                        	>
		                        </td>
		                        <td>${p.jeux.titre}</td>
		                        <td>${p.jeux.langue}</td>
		                        <td>${p.jeux.date_sortie }</td>
		                        <td>$${p.jeux.prix}</td>
		                        <td>${p.qte}</td>
		                        <td>
		                        	${ p.qte*p.jeux.prix} $
									<!--  <div class="input-group quantity-group">
		                                <button class="btn btn-outline-secondary" type="button" onclick="decreaseQuantity(this)">-</button>
		                                <input type="text" class="form-control text-center quantity-input" value="1">
		                                <button class="btn btn-outline-secondary" type="button" onclick="increaseQuantity(this)">+</button>
		                            </div> -->
		                        </td>
		              			<td>
								    
								    <a class="btn btn-danger" href=
								    "
								    	<c:url  value="Panier">
								        	<c:param name="idToTrash" value="${p.jeux.id_jeux}" />
								    	</c:url>
								    ">
								        Supprimer
								    </a>
								</td>
		                    </tr>
		                  </c:forEach>
					    </c:if>
					    <c:if test="${empty articles}">
					        <td class="text-danger mt-3">Votre panier est vide.</td>
					    </c:if>
                </tbody>
            </table>
        </div>

        <div class="d-flex justify-content-between align-items-center mt-4">
            <h4 class="text-white">Total: <span id="totalPrice"class="text-white">$${tot}</span></h4>
            <a 
            	class="btn btn-success" 
            	href="Panier?btn=validationCommande"
             >
             	Valider la commande
            </a>
        </div>
    </div>


	<jsp:include page="footer.jsp" />
	
	
<script>

</script>
	
</body>

</html>
