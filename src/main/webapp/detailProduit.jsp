<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeailProduit</title>
	<link rel="stylesheet" href="CSS/detailProduit.css">
	<script defer src="JS/detailProduit.js"></script>
</head>
<body>

<!-- ========================== HEADER ============= -->
	<%-- <c:import url="Header"></c:import> --%>
	<c:import url="Header"></c:import>
	<%-- <jsp:include page="header.jsp" /> --%>
	
	
	<h1 class="text-white">Detail du produit : <span class ="text-success">${obj.titre}</span></h1>
    <div class="product-container">
        <!-- Section pour l'image principale et les images miniatures -->
        <div class="image-section">
            <div class="main-image-zoom">
                <img id="main-image" src="${onePhoto}" alt="Image principale"
                    style="width: 100%; height: 100%; object-fit: cover;">
            </div>
            <div class="thumbnails">
            	<c:forEach var= "ph" items="${listPhotos}">
	                <img src="${ph}"
	                    alt="Image 1" onclick="changeImage(this.src)">
                </c:forEach>
                <!-- Conteneur pour la miniature de la vidéo -->
                <div class="video-thumbnail" onclick="changeImage('${video.url_video}', true)">
                    <img src="https://via.placeholder.com/100" alt="Video">
                    <img src="https://cdn-icons-png.flaticon.com/512/727/727245.png" alt="Play Icon" class="play-icon">
                </div>
            </div>
        </div>

        <!-- Section pour la description du produit -->
        <div class="details-section">
            <h3 class="text-white text-center">${obj.titre}</h3>
            <p class="product-description text-white">
            	${obj.resume}
            </p>

            <div class="product-controls">
                <div class="quantity-controls">
                    <button onclick="decreaseQuantity()">-</button>
                    <span id="quantity"  class="text-white">1</span>                                       
                    <button onclick="increaseQuantity()">+</button>
                </div>
                <div class="price-rating">
                    <span class="price text-white mt-4">$${obj.prix }</span>
                    <span class="rating">★★★★☆</span>
                </div>
            </div>

            <div class="release-date">
                <span class="date">Sortie: 01 Janvier 2024</span>
            </div>

            <!-- Bouton Ajouter au panier -->
            <button class="add-to-cart-btn" id="btnAddToCart">Ajouter au panier</button>
        </div>
    </div>
    
    <hr>
    
    <section class="main">    	
    	<jsp:include page="recommande.jsp" />
    </section>
    
    
	
	<%-- <c:import url="Footer"></c:import> --%>
	<%--<jsp:include page="footer.jsp" />--%>
	
	
	
 <script>

			const btnaddCart = document.getElementById("btnAddToCart");
			
			
		    function generateStars(rating) {
		        const maxStars = 5;
		        let starsHTML = '';
		      
		        for (let i = 0; i < Math.floor(rating); i++) {
		          starsHTML += '<span class="star full">★</span>';
		        }
		      
		        if (rating % 1 !== 0) {
		          starsHTML += '<span class="star half">★</span>';
		        }
		      
		        for (let i = Math.ceil(rating); i < maxStars; i++) {
		          starsHTML += '<span class="star empty">★</span>';
		        }
		      
		        return starsHTML;
		      }
		
		    
		    function displayProductDetails() {
		        const productRating = ${note}; // Inserer la  note ici
		        const ratingElement = document.querySelector('.rating');
		        ratingElement.innerHTML = generateStars(productRating);
		    }
		
		    
		    function addToCart() {
		        const quantity = document.getElementById('quantity').textContent;

		        // Récupère l'URL actuelle
		        let currentUrl = window.location.href;
		        const url = new URL(currentUrl);

		        // Vérifie si le paramètre 'quantity' existe déjà
		        if (url.searchParams.has('quantity')) {
		            // Si oui, on remplace sa valeur par la nouvelle
		            url.searchParams.set('quantity', quantity);
		        } else {
		            // Sinon, on l'ajoute à l'URL
		            url.searchParams.append('quantity', quantity);
		        }

		        // Redirige vers la nouvelle URL avec le paramètre quantity mis à jour
		        window.location.href = url.toString();
		    }

		
		     btnaddCart.addEventListener('click', addToCart);
		  
		        document.addEventListener('DOMContentLoaded', displayProductDetails);
		        displayProductDetails();
        
    </script>
</body>
</html>