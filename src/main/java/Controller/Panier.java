package Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ENTITIES.Jeux;
import UTILS.DetailPanier;
import UTILS.GenericDAO;


/**
 * Servlet implementation class Panier
 */
@WebServlet("/Panier")
public class Panier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Panier() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        //Récupération SESSION PNIER ET AFFICHAGE AU NIVEAU DE LA JSP
        HttpSession session = request.getSession();
        UTILS.Panier panier = (UTILS.Panier) session.getAttribute("panier");

        if (panier != null) {
        	
        	System.out.println("Panier dan Panier => " + panier);
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

			  request.setAttribute("articles", panier.articles);
			  request.setAttribute("photosMap", photosMap);
			  request.setAttribute("tot", panier.total()); request.setAttribute("panier",
			  panier);
			 
        }else {
        	System.out.println("PAnier Vide");
        }
        
        
        
      //GESTION SUPRESSION(CLIQUE DU BOUTON SUPPRIMER)
        if(request.getParameter("idToTrash") != null) {
        	
        	Integer idJeux = Integer.parseInt(request.getParameter("idToTrash"));
        	
        	System.out.println(idJeux);
        	
            panier.delete(idJeux);
            
            session.setAttribute("panier", panier);
        }
        
		
		request.getRequestDispatcher("panier.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
