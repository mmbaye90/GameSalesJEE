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

    <style>
        /* CSS de la page comme précédemment */
    </style>
</head>

<body>
    <div class="container-fluid position-relative d-flex p-0">
        <div id="spinner"
            class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>

        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="index.html" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>DarkPan</h3>
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
            <h1 class="text-white text-center m-3">Jeux Menagement</h1>
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
                                <th>Nom</th>
                                <th>Email</th>
                                <th>Téléphone</th>
                                <th>Adresse</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Jean Dupont</td>
                                <td>jean.dupont@example.com</td>
                                <td>0123456789</td>
                                <td>1 Rue de Paris</td>
                                <td>
                                    <button class="action-btn edit-btn"><i class="fas fa-edit"></i></button>
                                    <button class="action-btn delete-btn"><i class="fas fa-trash"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>Marie Curie</td>
                                <td>marie.curie@example.com</td>
                                <td>0987654321</td>
                                <td>2 Rue de Lyon</td>
                                <td>
                                    <button class="action-btn edit-btn"><i class="fas fa-edit"></i></button>
                                    <button class="action-btn delete-btn"><i class="fas fa-trash"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>Albert Einstein</td>
                                <td>albert.einstein@example.com</td>
                                <td>0456789123</td>
                                <td>3 Rue de Berlin</td>
                                <td>
                                    <button class="action-btn edit-btn"><i class="fas fa-edit"></i></button>
                                    <button class="action-btn delete-btn"><i class="fas fa-trash"></i></button>
                                </td>
                            </tr>
                            <!-- Ajoutez plus de lignes ici -->
                        </tbody>
                    </table>
                </div>

                <div class="pagination"></div>
            </div>

            <!-- Modal pour Ajouter -->
            <div id="addUserModal" class="modal m-4" style="display: none;">
                <div class="modal-content">
                    <h2>Ajouter un utilisateur</h2>
                    <form>
                        <label for="addUserName">Nom:</label>
                        <input type="text" id="addUserName" required>
                        <label for="addUserEmail">Email:</label>
                        <input type="email" id="addUserEmail" required>
                        <label for="addUserPhone">Téléphone:</label>
                        <input type="text" id="addUserPhone" required>
                        <label for="addUserAddress">Adresse:</label>
                        <input type="text" id="addUserAddress" required>
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
                    <form>
                        <label for="editUserName">Nom:</label>
                        <input type="text" id="editUserName" required>
                        <label for="editUserEmail">Email:</label>
                        <input type="email" id="editUserEmail" required>
                        <label for="editUserPhone">Téléphone:</label>
                        <input type="text" id="editUserPhone" required>
                        <label for="editUserAddress">Adresse:</label>
                        <input type="text" id="editUserAddress" required>
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
        const searchInput = document.querySelector('#searchInput');
        const tableBody = document.querySelector('#dataTable tbody');
        const paginationDiv = document.querySelector('.pagination');
        const pageSizeSelect = document.querySelector('#pageSizeSelect');
        const addUserModal = document.querySelector('#addUserModal');
        const editUserModal = document.querySelector('#editUserModal');
        let currentPage = 1;
        let pageSize = parseInt(pageSizeSelect.value);

        function renderTable() {
            const searchTerm = searchInput.value.toLowerCase();
            const rows = Array.from(document.querySelectorAll('#dataTable tbody tr'));

            rows.forEach(row => {
                const cells = row.querySelectorAll('td');
                const matches = Array.from(cells).some(cell => cell.textContent.toLowerCase().includes(searchTerm));
                row.style.display = matches ? '' : 'none';
            });

            renderPagination(rows.filter(row => row.style.display === '').length);
        }

        function renderPagination(filteredRows) {
            paginationDiv.innerHTML = '';

            const totalItems = filteredRows;
            const totalPages = Math.ceil(totalItems / pageSize);

            for (let i = 1; i <= totalPages; i++) {
                const button = document.createElement('button');
                button.textContent = i;
                button.classList.toggle('active', i === currentPage);
                button.addEventListener('click', () => {
                    currentPage = i;
                    updateTableDisplay();
                });
                paginationDiv.appendChild(button);
            }
        }

        function updateTableDisplay() {
            const rows = Array.from(document.querySelectorAll('#dataTable tbody tr')).filter(row => row.style.display === '');

            rows.forEach((row, index) => {
                row.style.display = (index >= (currentPage - 1) * pageSize && index < currentPage * pageSize) ? '' : 'none';
            });
        }

        searchInput.addEventListener('input', () => {
            currentPage = 1;
            renderTable();
            updateTableDisplay();
        });

        pageSizeSelect.addEventListener('change', () => {
            pageSize = parseInt(pageSizeSelect.value);
            currentPage = 1;
            updateTableDisplay();
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

        // Gestionnaire d'événements pour les boutons de modification
        document.querySelectorAll('.edit-btn').forEach((button, index) => {
            button.addEventListener('click', () => {
                const row = button.closest('tr');
                const name = row.children[0].textContent;
                const email = row.children[1].textContent;
                const phone = row.children[2].textContent;
                const address = row.children[3].textContent;

                // Remplir le formulaire du modal de modification avec les données de la ligne
                document.querySelector('#editUserName').value = name;
                document.querySelector('#editUserEmail').value = email;
                document.querySelector('#editUserPhone').value = phone;
                document.querySelector('#editUserAddress').value = address;

                // Afficher le modal de modification
                editUserModal.style.display = 'flex';
            });
        });

        // Initial rendering
        renderTable();
        updateTableDisplay();
    </script>
</body>

</html>