document.addEventListener('DOMContentLoaded', function () {
    var cartLink = document.getElementById('cart');
    var shoppingCart = document.querySelector('.shopping-cart');
  
    cartLink.addEventListener('click', function (e) {
        e.preventDefault();
        shoppingCart.style.display = (shoppingCart.style.display === 'block') ? 'none' : 'block';
    });
  
    // Optional: Click outside to close the shopping cart
    document.addEventListener('click', function (e) {
        if (!cartLink.contains(e.target) && !shoppingCart.contains(e.target)) {
            shoppingCart.style.display = 'none';
        }
    });
  });
  
  
  // ================= categorie dropdown
  document.getElementById('categoriesBtn').addEventListener('click', function(event) {
    event.preventDefault();
    var dropdown = document.querySelector('.dropdown-categorie');
    var icon = this.querySelector('.dropdown-icon');
  
    dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
  
    icon.classList.toggle('rotate');
  });
  
  window.addEventListener('click', function(event) {
    var categoriesBtn = document.getElementById('categoriesBtn');
    var dropdown = document.querySelector('.dropdown-categorie');
    
    if (event.target !== categoriesBtn && !categoriesBtn.contains(event.target)) {
        dropdown.style.display = 'none';
        const icon = categoriesBtn.querySelector('.dropdown-icon');
        icon.classList.remove('rotate');
    }
  });
  
  // =========================== DROPDOWN SEARCH
document.addEventListener('DOMContentLoaded', function() {

    var searchInput = document.querySelector('.input');
    var dropdownSearch = document.querySelector('.dropdown-search');
	let ul = document.querySelector('.shopping-cart-items');
	console.log(ul)
    searchInput.addEventListener('input', function(e) {
        let keyword = this.value.trim();
        
        // Afficher ou cacher la dropdown en fonction du contenu de l'input
        dropdownSearch.style.display = keyword !== '' ? 'block' : 'none';

        // Récupère l'URL actuelle
        let currentUrl = window.location.href;
        const url = new URL(currentUrl);

        // Si le paramètre 'keyword' existe déjà, on le remplace
        if (url.searchParams.has('keyword')) {
            url.searchParams.set('keyword', keyword);
        } else {
            // Sinon, on l'ajoute
            url.searchParams.append('keyword', keyword);
        }

        // Met à jour l'URL dans la barre d'adresse sans recharger la page
        window.history.replaceState(null, '', url.toString());

        // Appel AJAX à la servlet pour récupérer le résultat de la recherche
        if (keyword !== '') {
			
            fetch('Header?keyword=' + encodeURIComponent(keyword))
                .then(response => response.text())
                .then(data => {
					
                    console.log("Response from servlet:", data);
                    // Affichage
                    ul.innerHTML += data;
                    
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        }
    });

    // Fermer le dropdown lorsque l'utilisateur clique en dehors de la zone
    window.addEventListener('click', function(event) {
        if (!document.querySelector('.box').contains(event.target)) {
            dropdownSearch.style.display = 'none';
        }
    });
});


  