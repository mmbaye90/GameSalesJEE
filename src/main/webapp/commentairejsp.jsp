<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Commentaires</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    body {
        background: url('https://i.postimg.cc/XYjWrv36/dark-hexagonal-background-with-gradient-color-79603-1409.jpg') no-repeat;
        background-size: cover;
    }
    .card-img-top {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }
</style>
</head>
<body>
	<c:import url="Header"></c:import>
    <section class="container my-4" style="display: flex;flex-wrap: wrap;width: 100%;gap:2rem;justify-content:center;padding: 1rem;">
        <c:forEach var="commentaire" items="${commentairesJeuxUtilisateurs}">
            <div class="card" style="width: 20rem;">
                <img src="${commentaire.jeuPhoto}" class="card-img-top" alt="Photo du jeu ${commentaire.jeuTitre}">
                <div class="card-body">			 
                    <div style="display: flex;justify-content: space-between;align-items: center;">
                        <img src="${commentaire.utilisateurImage}" alt="Photo de ${commentaire.utilisateurNom}" style="height: 4rem;width: 4rem;border-radius: 50%">
                        <h5 class="card-title">${commentaire.utilisateurNom}</h5>
                        <p>
                            <c:choose>
                                <c:when test="${commentaire.statutCom}">
                                    <!-- Pouce en haut si statut est vrai -->
                                    <p class="text-success"><i class="fa-solid fa-thumbs-up"></i></p>
                                </c:when>
                                <c:otherwise>
                                    <!-- Pouce en bas si statut est faux -->
                                    <p class="text-danger"><i class="fa-solid fa-thumbs-down"></i></p>
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>  
                    <p class="card-text">${commentaire.contenu}</p>
                    <!-- Bouton pour ouvrir le modal Caché si user non connecté-->
                       		<c:choose>
			<c:when test="${not empty sessionScope.user }">
				    <button class="btn btn-primary" onclick="openCommentModal(${commentaire.idCommentaire})">
                        Ajouter un commentaire
                    </button>
			</c:when>
			<c:otherwise>
				<a class="btn btn-primary" href="LogReg">
                        Log to comment
                </a>
			</c:otherwise>
		</c:choose>

                </div>
            </div>
        </c:forEach>
    </section>

    <!-- ==========================Modal HTML -->
    <div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="commentModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="commentModalLabel">Ajouter un Commentaire</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="CommentaireServlet" method="get">
                    <div class="modal-body">
                        <input type="hidden" name="id_jeux" value="${ commentaire.idJeux}" id="modalIdCommentaire">
                       <%--  <input type="hidden" name="id_user" value="${l'id du user à inserer}" id="modalIdCommentaire"> --%>
                        <div class="form-group">
                            <label for="commentaireContenu">Contenu du Commentaire</label>
                            <textarea class="form-control" id="commentaireContenu" name="contenu" rows="3" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                        <button type="submit" class="btn btn-primary">Ajouter Commentaire</button>
                    </div>
                    
                     <div class="form-group">
			            <label for="noteJeu">Évaluation du jeu (1 à 5)</label>
			            <select class="form-control" id="noteJeu" name="noteJeu" required>
			                <option value="" disabled selected>Choisissez une note</option>
			                <option value="1">1 </option>
			                <option value="2">2</option>
			                <option value="3">3</option>
			                <option value="4">4</option>
			                <option value="5">5 </option>
			            </select>
        			</div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function openCommentModal(idCommentaire) {
            // Remplir le champ caché avec l'id du commentaire
            document.getElementById('modalIdCommentaire').value = idCommentaire;

            // Ouvrir le modal
            $('#commentModal').modal('show');
        }
    </script>
</body>
</html>
