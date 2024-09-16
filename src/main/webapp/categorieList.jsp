<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <style >
    

.cards-container {
  width: 100%;
  max-width: 800px;
  height: 500px;
  display: flex;
  justify-content: center;
  align-items: stretch;
  gap: 1.25rem;
  transition: all 400ms;
}

.expandable-card {
  flex: 1;
  height: 100%;
  transition: all 400ms;
  cursor: pointer;
  gap:1;
  
}
.expandable-card > img {
  display: block;
  max-width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius:16px;
}

.expandable-card:nth-child(odd) {
  translate: 0 -20px;
}
.expandable-card:nth-child(even) {
  translate: 0 20px;
}

.cards-container .expandable-card:not(:hover) {
  filter: grayscale(100%);
}
.expandable-card:hover {
  flex: 4;
  gap:1;
}
    </style>
</head>
<body style="background-color: #051215;">
	<c:import url="Header"></c:import>
    <div class="my-5 container">
     	<c:if test="${empty jeuxParCategorie}">
            <p style="color: white; text-align: center;">Aucun jeu ne correspond à cette catégorie sélectionnée</p>
        </c:if>
        <div class="cards-container">
            <c:forEach var="jeu" items="${jeuxParCategorie}">
                <a class="expandable-card" href="DetailProduit?idJeux=${jeu.id_jeux}">
                    <img src="${photosMap[jeu.id_jeux]}" alt="Photo du jeu ${jeu.titre}">
                </a>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
