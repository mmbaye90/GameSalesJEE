<head>
	<link rel="stylesheet"href="CSS/header1.css">
	<script defer src="JS/header1.js"></script>
</head>


<header class="header">
  <a href="<c:url value="Index"></c:url>" class="logo">Logo</a>

  <i class='bx bx-menu' id="menu-icon"></i>

  <nav class="navbar">
      <a href="<c:url value="Index"></c:url>">Home</a>
      
	  <a href="<c:url value="CommentaireServlet"></c:url>">Commentaires</a>
	  
      <a class="box">
          <input type="text" class="input" name="txt" >
          <i class="fas fa-search"></i>
      </a>
      <div class="dropdown-search">
          <ul class="shopping-cart-items">
          </ul>
      </div> <!--end shopping-cart-->


      <!-- ============================== -->
    <c:choose>
        <c:when test="${not empty userPhoto}">
        	<a href ="Profil?idUtilisateur=${userId}"class="text-white">
	            
	            <img src="${userPhoto}" alt="Photo de profil" 
	            	style="height: 2.5rem; width: 2.5rem; border-radius: 50%;margin: 0.5rem"
	            />
	            profil
	        </a>
        </c:when>
        <c:otherwise>
	        <a href = "#"class="text-white p-2">
	            <i class="fa-solid fa-user"></i>
	             profil
	        </a>
        </c:otherwise>
    </c:choose>
      
      <!-- =========================== -->
      <a href="#" id="categoriesBtn">Catégories 
          <i class="fa fa-caret-down dropdown-icon"></i>
      </a>
      <div class="dropdown-categorie">
          <ul class="shopping-cart-items">
          	 <c:forEach var="cat" items="${sessionScope.listeCat}">
	          	 <li class="clearfix" style="list-style-type: none">
				 	<a 
				 		href=
				 		"
				 			<c:url value ="/CategorieList">
							   <c:param name='idCat' value='${cat.id_categorie}'/>
							</c:url>
				 		" 
				 		class="categorie" 
				 	 	onmouseover="this.style.backgroundColor='red';"
           				onmouseout="this.style.backgroundColor='orangered';"
				 		style=
				 			"
				 				display: flex;
				 				justify-content:center;
								padding: 0.2rem;	
								color: white;
								width:60%;
								border-radius:0.4rem;
								background-color: orangered;
							"
					>
				 		${cat.genre}
				 	</a>	              	
	             </li>
          	 </c:forEach>
              
          </ul>
      </div> <!--end shopping-cart-->


      <!-- ============================== CART -->
  
      <div class="cart-container">
          <a href="#" id="cart" class="d-flex align-items-center position-relative">
              <!-- Bootstrap cart icon -->
              <i class="fa fa-shopping-cart cart-icon"></i>
              <!-- Badge -->
              
              <span class="badge bg-danger  rounded-circle">
                 ${longTabArt}
              </span>
          </a>
          <div class="shopping-cart" style="max-height: 300px; 
							overflow-y: auto;">
              <div class="shopping-cart-header">
                  <i class="fa fa-shopping-cart cart-icon"></i><span class="badge">${longTabArt}</span>
                   <div class="shopping-cart-total">
                      <span class="lighter-text">Total:</span>
                      <span class="main-color-text text-black">$${tot}</span>
                  </div>
              </div> 

              <ul class="shopping-cart-items">
                      <c:if test="${not empty articles}">
        				<c:forEach var="p" items="${articles}">
            				<li class="clearfix">
               					 <!-- Affiche l'image de l'article -->
                				<c:set var="photoUrl" value="${photosMap[p.jeux.id_jeux]}" />
                
					                
					                <img src="${photoUrl}" alt="${p.jeux.titre}" style="max-width: 25%"/>
					                <span class="item-name text-black">${p.jeux.titre}</span>
					                <span class="item-price text-black" >$${p.jeux.prix}</span>
					                <span class="item-quantity text-black">Quantité: ${p.qte}</span>
            				</li>
        				</c:forEach>
    				</c:if>
    <c:if test="${empty articles}">
        <li class="text-black">Votre panier est vide.</li>
    </c:if>
    </ul>
		<c:choose>
			<c:when test="${not empty sessionScope.user }">
				<a href="Panier" class="button">View Cart</a>
			</c:when>
			<c:otherwise>
				<a href="LogReg" class="button">Login</a>
			</c:otherwise>
		</c:choose>
         
    </div> <!--end shopping-cart-->
      </div> <!--end cart-container-->
      		<c:choose>
			<c:when test="${not empty sessionScope.user }">
				<a href=
						"<c:url value ="Header">
							<c:param name ='btnLogout' value = "btnLog"/>
						</c:url>
					"
				>
					<i class="fa-solid fa-right-from-bracket" style="color: orangered;"></i>
						 logout
			   </a>
			</c:when>
			<c:otherwise>
				<a href="LogReg">
				
				 	<i class="fa-solid fa-anchor" style="color: orangered;"></i>
				 	login
				 </a>
			</c:otherwise>
		</c:choose>
      

  </nav>
</header>

