package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ENTITIES.Categorie;
import Model.ENTITIES.Jeux;
import Model.ENTITIES.Utilisateur;
import UTILS.GenericDAO;

/**
 * Servlet implementation class JeuxMenagement
 */
@WebServlet("/JeuxMenagement")
public class JeuxMenagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		// Récupérer les jeux via votre DAO
		GenericDAO<Jeux> jeuDAO = new GenericDAO<Jeux>(Jeux.class);
		List<Jeux> listJeux = jeuDAO.findAll();

		// Récupérer les catégories via votre DAO
		GenericDAO<Categorie> categorieDAO = new GenericDAO<Categorie>(Categorie.class);
		List<Categorie> listCategories = categorieDAO.findAll();

		// Passer les listes à la JSP
		request.setAttribute("listJeux", listJeux);
		request.setAttribute("listCategories", listCategories);
		
		
		//GESTION DE SUPPRESSION DES JEUX
		request.getParameter("idToTrash");
		if(request.getParameter("idToTrash") != null) {
			
			int id = Integer.parseInt(request.getParameter("idToTrash"));
			
			jeuDAO.delete(id);
			
			List<Jeux> listJeuxP = jeuDAO.findAll();
			List<Categorie> listCategoriesP = categorieDAO.findAll();
			
			request.setAttribute("listJeux", listJeuxP);
			request.setAttribute("listCategories", listCategoriesP);
			
		}

		request.getRequestDispatcher("jeuxMenagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		GenericDAO<Jeux> jeuDAO = new GenericDAO<Jeux>(Jeux.class);
		
		/* ============================== GESTION UPDATE ============ */
		String date_sortieM = request.getParameter("date_sortie");
	    String titleM = request.getParameter("title");
	    String langueM = request.getParameter("langue");
	    String prixM = request.getParameter("prix");
	    String quantiteM = request.getParameter("quantite");
	    String id_categorieM = request.getParameter("id_categorie");
	    String resumeM = request.getParameter("resume");
	    String idJeuToUpdate = request.getParameter("idJeuToUpdate");
	    
	    
		
	   if(date_sortieM!=null && titleM!=null && langueM!=null && prixM!=null && quantiteM!=null && id_categorieM!=null && resumeM!=null &&idJeuToUpdate!=null ) {
		
		   Jeux upJ = jeuDAO.findById(Integer.parseInt(idJeuToUpdate));
			 upJ.setDate_sortie(date_sortieM);
			 upJ.setTitre(titleM);
			 upJ.setLangue(langueM);
			 upJ.setPrix(Double.parseDouble(prixM));
			 upJ.setQuantite(Integer.parseInt(quantiteM));
			 upJ.setId_categorie(Integer.parseInt(id_categorieM));
			 upJ.setResume(resumeM);
			 
			 System.out.println(upJ);
			 
			 jeuDAO.save(upJ);
			 
			 //REMISE A JOUR DES DONNEES
			 GenericDAO<Categorie> categorieDAO = new GenericDAO<Categorie>(Categorie.class);
			 List<Categorie> listCategories = categorieDAO.findAll();
			 List<Jeux> listJeux = jeuDAO.findAll();
			 request.setAttribute("listJeux", listJeux);
			 request.setAttribute("listCategories", listCategories);
			 
			 
			 request.getRequestDispatcher("jeuxMenagement.jsp").forward(request, response);
			 return;
		}
		 
	    
	    
	    
	    
		/* ======================== GESTION AJOUT JEU ============ */
			
		String date_sortie = request.getParameter("date_sortie");
	    String title = request.getParameter("title");
	    String langue = request.getParameter("langue");
	    String prix = request.getParameter("prix");
	    String quantite = request.getParameter("quantite");
	    String id_categorie = request.getParameter("id_categorie");
	    String resume = request.getParameter("resume");

	    Jeux j = new Jeux();
	    j.setTitre(title);
	    j.setDate_sortie(date_sortie);
	    j.setId_categorie(Integer.parseInt(id_categorie));
	    j.setLangue(langue);
	    j.setQuantite(Integer.parseInt(quantite));
	    j.setPrix(Double.parseDouble(prix));
	    j.setResume(resume);

	    

	    try {
	        int lastIdInsertedInJeu = jeuDAO.insertAndReturnId(j);
	        System.out.println("Insertion Réussie => " + lastIdInsertedInJeu);

	        // Stocker le dernier ID inséré dans la session
	        HttpSession session = request.getSession();
	        session.setAttribute("lastIdInsertedInJeu", lastIdInsertedInJeu);

	        // Redirection externe avec l'ID du jeu ajouté dans l'URL
	        response.sendRedirect("InsertPhoto?lastIdInsertedInJeu=" + lastIdInsertedInJeu);

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	



}
