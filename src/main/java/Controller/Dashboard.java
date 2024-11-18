package Controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ENTITIES.Categorie;
import Model.ENTITIES.Commande;
import Model.ENTITIES.CommentaireJeux;
import Model.ENTITIES.Detail;
import Model.ENTITIES.Utilisateur;
import UTILS.CommentaireJeuUtilisateur;
import UTILS.GenericDAO;


@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       




	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//Total USERS
		GenericDAO<Utilisateur>userDAO = new GenericDAO<Utilisateur>(Utilisateur.class);
		
		List<Utilisateur> userList = userDAO.findAll();
		
		int nbrUsers = userList.size();
		
		//CHIFFRE D'AFFAIRE(TURNOVER)
		double chifAff = new GenericDAO<Commande>(Commande.class).getChiffreAffairesTotal();
		
		
		//MOYENNE JEUX PAR COMMANDE
		double moyJeuxByCommande = new GenericDAO<Detail>(Detail.class).getMoyenneJeuxParCommande();
		
		
		//METHODE PERMETTANT D'AVOIR LE JEU AVEC LE PLUS DE COMMENTAIRES
	    GenericDAO<CommentaireJeux> dao = new GenericDAO<CommentaireJeux>(CommentaireJeux.class);
	    Optional<Map<String, Object>> gameWithMostComments = dao.getGameWithMostComments();

	    if (gameWithMostComments.isPresent()) {
	    	
		        Map<String, Object> result = gameWithMostComments.get();
		        
		        //envoi des données à la jsp
		        request.setAttribute("titre", result.get("titre"));
		        request.setAttribute("nbCom", result.get("total_commentaires") );
		        
		        
		    } else {
		        System.out.println("Aucun jeu n'a de commentaires.");
		    }
		
		//METHODE  POUR AVOIR LE NOMBRE DE JEU TOTAL PAR CATEGORIE
	    GenericDAO<Categorie> catDAO = new GenericDAO<Categorie>(Categorie.class);
	    
	    List<Map<String, Object>> gamesByCategory = catDAO.getTotalGamesByCategory();
	    
	    
	    //METHODE POUR AFFICHAGE JEUX ET COMMENTAIRES
        GenericDAO<CommentaireJeuUtilisateur> commentaireJeuUtilisateurDao = new GenericDAO<>(CommentaireJeuUtilisateur.class);
	    
        // Récupérer les commentaires avec jeux photo user etc.
        List<CommentaireJeuUtilisateur> commentaires = commentaireJeuUtilisateurDao.findCommentairesJeuxUtilisateursdb();
        
        
        
        //REVENU POUR CHART 1 DOUGHNUT
        GenericDAO<Commande> cmdDAO = new GenericDAO<Commande>(Commande.class);
    	List<Map<String, Object>> revenuesByDate = cmdDAO.getRevenuesByDate();
    	
        // EVALUATION JEUX AND COMMENTAIRE BAR CHART
    	GenericDAO<CommentaireJeux> cmtJeuEvDAO = new GenericDAO<CommentaireJeux>(CommentaireJeux.class);
    	List<Map<String, Object>> cmtEvJeux = cmtJeuEvDAO.getJeuxWithCommentsAndEvaluations();
        
	    //ENVOI DES DONNEES A LA JSP
		request.setAttribute("nbrUser", nbrUsers);
		request.setAttribute("chiffAf", chifAff);
		request.setAttribute("moyJeuxByCommande", moyJeuxByCommande);
		request.setAttribute("gamesByCategory", gamesByCategory);
		request.setAttribute("commentaires", commentaires);	
		request.setAttribute("revenuesByDate", revenuesByDate);		
		request.setAttribute("cmtEvJeux", cmtEvJeux);
			
	    
		//Dispatcher
		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	    
	    
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
