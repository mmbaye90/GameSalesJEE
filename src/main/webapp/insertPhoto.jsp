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
				<a href="index.html" class="navbar-brand mx-4 mb-3">
					<h3 class="text-primary">
						<i class="fa fa-user-edit me-2"></i>DarkPan
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
					<a href='<c:url value='Dashboard'></c:url>'
						class="nav-item nav-link active"><i
						class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
					<div class="nav-item dropdown">
						<a href='<c:url value='UsersMenagement'></c:url>'
							class="nav-link dropdown-toggle nav-item nav-link"
							data-bs-toggle="dropdown"> <i class="fa fa-users me-2"></i>Gestion
							Users
						</a>
						<div
							class="dropdown-menu bg-transparent border-0 nav-item nav-link">
							<a href='<c:url value='UsersMenagement'></c:url>'
								class="dropdown-item ">MenUsers</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a href='<c:url value="JeuxMenagement"></c:url>'
							class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
							class="far fa-file-alt me-2"></i>Gestion Jeux</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href='<c:url value ="JeuxMenagement"></c:url>'
								class="dropdown-item">Jeux Men</a>
						</div>
					</div>

					<div class="nav-item dropdown">
						<a href='<c:url value ="MsgMenagement"></c:url>'
							class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
							class="fa-regular fa-envelope me-2"></i> Gestion Msg </a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href='<c:url value="MsgMenagement"></c:url>'
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
			<h1 class="text-white text-center m-3">Pictures Menagement</h1>


			<!-- Modal pour Ajouter -->
			<div id="addUserModal" class="modal m-4"
				style=" max-height: 80vh; overflow-y: auto;">
				<div class="modal-content" style="margin-top: 20rem">
					<h5 class="text-center">Ajout média du jeux :${Titre}</h5>
					<form method="post" action="<c:url value='InsertPhoto'/>">
					<input type="hidden" name="idJeu" value="${idJeu}">
							<div>
								<label for="addProductTitle">Url1:</label> 
								<input class="p-1"
									type="text" id="addProductTitle" name="url1"
									style="width: 100%;" required>
							</div>

							<div>
								<label for="addProductDate">url2:</label> 
								<input
									class="p-1" type="text" id="addProductDate" name="url2"
									style="width: 100%; border-color: rgb(68, 73, 76); background-color: rgb(73, 78, 81); color: rgb(255, 255, 255);"
									required>
							</div>
					

						
							<div>
								<label for="addProductLangue">Url3:</label> 
								<input class="p-1"
									type="text" id="addProductLangue" name="url3"
									style="width: 100%;" required>
							</div>

							<div>
								<label for="addProductPrix">Url4:</label> 
								<input class="p-1"
									type="text" id="addProductPrix" name="url4"
									style="width: 100%; border-color: rgb(68, 73, 76); background-color: rgb(73, 78, 81); color: rgb(255, 255, 255);"
									 required>
							</div>
							<div>
								<label for="addProductQuantite">url Vidéo:</label> 
								<input
									class="p-1" type="text" id="addProductQuantite"
									name="urlvideo"
									style="width: 100%; border-color: rgb(68, 73, 76); background-color: rgb(73, 78, 81); color: rgb(255, 255, 255);"
									required>
							</div>

						<div>
							<button type="submit">Enregistrer</button>
							<button type="button" class="close">Annuler</button>
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


</body>

</html>