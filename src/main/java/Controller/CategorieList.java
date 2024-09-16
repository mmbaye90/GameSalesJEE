package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Database.ConnectionManager;
import Model.ENTITIES.Jeux;
import Model.ENTITIES.Photo;
import UTILS.GenericDAO;

@WebServlet("/CategorieList")
public class CategorieList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CategorieList() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération de l'ID de la catégorie depuis les paramètres de requête
        String categorieIdParam = request.getParameter("idCat");
        if (categorieIdParam != null) {
        	int categorieId = Integer.parseInt(categorieIdParam);

            // Utilisation de GenericDAO pour récupérer tous les jeux
            GenericDAO<Jeux> jeuDAO = new GenericDAO<>(Jeux.class);
            List<Jeux> tousLesJeux = jeuDAO.findAll(); // Récupère tous les jeux
            
            // Filtrage des jeux appartenant à la catégorie spécifiée
            List<Jeux> jeuxParCategorie = new ArrayList<>();
            for (Jeux jeu : tousLesJeux) {
                if (jeu.getId_categorie() == categorieId) {
                    jeuxParCategorie.add(jeu);
                }
            }

            // Récupérer les photos associées à chaque jeu
            GenericDAO<Photo> photoDAO = new GenericDAO<>(Photo.class);
            Map<Integer, String> photosMap = new HashMap<>(); // Stocker l'URL de la première photo pour chaque jeu

            for (Jeux jeu : jeuxParCategorie) {
                List<Photo> toutesLesPhotos = photoDAO.findAll(); // Récupère toutes les photos
                for (Photo photo : toutesLesPhotos) {
                    if (photo.getId_jeux() == jeu.getId_jeux()) {
                        photosMap.put(jeu.getId_jeux(), photo.getUrl_photo()); // Associe la première photo trouvée
                        break; // Stoppe après avoir trouvé la première photo
                    }
                }
            }

            // Ajouter les jeux et les photos à la requête
            request.setAttribute("jeuxParCategorie", jeuxParCategorie);
            request.setAttribute("photosMap", photosMap);
		} 
        

        // Redirige vers la vue JSP
        request.getRequestDispatcher("categorieList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
