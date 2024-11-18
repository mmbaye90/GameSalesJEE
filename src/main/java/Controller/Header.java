package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.ConnectionManager;
import Model.ENTITIES.Categorie;
import Model.ENTITIES.Jeux;
import Model.ENTITIES.Utilisateur;
import UTILS.DetailPanier;
import UTILS.GenericDAO;
import UTILS.Panier;

@WebServlet("/Header")
public class Header extends HttpServlet {
    private static final long serialVersionUID = 1L;



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Instanciation de l'objet Categorie avec GenericDAO
        GenericDAO<Categorie> catDAO = new GenericDAO<>(Categorie.class);

        // Liste des catégories
        List<Categorie> listeCateg = catDAO.findAll();

        // Envoi de la liste des catégories à la session
        request.getSession().setAttribute("listeCat", listeCateg);
        
        
        //Récupération SESSION PNIER
        HttpSession session = request.getSession();
        Panier panier = (Panier) session.getAttribute("panier");

        if (panier != null) {
        	
            // Gestion d'affichage des jeux avec photo
            GenericDAO<Jeux> jeuDAO = new GenericDAO<>(Jeux.class);
            Map<Integer, String> photosMap = new HashMap<>();

            // Pour obtenir la première photo du jeu => affichage panier
            for (DetailPanier dp : panier.articles) {
                int idJeux = dp.getJeux().getId_jeux();
                List<String> photos = jeuDAO.findPhotosByJeuxId(idJeux);
                if (!photos.isEmpty()) {
                    photosMap.put(idJeux, photos.get(0)); // Stocke l'URL de la première photo pour cet idJeux
                }
            }

            // Si le panier existe déjà, on peut accéder à ses articles
            request.setAttribute("articles", panier.articles);
            request.setAttribute("photosMap", photosMap);
            request.setAttribute("longTabArt", panier.nbArt());
            request.setAttribute("tot", panier.total());
            request.setAttribute("panier", panier);
        }

        
        
		//Récupération session user pour gestion affichage
        HttpSession sessionP = request.getSession();
        
        Utilisateur user = (Utilisateur) sessionP.getAttribute("user");
        

        //Photo par défaut (si null dans la bd)
        String defaultPic = "https://media.istockphoto.com/id/1138452882/fr/vectoriel/utilisateur.jpg?s=1024x1024&w=is&k=20&c=qmwyqYC7i5uGtguUrwiaSGMZJOHgx5gj7E2GZG7SJgU=";

        // Initialisation de la variable userPhoto avec la valeur par défaut
        String userPhoto = defaultPic;

        if (user != null) {
            // Récupérer l'image de l'utilisateur
            String imagePath = user.getImage();

            // Vérifier si l'image est une URL externe (commence par http ou https)
            if (imagePath != null) {
                if (imagePath.startsWith("http://") || imagePath.startsWith("https://")) {
                    // Utiliser l'URL externe telle quelle
                    userPhoto = imagePath;
                } else {
                    // Si c'est un chemin local, générer l'URL pour l'ImageServlet
                    userPhoto = request.getContextPath() + "/images/" + imagePath;
                }
            }
            
            request.setAttribute("userPhoto", userPhoto);
            request.setAttribute("userId", user.getId_utilisateur());
            
        }


        
        
        //gestion logout
        
        String btnLog = request.getParameter("btnLogout");
        if(btnLog !=null) {
        	System.out.println("Parametre log => "+btnLog);
        	HttpSession sessionU = request.getSession(false);
            if(sessionU !=null) {
            	sessionU.invalidate();
            }
            
         // Rediriger vers la page d'accueil ou de connexion
            request.getRequestDispatcher("logReg.jsp").forward(request, response);;
            return;
            
        }
        
        
		 
        
        

        
        String keyword = request.getParameter("keyword");

        if (keyword != null && !keyword.trim().isEmpty()) {
            // Recherche de jeux correspondant au mot-clé
            GenericDAO<Jeux> jeuDAO = new GenericDAO<>(Jeux.class);
            List<Jeux> jeuxList = jeuDAO.search(keyword);

            // Si des résultats sont trouvés, générer la réponse HTML
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // Construction du HTML avec la liste des jeux trouvés
            if (jeuxList != null && !jeuxList.isEmpty()) {
            	for (Jeux jeu : jeuxList) {
            	    out.println(
            	        "<li>" + 
            	            "<a href='DetailProduit?idJeux=" + jeu.getId_jeux() + "' style='color: black;'>" +  // Redirection avec ID et couleur du texte en noir
            	                "<span class='item-name'>" + jeu.getTitre() + "</span>" +
            	                "<span class='item-price'>" + jeu.getPrix() + "€</span>" +
            	            "</a>" +
            	        "</li>");
            	}


            } else {
                // Si aucun jeu trouvé
                out.println("<li>Aucun jeu trouvé</li>");
            }

            out.close();
            return; // On termine ici pour éviter le forward
        }

        // Si pas de mot-clé, faire un forward vers la vue (JSP)
        request.getRequestDispatcher("header.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
