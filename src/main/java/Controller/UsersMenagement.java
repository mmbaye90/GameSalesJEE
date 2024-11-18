package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ENTITIES.Utilisateur;
import UTILS.GenericDAO;

/**
 * Servlet implementation class UsersMenagement
 */
@WebServlet("/UsersMenagement")
public class UsersMenagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		GenericDAO<Utilisateur> userDAO = new GenericDAO<Utilisateur>(Utilisateur.class);
		
		//Data
	    List<Utilisateur> listUsers = userDAO.findAll();
		
		
	    
	 // Envoi de la liste des Users à la session
        request.getSession().setAttribute("listUsers", listUsers);
	   
	 /* ==================== GESTION DELETING USER =========== */
	    String idToTrash = request.getParameter("idToTrash");
	    
	    if(idToTrash != null) {
	    	
	    	
	        int id = Integer.parseInt(idToTrash);

	        // Suppression de l'utilisateur
	        userDAO.delete(id);

	        // Remettre à jour la liste des utilisateurs depuis la base de données
	        List<Utilisateur> listUser = userDAO.findAll(); 

	        // Mettre à jour la session avec la nouvelle liste des utilisateurs
	        HttpSession session = request.getSession(false);
	        session.setAttribute("listUsers", listUser);
	    	
	    	
	    }
        
        
		
		request.getRequestDispatcher("usersMenagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    // Récupération des données
	    boolean isAdmin = request.getParameter("isAdmin") != null;
	    boolean isBlacklisted = request.getParameter("blacklisted") != null;
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    
	    HttpSession session = request.getSession(false); // false pour ne pas créer une nouvelle session si elle n'existe pas
	    
	    if(session!=null) {
	    	
	    	GenericDAO<Utilisateur> userDAO = new GenericDAO<Utilisateur>(Utilisateur.class); 
	    	
	    	Utilisateur u = new Utilisateur();
	    	 u.setNom(name);
	    	 u.setEmail(email);
	    	 u.setPassword(password);
	    	 u.setAdmin(isAdmin);  
	    	 u.setBlacklisted(isBlacklisted);
	    	
	    	    try {
	    	        // Enregistrer l'utilisateur dans la base de données
	    	        userDAO.save(u);
	    	        
	    	        List<Utilisateur> listUsers = userDAO.findAll();
	    	        
	    	        // Mise à jour de la session pour affichage dynamique de la BD
	    	        session.setAttribute("listUsers", listUsers);
	    	        
	    	    } catch (Exception e) {
	    	        // En cas d'erreur, ajouter un message d'erreur à la session
	    	        System.out.println("Enregistrement échoué cause => " + e.getMessage());
	    	    }
	    	 
	    	 
	    }
	    
	    
	    
		/* ============================== GESTION UPDATE ============ */
	    
	    if(session!=null) {
	    	
	    	GenericDAO<Utilisateur> userDAO = new GenericDAO<Utilisateur>(Utilisateur.class); 
	    	
	    	//Récupération des données envoyés par le formulare
	    	String idToUpdate = request.getParameter("idUserToUpdate");
		    String nameMod = request.getParameter("nameMod");
		    String emailMod = request.getParameter("emailMod");
		    boolean adminMod = request.getParameter("adminMod") != null;
		    boolean blacklistedMod = request.getParameter("blacklistedMod") != null;
		    
		    
		    if(idToUpdate != null && nameMod !=null && emailMod!=null ) {
		    	
		    	int id = Integer.parseInt(idToUpdate);
		    	
		    	Utilisateur user = userDAO.findById(id);
		    	
		    	user.setNom(nameMod);
		    	user.setEmail(emailMod);
		    	user.setAdmin(adminMod);
		    	user.setBlacklisted(blacklistedMod);
		    	
		    	System.out.println(user);
		    	userDAO.save(user);
		    }
	    }
	    
	    

	    
	    
	    
		
		doGet(request, response);
	}

}
