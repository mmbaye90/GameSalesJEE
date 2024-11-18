package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ENTITIES.Jeux;
import Model.ENTITIES.Photo;
import Model.ENTITIES.Video;
import UTILS.GenericDAO;

/**
 * Servlet implementation class InsertPhoto
 */
@WebServlet("/InsertPhoto")
public class InsertPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPhoto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	
    	// Récupérer l'ID du jeu inséré à partir de l'URL
        String idJeuxStr = request.getParameter("lastIdInsertedInJeu");
        GenericDAO<Jeux>jeuDA0 =new GenericDAO<Jeux>(Jeux.class);

        if (idJeuxStr != null) {
           
                int lastIdInsertedInJeu = Integer.parseInt(idJeuxStr);
                System.out.println("ID TROUVÉ => " + lastIdInsertedInJeu);
                
                request.setAttribute("Titre", jeuDA0.findById(lastIdInsertedInJeu).getTitre());
           
                request.setAttribute("idJeu", lastIdInsertedInJeu);
                
        } else {
            System.out.println("Aucun ID trouvé !");
        }

        // Passer à la JSP
        request.getRequestDispatcher("insertPhoto.jsp").forward(request, response);
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url1 = request.getParameter("url1");
		String url2 = request.getParameter("url2");
		String url3 = request.getParameter("url3");
		String url4 = request.getParameter("url4");
		String urlVideo = request.getParameter("urlvideo");
		String idJeu = request.getParameter("idJeu");
		
		GenericDAO<Photo>photo = new GenericDAO<Photo>(Photo.class);
		GenericDAO<Video>video = new GenericDAO<Video>(Video.class);
		
		if(url1 !=null) {
			System.out.println(url1+url2+url3+url4+urlVideo+idJeu);
			
			//INSERT PHOTO 1
			Photo ph1 = new Photo();
			ph1.setId_jeux(Integer.parseInt(idJeu));
			ph1.setUrl_photo(url1);
			photo.save(ph1);
			
			//INSERT PHOTO 2
			Photo ph2 = new Photo();
			ph2.setId_jeux(Integer.parseInt(idJeu));
			ph2.setUrl_photo(url2);
			photo.save(ph2);
			
			//INSERT PHOTO 3
			Photo ph3 = new Photo();
			ph3.setId_jeux(Integer.parseInt(idJeu));
			ph3.setUrl_photo(url3);
			photo.save(ph3);
			
			//INSERT PHOTO 4
			Photo ph4 = new Photo();
			ph4.setId_jeux(Integer.parseInt(idJeu));
			ph4.setUrl_photo(url4);
			
			
			
			Video v = new Video();
			v.setId_jeux(Integer.parseInt(idJeu));
			v.setUrl_video(urlVideo);
			
			
			try {
				
				photo.save(ph4);
				video.save(v);
				System.out.println("Insertion REUSSI INSERT PHOTO ");
			} catch (Exception e) {
				
				System.out.println("ECHOUE PHOTO ET VIDEO");
			}
			
		}
		
		doGet(request, response);
	}

}
