package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ENTITIES.Jeux;
import Model.ENTITIES.Video;
import UTILS.DetailPanier;
import UTILS.GenericDAO;
import UTILS.Panier;
/**
 * Servlet implementation class DetailProduit
 */
@WebServlet("/DetailProduit")
public class DetailProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailProduit() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GenericDAO<Jeux> jeuxDao = new GenericDAO<Jeux>(Jeux.class);
		
		//TITRE DU JEUX
		Integer idJeux = Integer.parseInt(request.getParameter("idJeux"));
		if (idJeux != null) {
			
			Jeux objJeux = jeuxDao.findById(idJeux);
			
			List<String> urlPhotos = jeuxDao.findPhotosByJeuxId(idJeux);
			
			String onePhoto = urlPhotos.get(0);
			
			Video objVideo = jeuxDao.findVideoByJeuxId(idJeux);
						
			int note = jeuxDao.getAverageNoteByJeuxId(idJeux);
			
			
			request.setAttribute("obj", objJeux);
			request.setAttribute("listPhotos", urlPhotos);
			request.setAttribute("onePhoto", onePhoto);
			request.setAttribute("video", objVideo);
			request.setAttribute("note", note);
			
			if(request.getParameter("quantity") != null) {
				Integer quantity = Integer.parseInt(request.getParameter("quantity"));
				//System.out.println(quantity);
				
				 // Gestion du panier
	            HttpSession session = request.getSession();
	            
	            Panier panier = (Panier) session.getAttribute("panier");

	            if (panier == null) {
	                panier = new Panier();  // Crée un nouveau panier si nécessaire
	                session.setAttribute("panier", panier);
	                //request.getSession().setAttribute("photoJeux", onePhoto);
	            }
	            
	           DetailPanier dp = new DetailPanier(objJeux,quantity);
	           panier.add(dp);
	           
	        // Mettre à jour la session avec le panier mis à jour
	            session.setAttribute("panier", panier);
	            
	        
	            
	            
	            
	            
			}

			
		}
		
		
		
			request.getRequestDispatcher("detailProduit.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
