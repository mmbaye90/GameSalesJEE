<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Dashboard</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
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
</head>

<body>
	<div class="container-fluid position-relative d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->


		<!-- Sidebar Start -->
		<div class="sidebar pe-4 pb-3">
			<nav class="navbar bg-secondary navbar-dark">
				<a href="index.html" class="navbar-brand mx-4 mb-3">
					<h3 class="text-primary">
						<i class="fa fa-user-edit me-2"></i>MM
					</h3>
				</a>
				<div class="d-flex align-items-center ms-4 mb-4">
					<div class="position-relative">
						<img class="rounded-circle" src="img/user.jpg" alt=""
							style="width: 40px; height: 40px;">
						<div
							class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
					</div>
					<div class="ms-3">
						<h6 class="mb-0">Jhon Doe</h6>
						<span>Admin</span>
					</div>
				</div>
				<div class="navbar-nav w-100">
					<a href='<c:url value ='Dashboard'></c:url>'
						class="nav-item nav-link active"><i
						class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"><i class="fa fa-users me-2"></i>Gestion
							Users</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href='<c:url value='UsersMenagement'></c:url>'
								class="dropdown-item">MenUsers</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Gestion
							Jeux</a>
						<div class="dropdown-menu bg-transparent border-0">
							<a href='<c:url value='JeuxMenagement'></c:url>'
								class="dropdown-item">Jeux Men</a>
							<!-- <a href="signup.html" class="dropdown-item">Sign Up</a>
                            <a href="404.html" class="dropdown-item">404 Error</a>
                            <a href="blank.html" class="dropdown-item">Blank Page</a> -->
						</div>
					</div>

					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown"><i
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


		<!-- Content Start -->
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


			<!-- Sale & Revenue Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4 boxChiffre">
							<i class="fa fa-chart-line fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">Total Users</p>
								<h6 class="mb-0">${nbrUser}</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4 boxChiffre">
							<i class="fa fa-chart-bar fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">Chiffre aff</p>
								<h6 class="mb-0">$${chiffAf}</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4 boxChiffre">
							<i class="fa fa-chart-area fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">MoyJeu Cmde</p>
								<h6 class="mb-0">${moyJeuxByCommande }</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4 boxChiffre">
							<i class="fa fa-chart-pie fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">${titre}</p>
								<h6 class="mb-0">${nbCom}commentaires</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Sale & Revenue End -->


			<!-- Sales Chart Start -->
			<div class="container-fluid pt-4 px-4">

				<div class="row g-4">

					<!-- Premier chart -->
					<div class="col-sm-12 col-xl-6">
						<div class="bg-secondary text-center rounded p-4 boxCanvas">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">Revenus par date (historique des
									commandes)</h6>
							</div>
							<canvas id="worldwide-sales"></canvas>
						</div>
					</div>

					<!-- Deuxieme chart -->
					<div class="col-sm-12 col-xl-6">
						<div class="bg-secondary text-center rounded p-4 boxCanvas">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">Statistiques Jeux commenataires et
									évaluations</h6>
							</div>
							<canvas id="salse-revenue"></canvas>
						</div>
					</div>
				</div>

			</div>
			<!-- Sales Chart End -->


			<!-- Recent Sales Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-secondary text-center rounded p-4 boxCanvas">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<h6 class="mb-0">Statistiques des Jeux par Catégorie</h6>
						<!--  <a href="">Show All</a> -->
					</div>
					<div class="table-responsive bg-secondary">
						<table
							class="table text-start align-middle table-bordered table-hover mb-0">

							<thead>

								<tr class="text-white">

									<c:forEach var="entry" items="${gamesByCategory}">
										<th scope="col">${entry.genre}</th>
									</c:forEach>

								</tr>

							</thead>

							<tbody>

								<tr>
									<c:forEach var="entry" items="${gamesByCategory}">
										<td>${entry.total_jeux}</td>
									</c:forEach>
								</tr>


							</tbody>

						</table>
					</div>
				</div>
			</div>
			<!-- Recent Sales End -->


			<!-- Widgets Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-md-6 col-xl-4 boxMessage">
						<div class="h-100 bg-secondary rounded p-4 contMsg">
							<div
								class="d-flex align-items-center justify-content-between mb-2">
								<h6 class="mb-0">Commentaires</h6>
							</div>
							<c:forEach var="c" items="${commentaires}">
								<div class="d-flex align-items-center border-bottom py-3">
									<img class="rounded-circle flex-shrink-0"
										src="${c.utilisateurImage}" alt="Photo de ${c.utilisateurNom}"
										style="width: 40px; height: 40px;">
									<div class="w-100 ms-3">
										<div class="d-flex w-100 justify-content-between">
											<h6 class="mb-0">${c.utilisateurNom}</h6>
											<small>${25-c.idCommentaire} minutes ago</small>
										</div>
										<span
											style="display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 200px;">
											${c.contenu} </span>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>


			<!-- Footer Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-secondary rounded-top p-4">
					<div class="row">
						<div class="col-12 col-sm-6 text-center text-sm-start">
							&copy; <a href="#">Your Site Name</a>, All Right Reserved.
						</div>
						<div class="col-12 col-sm-6 text-center text-sm-end">
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a href="https://htmlcodex.com">HTML Codex</a> <br>Distributed
							By: <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer End -->
		</div>
		<!-- Content End -->


		<!-- Back to Top -->
		<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
			class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->


	<!-- Template Javascript -->
	<!--  <script src="js1/main.js"></script> -->
	<script defer>
		(function($) {
			"use strict";

			// Spinner
			var spinner = function() {
				setTimeout(function() {
					if ($('#spinner').length > 0) {
						$('#spinner').removeClass('show');
					}
				}, 1);
			};
			spinner();

			// Back to top button
			$(window).scroll(function() {
				if ($(this).scrollTop() > 300) {
					$('.back-to-top').fadeIn('slow');
				} else {
					$('.back-to-top').fadeOut('slow');
				}
			});
			$('.back-to-top').click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 1500, 'easeInOutExpo');
				return false;
			});

			// Sidebar Toggler
			$('.sidebar-toggler').click(function() {
				$('.sidebar, .content').toggleClass("open");
				return false;
			});

			// Progress Bar
			$('.pg-bar').waypoint(function() {
				$('.progress .progress-bar').each(function() {
					$(this).css("width", $(this).attr("aria-valuenow") + '%');
				});
			}, {
				offset : '80%'
			});

			// Calender
			$('#calender').datetimepicker({
				inline : true,
				format : 'L'
			});

			// Chart Global Color
			Chart.defaults.color = "#6C7293";
			Chart.defaults.borderColor = "#000000";

			/*  ===================== CHART1 ============ */
		    const ctx = document.getElementById('worldwide-sales').getContext('2d');
		
		    // Obtenir les données pour les labels (dates) et les revenus depuis la JSP
		    const labels = [
		        <c:forEach var="row" items="${revenuesByDate}">
		            '${row.date_commande}', <!-- Les dates des commandes -->
		        </c:forEach>
		    ];
		
		    const revenues = [
		        <c:forEach var="row" items="${revenuesByDate}">
		            ${row.total_revenu}, <!-- Les données réelles de revenus -->
		        </c:forEach>
		    ];
		
		    // Couleurs prédéfinies pour les segments du graphique
		    const colorPalette = [
		        'rgba(255, 99, 132, 0.6)',  // Rouge
		        'rgba(54, 162, 235, 0.6)',  // Bleu
		        'rgba(75, 192, 192, 0.6)',  // Turquoise
		        'rgba(255, 206, 86, 0.6)',  // Jaune
		        'rgba(153, 102, 255, 0.6)', // Violet
		        'rgba(255, 159, 64, 0.6)',  // Orange
		        'rgba(201, 203, 207, 0.6)', // Gris clair
		        'rgba(102, 204, 153, 0.6)', // Vert clair
		    ];
		
		    // Si plus de segments que de couleurs disponibles, faire un cycle sur les couleurs
		    const backgroundColors = revenues.map((_, index) => colorPalette[index % colorPalette.length]);
		
		    // Couleurs des bordures en correspondance avec les couleurs de fond
		    const borderColors = revenues.map((_, index) => backgroundColors[index].replace('0.6', '1'));
		
		
		    // Générer le graphique
		    new Chart(ctx, {
		        type: 'doughnut',
		        data: {
		            labels: labels,
		            datasets: [{
		                label: 'Revenus journaliers',
		                data: revenues,
		                backgroundColor: backgroundColors,  // Couleurs de fond dynamiques
		                borderColor: borderColors,          // Couleurs des bordures dynamiques
		                borderWidth: 1                      // Taille des bordures
		            }]
		        },
		        options: {
		            responsive: true,
		            plugins: {
		                legend: {
		                    position: 'top', // Position de la légende en haut
		                },
		                tooltip: {
		                    enabled: true // Affichage des infos au survol
		                }
		            }
		        }
		    });

//=========================CHART 2 ===================================
			const ctx2 = document.getElementById('salse-revenue').getContext(
					'2d');
			const myStackedBarChart = new Chart(ctx2, {
				type : 'bar',
				data : {
					labels : 
						[
							 <c:forEach var="jeu" items="${cmtEvJeux}">
							 	'${jeu.titre}',
							 </c:forEach>
						], 
					datasets : [ {
						label : 'Commentaires',
						data : 
							[ 
								<c:forEach var="jeu" items="${cmtEvJeux}">
							 		${jeu.total_commentaires},
							 	</c:forEach>
							], 
						backgroundColor : 'rgba(255, 99, 132, 0.5)'
					}, {
						label : 'Évaluations',
						data : 
							[ 
								<c:forEach var="jeu" items="${cmtEvJeux}">
						 			${jeu.total_evaluations},
						 		</c:forEach> 
							], 
						backgroundColor : 'rgba(54, 162, 235, 0.5)'
					} ]
				},
				options : {
					scales : {
						x : {
							stacked : true
						},
						y : {
							stacked : true,
							beginAtZero : true
						}
					}
				}
			});

		})(jQuery);
	</script>
</body>

</html>