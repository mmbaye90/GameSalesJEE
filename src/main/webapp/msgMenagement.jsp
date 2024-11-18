<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tableau avec Modals et Pagination</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css1/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css1/style.css" rel="stylesheet">

<style>
/* CSS de la page comme précédemment */
</style>
</head>

<body>
	<div class="container-fluid position-relative d-flex p-0">
		<!--         <div id="spinner"
            class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div> -->

		<!-- Sidebar Start -->
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-secondary navbar-dark">
				<a href="Index" class="navbar-brand mx-4 mb-3">
					<h3 class="text-primary">
						<i class="fa fa-user-edit me-2"></i>MM
					</h3>
				</a>
				<div class="d-flex align-items-center ms-4 mb-4">
					<div class="position-relative">
						<img class="rounded-circle" src="img/user.jpg" alt=""
							style="width: 40px; height: 40px;">
						<div
							class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
						</div>
					</div>
					<div class="ms-3">
						<h6 class="mb-0">Jhon Doe</h6>
						<span>Admin</span>
					</div>
				</div>
				<div class="navbar-nav w-100">
					<a href='<c:url value = "Dashboard"></c:url>'
						class="nav-item nav-link active"><i
						class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle nav-item nav-link"
							data-bs-toggle="dropdown"> <i class="fa fa-users me-2"></i>Gestion
							Users
						</a>
						<div
							class="dropdown-menu bg-transparent border-0 nav-item nav-link">
							<a href='<c:url value = "UsersMenagement"></c:url>'
								class="dropdown-item ">MenUsers</a>
						</div>
					</div>
					>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Gestion
							Jeux</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href='<c:url value = "JeuxMenagement"></c:url>'
								class="dropdown-item">Jeux Men</a>
						</div>
					</div>

					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"><i
							class="fa-regular fa-envelope me-2"></i> Gestion Msg </a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href='<c:url value = "MsgMenagement"></c:url>'
								class="dropdown-item">Msg Men</a>
						</div>
					</div>
				</div>
			</nav>
		</div>
		<!-- Sidebar End -->


		<div class="content">
			<!-- Navbar Start -->
			<nav
				class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
				<a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
					<h2 class="text-primary mb-0">
						<i class="fa fa-user-edit"></i>
					</h2>
				</a> <a href="#" class="sidebar-toggler flex-shrink-0"> <i
					class="fa fa-bars"></i>
				</a>
				<form class="d-none d-md-flex ms-4">
					<input class="form-control bg-dark border-0" type="search"
						placeholder="Search">
				</form>
				<div class="navbar-nav align-items-center ms-auto">
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fa fa-envelope me-lg-2"></i>
							<span class="d-none d-lg-inline-flex">Message</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
							<a href="#" class="dropdown-item">
								<div class="d-flex align-items-center">
									<img class="rounded-circle" src="img/user.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="ms-2">
										<h6 class="fw-normal mb-0">Jhon send you a message</h6>
										<small>15 minutes ago</small>
									</div>
								</div>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<div class="d-flex align-items-center">
									<img class="rounded-circle" src="img/user.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="ms-2">
										<h6 class="fw-normal mb-0">Jhon send you a message</h6>
										<small>15 minutes ago</small>
									</div>
								</div>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<div class="d-flex align-items-center">
									<img class="rounded-circle" src="img/user.jpg" alt=""
										style="width: 40px; height: 40px;">
									<div class="ms-2">
										<h6 class="fw-normal mb-0">Jhon send you a message</h6>
										<small>15 minutes ago</small>
									</div>
								</div>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item text-center">See all message</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <i class="fa fa-bell me-lg-2"></i>
							<span class="d-none d-lg-inline-flex">Notificatin</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">Profile updated</h6> <small>15
									minutes ago</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">New user added</h6> <small>15
									minutes ago</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item">
								<h6 class="fw-normal mb-0">Password changed</h6> <small>15
									minutes ago</small>
							</a>
							<hr class="dropdown-divider">
							<a href="#" class="dropdown-item text-center">See all
								notifications</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"> <img
							class="rounded-circle me-lg-2" src="img/user.jpg" alt=""
							style="width: 40px; height: 40px;"> <span
							class="d-none d-lg-inline-flex">John Doe</span>
						</a>
						<div
							class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
							<a href="#" class="dropdown-item">My Profile</a> <a href="#"
								class="dropdown-item">Settings</a> <a href="#"
								class="dropdown-item">Log Out</a>
						</div>
					</div>
				</div>
			</nav>
			<!-- Navbar End -->
			<h1 class="text-white text-center m-3">Message Menagement</h1>
			<div class="container my-5">
				<div class="search-container">
					<div>
						<input type="text" id="searchInput" placeholder="Recherche...">
						<select id="pageSizeSelect">
							<option value="5">5 lignes par page</option>
							<option value="10" selected>10 lignes par page</option>
							<option value="20">20 lignes par page</option>
						</select>
					</div>
					<!-- <button id="addButton">
						<i class="fas fa-plus"></i> Ajouter
					</button> -->
				</div>

				<div class="table-responsive">
					<table id="dataTable" class="table table-striped">
						<thead>
							<tr>
								<th class="text-white">PicUser</th>
								<th class="text-white">PicGame</th>
								<th class="text-white">Comm</th>
								<th class="text-white">Accepté</th>
								<th class="text-center text-white">Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${commentaires}">
								<tr>
									<td style="display: flex;flex-direction: column;">
										<img class="rounded-circle" src="${c.utilisateurImage}"
										alt="User Pic" style="width: 2.5rem; height: 2.5rem;">
										<small>${c.utilisateurNom}</small>
									</td>
									
									<td >
										<img class="" src="${c.jeuPhoto}" alt="Game Pic"
										style="width: 2.5rem; height: 2.5rem;">
										<small>${c.jeuTitre}</small>
									</td>
									<td data-field="comm" style="max-width: 10rem; word-wrap: break-word; white-space: normal;">
										${c.contenu}
									</td>
									<td >
										<c:choose>
											<c:when test="${ c.acceptation}">
												<b class="text-white text-center">OUI</b>
											</c:when>
											<c:otherwise>
												<b class="text-white text-center">NON</b>
											</c:otherwise>
										</c:choose>
									</td>
									<td class="text-end">
										<button class="action-btn edit-btn" onclick="sendId(${c.idCommentaire })">
											<i class="fas fa-edit"></i>
										</button>
										<a 
											class="action-btn delete-btn"
											href=
											"
												<c:url value='MsgMenagement'>
													<c:param name='idToTrash' value ='${c.idCommentaire}'/>
												</c:url>
											"
										>
											<i class="fas fa-trash"></i>
										</a> 
										<a 
											class="action-btn text-success" 
											title="accepter"
											href =
											"
												<c:url value='MsgMenagement'>
													<c:param name='action' value ='accepter'/>
													<c:param name='idAccepte' value ='${c.idCommentaire}'/>
												</c:url>
											"
										> 
											<i class="fa-solid fa-circle-check"></i>
										</a> 
										<a 
											class="action-btn text-danger" 
											title="rejeter"
											href =
											"
												<c:url value='MsgMenagement'>
													<c:param name='action' value ='rejeter'/>
													<c:param name='idRejete' value ='${c.idCommentaire}'/>
												</c:url>
											"
										> 
											<i class="fa-solid fa-circle-xmark"></i>
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="pagination"></div>
			</div>

			<!-- Modal pour Ajouter -->
			<!-- <div id="addUserModal" class="modal m-4"
				style="display: none; max-height: 80vh; overflow-y: auto;">
				<div class="modal-content" style="margin-top: 10rem">
					<h2>Ajouter un Commentaire</h2>

					<form method="get">

						<div>
							<label for="addProductResume">Commentaire:</label>
							<textarea id="addProductResume" name="resume" rows="4"
								style="width: 100%; border-color: rgb(68, 73, 76); background-color: rgb(73, 78, 81); color: rgb(255, 255, 255);"></textarea>
						</div>

						<div>
							<button type="submit">Enregistrer</button>
							<button type="button" class="close">Annuler</button>
						</div>
					</form>
				</div>
			</div> -->




			<!-- Modal pour Modifier le Commentaire -->
			<div id="editCommentModal" class="modal m-4"
				style="display: none; max-height: 80vh; overflow-y: auto;">
				<div class="modal-content" style="margin-top: 10rem;">
					<h2>Modifier le Commentaire</h2>
					<form id="editCommentForm" method="get">
						<!-- INPUT CACHÉ CONTENANT L'ID DE L'OBJET À MODIFIER -->
						<input type="hidden" name="idToUpdate" id="commentId">
						
						<div>
							<label for="editCommentComm">Commentaire:</label>
							<textarea id="editCommentComm" name="contenu" rows="4"
								style="width: 100%;" required></textarea>
						</div>

						<div>
							<button type="submit">Enregistrer</button>
							<button type="button" class="close ">Annuler</button>
						</div>
					</form>
				</div>
			</div>


		</div>




	</div>
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="bi bi-arrow-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/chart/chart.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/tempusdominus/js/moment.min.js"></script>
	<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Template Javascript -->
	<script src="js1/main.js"></script>

	<script>
	document.addEventListener('DOMContentLoaded', () => {
	    const searchInput = document.querySelector('#searchInput');
	    const tableBody = document.querySelector('#dataTable tbody');
	    const paginationDiv = document.querySelector('.pagination');
	    const pageSizeSelect = document.querySelector('#pageSizeSelect');
	    const addUserModal = document.querySelector('#addUserModal');
	    const editCommentModal = document.querySelector('#editCommentModal'); // Corrigé : ID correct pour le modal d'édition
	    let currentPage = 1;
	    let pageSize = parseInt(pageSizeSelect.value);
	    let filteredRows = [];
	    let currentRow = null; // Variable pour la ligne en cours d'édition

	    // Fonction pour rendre la table avec la pagination
	    function renderTable() {
	        const searchTerm = searchInput.value.toLowerCase();
	        const rows = Array.from(tableBody.querySelectorAll('tr'));

	        filteredRows = rows.filter(row => {
	            const cells = Array.from(row.querySelectorAll('td'));
	            return cells.some(cell => cell.textContent.toLowerCase().includes(searchTerm));
	        });

            console.log('Filtered Rows:', filteredRows);
            if (filteredRows.length === 0) {
                console.warn('No rows found for the search term.');
            }

            renderPagination();
            updateTableDisplay();
	    }

	    // Fonction pour rendre la pagination
	    function renderPagination() {
	        paginationDiv.innerHTML = '';
	        const totalItems = filteredRows.length;
	        const totalPages = Math.ceil(totalItems / pageSize);

	        for (let i = 1; i <= totalPages; i++) {
	            const button = document.createElement('button');
	            button.textContent = i;
	            button.classList.add('page-btn');
	            if (i === currentPage) {
	                button.classList.add('active');
	            }
	            button.addEventListener('click', () => {
	                currentPage = i;
	                updateTableDisplay();
	            });
	            paginationDiv.appendChild(button);
	        }
	    }

	    // Fonction pour mettre à jour l'affichage de la table
	    	        function updateTableDisplay() {
	            if (!Array.isArray(filteredRows)) {
	                console.error('filteredRows is not an array:', filteredRows);
	                return;
	            }

	            const start = (currentPage - 1) * pageSize;
	            const end = start + pageSize;

	            // Masquer toutes les lignes du tableau
	            tableBody.querySelectorAll('tr').forEach(row => row.style.display = 'none');

	            // Afficher uniquement les lignes filtrées et paginées
	            filteredRows.forEach((row, index) => {
	                if (index >= start && index < end) {
	                    row.style.display = '';
	                }
	            });
	        }

	    // Gestion de l'événement de recherche
	    searchInput.addEventListener('input', () => {
	        currentPage = 1; // Réinitialiser à la première page lors de la recherche
	        renderTable();
	    });

	    // Gestion de la sélection de la taille de la page
	    pageSizeSelect.addEventListener('change', () => {
	        pageSize = parseInt(pageSizeSelect.value);
	        currentPage = 1; // Réinitialiser à la première page lors du changement de taille de page
	        renderTable();
	    });

	    // Gestion de l'ouverture du modal d'ajout
/* 	    document.querySelector('#addButton').addEventListener('click', () => {
	        addUserModal.style.display = 'flex';
	    }); */

	    // Fermeture des modals d'ajout et de modification
	    document.querySelectorAll('.modal-content .close').forEach(button => {
	        button.addEventListener('click', closeModals);
	    });

	    function closeModals() {
	        //addUserModal.style.display = 'none';
	        editCommentModal.style.display = 'none';
	    }

	    // Gestion pour les boutons "éditer" => remplissage des inputs du modal d'édition
	    document.querySelectorAll('.edit-btn').forEach(button => {
	        button.addEventListener('click', () => {
	            currentRow = button.closest('tr'); // Obtenir la ligne à éditer
	            //const name = currentRow.querySelector('td[data-field="name"]').textContent.trim();
	            const comm = currentRow.querySelector('td[data-field="comm"]').textContent.trim();

	            // Remplir les champs du formulaire avec les données récupérées
	            //document.querySelector('#editCommentName').value = name;
	            document.querySelector('#editCommentComm').value = comm;

	            // Afficher le modal d'édition
	            editCommentModal.style.display = 'flex';
	        });
	    });

	    // Gestion de la fermeture du modal d'édition
	    document.querySelectorAll('.close').forEach(button => {
	        button.addEventListener('click', () => {
	            editCommentModal.style.display = 'none'; // Corrigé : ID correct pour fermer le modal d'édition
	        });
	    });



	    renderTable(); // Initial rendering
	});

    // Fonction pour afficher les informations d'un utilisateur dans le modal d'édition
    function sendId(id) {
        console.log("ID récupéré => " + id);
        document.getElementById('commentId').value = id;
        console.log(document.getElementById('commentId'));
        document.getElementById('editCommentModal').style.display = 'flex';
    }    	
    </script>
</body>

</html>