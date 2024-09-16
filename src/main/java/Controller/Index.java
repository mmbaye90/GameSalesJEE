package Controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ENTITIES.Jeux;
import UTILS.GenericDAO;



@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Index() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GenericDAO<Jeux> jeuxDAO = new GenericDAO<Jeux>(Jeux.class);	
		//Récupérer les jeux sans photos
		List<Jeux> listJeux = jeuxDAO.findAll();
		request.setAttribute("listJeux", listJeux);
		
		
		// Pour récupérer les jeux avec leurs photos
		GenericDAO<Jeux> jeuxPhotoDao = new GenericDAO<>(Jeux.class);
		
		List<Map<String, Object>> listJeuxAvecPhoto = jeuxPhotoDao.findGameWithRelatedTable("photo", "url_photo");
		
		
		request.setAttribute("jeuxAvecPhoto", listJeuxAvecPhoto);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
