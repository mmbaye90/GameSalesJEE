<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau avec Modals et Pagination</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css1/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css1/style.css" rel="stylesheet">


</head>

<body>
    <div class="container-fluid position-relative d-flex p-0">
 
        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="index.html" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>MM</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
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
                    <a href='<c:url value='Dashboard'></c:url>' class="nav-item nav-link active"><i
                            class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <div class="nav-item dropdown">
                        <a href='<c:url value='UsersMenagement'></c:url>' class="nav-link dropdown-toggle nav-item nav-link" data-bs-toggle="dropdown">
                            <i class="fa fa-users me-2"></i>Gestion Users
                        </a>
                        <div class="dropdown-menu bg-transparent border-0 nav-item nav-link">
                            <a href='<c:url value='UsersMenagement'></c:url>' class="dropdown-item ">MenUsers</a>                         
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href='<c:url value="JeuxMenagement"></c:url>' class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                                class="far fa-file-alt me-2"></i>Gestion Jeux</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href='<c:url value ="JeuxMenagement"></c:url>' class="dropdown-item">Jeux Men</a>
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                        <a href='<c:url value ="MsgMenagement"></c:url>' class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                                class="fa-regular fa-envelope me-2"></i>
                            Gestion Msg
                        </a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href='<c:url value="MsgMenagement"></c:url>' class="dropdown-item">Msg Men</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <form class="d-none d-md-flex ms-4">
                    <input class="form-control bg-dark border-0" type="search" placeholder="Search">
                </form>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-envelope me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">Message</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
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
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-bell me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">Notificatin</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">Profile updated</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">New user added</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">Password changed</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item text-center">See all notifications</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="img/user.jpg" alt=""
                                style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex">John Doe</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">My Profile</a>
                            <a href="#" class="dropdown-item">Settings</a>
                            <a href="#" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->
            <h1 class="text-white text-center m-3">Users Menagement</h1>
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
                    <button id="addButton"><i class="fas fa-plus"></i> Ajouter</button>
                </div>

                <div class="table-responsive">
                    <table id="dataTable">
                        <thead>
                            <tr>
                                <th>Img</th>
                                <th>Nom</th>
                                <th>Email</th>
                                <th>IsAdmin</th>
                                <th>BlackListed</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="u" items="${sessionScope.listUsers}">
	                            <tr>
	                                <td><img alt=">" src="${u.image}" style="height: 2.5rem;width:2.5rem;border-radius:50%;"></td>
	                                <td>${u.nom}</td>
	                                <td>${u.email}</td>
	                                <td>
	                                	<c:choose>
	                                		<c:when test="${u.admin}">
	                                			<small class="text-success"><i class="fa-solid fa-circle-check"></i></small>
	                                		</c:when>
	                                		<c:otherwise>
	                                			<small class="text-danger"><i class="fa-solid fa-circle-xmark"></i></small>
	                                		</c:otherwise>
	                                	</c:choose>
	                                </td>
	                                <td>${u.blacklisted}</td>
	                                <td>
	                                     <button class="action-btn edit-btn" onclick="sendId(${u.id_utilisateur})">
    										<i class="fas fa-edit"></i>
										</button>

	                                    <a 
	                                   		href="UsersMenagement?idToTrash=${u.id_utilisateur}" 
	                                   		class="action-btn delete-btn">
	                                    	<i class="fas fa-trash"></i>
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
            <div id="addUserModal" class="modal m-4" style="display: none;">
                <div class="modal-content">
                    <h2>Ajouter un utilisateur</h2>
                    <form method="post">
                        <label for="addUserName">Nom:</label>
                        <input type="text" id="addUserName" required name="name">
                        
                        <label for="addUserEmail">Email:</label>
                        <input type="email" id="addUserEmail" required name="email">
                        
                        <label for="addUserPassword">Password:</label>
                        <input type="password" id="addUserPassword" required name ="password">
                        
                        <div style="display: flex;">
	                        <label for="addUserIsAdmin">IsAdmin:</label>
	                        <input type="checkbox" id="addUserIsAdmin" name = "isAdmin" class="mx-4">
                        </div>
                        
                        <div style="display: flex;">
	                        <label for="addUserAddress">BlackListed:</label>
	                        <input type="checkbox" id="addUserAddress" name = "isBlacklisted" value="false" disabled="disabled"class="mx-3">
                        </div>
                        
                        <div>
                            <button type="submit">Enregistrer</button>
                            <button type="button" class="close">Annuler</button>
                        </div>
                    </form>
                </div>
            </div>


            <!-- Modal pour Modifier -->
            <div id="editUserModal" class="modal m-4" style="display: none;">
                <div class="modal-content">
                    <h2>Modifier un utilisateur</h2>
                    <form method="post">
                    	
                    	<input type="hidden" name="idUserToUpdate" id="idUser">
                    
                        <label for="editUserName">Nom:</label>
                        <input type="text" id="editUserName" required name ="nameMod">
                        
                        <label for="editUserEmail">Email:</label> 
                        <input type="email" id="editUserEmail" required  name ="emailMod">
                        
                        <div style="display: flex">
                        	<label for="editUserPhone">IsAdmin:</label>
                        	<input type="checkbox" id="editUserPhone"  class ='mx-5' name ="adminMod">
                        </div>
                        
                        <div style="display: flex">
                        	<label for="editUserAddress">BlackListed:</label>
                        	<input type="checkbox" id="editUserAddress"  class ='mx-5' name ="blacklistedMod">
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
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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
        const editUserModal = document.querySelector('#editUserModal');
        let currentPage = 1;
        let pageSize = parseInt(pageSizeSelect.value);
        let filteredRows = [];

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

        searchInput.addEventListener('input', () => {
            currentPage = 1; // Réinitialiser à la première page lors de la recherche
            renderTable();
        });

        pageSizeSelect.addEventListener('change', () => {
            pageSize = parseInt(pageSizeSelect.value);
            currentPage = 1; // Réinitialiser à la première page lors du changement de taille de page
            renderTable();
        });

        document.querySelector('#addButton').addEventListener('click', () => {
            addUserModal.style.display = 'flex';
        });

        document.querySelectorAll('.modal-content .close').forEach(button => {
            button.addEventListener('click', closeModals);
        });

        function closeModals() {
            addUserModal.style.display = 'none';
            editUserModal.style.display = 'none';
        }

        document.querySelectorAll('.edit-btn').forEach((button) => {
            button.addEventListener('click', () => {
                const row = button.closest('tr');
                const cells = row.querySelectorAll('td');
                const name = cells[1].textContent;
                const email = cells[2].textContent;
                const phone = cells[3].textContent;
                const address = cells[4].textContent;

                document.querySelector('#editUserName').value = name;
                document.querySelector('#editUserEmail').value = email;
                document.querySelector('#editUserPhone').value = phone;
                document.querySelector('#editUserAddress').value = address;

                editUserModal.style.display = 'flex';
            });
        });





        renderTable(); // Initial rendering

        
    });


	
    function sendId(id) {
        // Affiche l'ID dans la console pour vérifier qu'il est bien récupéré
        console.log("ID récupéré => " + id);

        // Associe l'ID récupéré au champ caché du formulaire
        document.getElementById('idUser').value = id;

        // Ouvre la modale d'édition
        document.getElementById('editUserModal').style.display = 'flex';
    }
       	
    </script>
</body>

</html>