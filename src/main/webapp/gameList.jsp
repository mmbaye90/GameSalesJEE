<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="CSS/gameList.css">
    <script type="text/javascript" defer src="JS/gameList.js"></script>
</head>
<body>
    <c:import url="Header"></c:import>
    
    <section class="container containerProducts">
        <div class="products">
            <a href="#" class="product text-white" onclick="openModal()">
                <img src="https://i.imgur.com/WwkgPd5.jpg">
                <h1>Metin2 Refine Window</h1>
                <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span>
                <div class="price">PRICE: $199</div>
            </a>
            
            <a href="#" class="product text-white" onclick="openModal()">
                <img src="https://i.imgur.com/WwkgPd5.jpg">
                <h1>Metin2 Refine Window</h1>
                <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span>
                <div class="price">PRICE: $199</div>
            </a>
            
            <a href="#" class="product text-white" onclick="openModal()">
                <img src="https://i.imgur.com/WwkgPd5.jpg">
                <h1>Metin2 Refine Window</h1>
                <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span>
                <div class="price">PRICE: $199</div>
            </a>
        </div>
    </section>

    <!-- Modal Section -->
    <section id="commentModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Ajouter un commentaire</h2>
            <textarea id="commentText" placeholder="Écrivez votre commentaire ici..."></textarea>
            <button onclick="submitComment()">Envoyer</button>
        </div>
    </section>
    
    
      <!-- Comment Section -->
    <section class="container my-4 ">
    <h1 class="text-white text-center">Liste des commentaires</h1>
      <div class="conatainerComment my-3">
    	<div class="containerPicName">
    		<p> 
    			<img src="https://cdn.pixabay.com/photo/2016/10/27/14/23/old-man-1775239_1280.jpg"/>
    		</p>
    		<h3 class="mx-3 text-white">Prenom Nom</h3>
    	</div>
    	<p class="msgCommentaire text-white my-1">
		    Lorem ipsum dolor sit amet consectetur, adipisicing elit. 
		    Facere et id perspiciatis eius quo, vitae at odit atque 
		    pariatur beatae nam omnis enim? Voluptate minus quod tempore 
		    quae vero officia maiores soluta repellendus voluptatum veniam! 
		    Odit repellat, optio minus cumque ea quasi blanditiis,
		     necessitatibus tempore fuga provident, similique quia! Nulla.
		</p>
	</div>
	
	 <div class="conatainerComment">
    	<div class="containerPicName">
    		<p> 
    			<img src="https://cdn.pixabay.com/photo/2016/10/27/14/23/old-man-1775239_1280.jpg"/>
    		</p>
    		<h3 class="mx-3 text-white">Prenom Nom</h3>
    	</div>
    	<p class="msgCommentaire text-white my-1">
		    Lorem ipsum dolor sit amet consectetur, adipisicing elit. 
		    Facere et id perspiciatis eius quo, vitae at odit atque 
		    pariatur beatae nam omnis enim? Voluptate minus quod tempore 
		    quae vero officia maiores soluta repellendus voluptatum veniam! 
		    Odit repellat, optio minus cumque ea quasi blanditiis,
		     necessitatibus tempore fuga provident, similique quia! Nulla.
		</p>
	</div>
    </section>

    <c:import url="Footer"></c:import>

</body>
</html>
