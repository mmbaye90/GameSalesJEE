package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jdbc.naming.GenericNamingResourcesFactory;

import Model.ENTITIES.Commentaire;
import UTILS.CommentaireJeuUtilisateur;
import UTILS.GenericDAO;

/**
 * Servlet implementation class MsgMenagement
 */
@WebServlet("/MsgMenagement")
public class MsgMenagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MsgMenagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 //METHODE POUR AFFICHAGE JEUX ET COMMENTAIRES
        GenericDAO<CommentaireJeuUtilisateur> commentaireJeuUtilisateurDao = new GenericDAO<>(CommentaireJeuUtilisateur.class);
	    
        // Récupérer les commentaires avec jeux photo user etc.
        List<CommentaireJeuUtilisateur> commentaires = commentaireJeuUtilisateurDao.findCommentairesJeuxUtilisateurs();
       
        request.setAttribute("commentaires", commentaires);	
        
        //RECUPERER LES PARAMS idToUpdate
        String idToTrash = request.getParameter("idToTrash");
        String action  = request.getParameter("action");
        String idToUpdate = request.getParameter("idToUpdate");
        String contenu = request.getParameter("contenu");
        
        //GESTION MODIFICATION
        if( idToUpdate!=null && contenu!=null) {
        	
        	//System.out.println(contenu+idToUpdate);
        	GenericDAO<Commentaire> cDAO = new GenericDAO<Commentaire>(Commentaire.class);
        	
        	Commentaire c = cDAO.findById(Integer.parseInt(idToUpdate));
        	
        	c.setContenu(contenu);
        	
        	cDAO.save(c);
        	
        	System.out.println("SAUVEGARDE REUSSIE !!!");
        	
        	//REMISE A JOUR DE L'AFFICHAGE
            List<CommentaireJeuUtilisateur> commentairesR = commentaireJeuUtilisateurDao.findCommentairesJeuxUtilisateurs();
           
            request.setAttribute("commentaires", commentairesR);
        		
        }
        
        
        //GESTION SUPPRESSION COMMENTAIRE
        if(idToTrash != null) {
        	
        	GenericDAO<Commentaire> cDAO = new GenericDAO<Commentaire>(Commentaire.class);
        	Commentaire c = cDAO.findById(Integer.parseInt(idToTrash));
        	
        	System.out.println(c);
        }
        
        
        //GESTION STATUT COMMENTAIRE
        if(action != null) {
        	
        	switch (action ) {
     		case "accepter": {
     			
     			int id = Integer.parseInt(request.getParameter("idAccepte"));
     			
     			GenericDAO<Commentaire> cDAO = new GenericDAO<Commentaire>(Commentaire.class);
            	
     			Commentaire c = cDAO.findById(id);
            	
            	c.setAccepte(true);
            	
            	cDAO.save(c);
            	
            	//REMISE A JOUR DE L'AFFICHAGE
                List<CommentaireJeuUtilisateur> commentairesR = commentaireJeuUtilisateurDao.findCommentairesJeuxUtilisateurs();
               
                request.setAttribute("commentaires", commentairesR);
                
     			break;
     		}
     		
     		case "rejeter" :{
     			
     			int id = Integer.parseInt(request.getParameter("idRejete"));
     			
     			GenericDAO<Commentaire> cDAO = new GenericDAO<Commentaire>(Commentaire.class);
            	
     			Commentaire c = cDAO.findById(id);
            	
            	c.setAccepte(false);
            	
            	cDAO.save(c);
            	
            	//REMISE A JOUR DE L'AFFICHAGE
                List<CommentaireJeuUtilisateur> commentairesR = commentaireJeuUtilisateurDao.findCommentairesJeuxUtilisateurs();
               
                request.setAttribute("commentaires", commentairesR);
     			break;
     		}
     		default:
     			throw new IllegalArgumentException("Unexpected value: " + action);
     		}
        }
       
        
        
        
		request.getRequestDispatcher("msgMenagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
