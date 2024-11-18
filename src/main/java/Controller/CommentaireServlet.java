package Controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.ENTITIES.Commentaire;
import Model.ENTITIES.CommentaireJeux;
import Model.ENTITIES.Utilisateur;
import UTILS.CommentaireJeuUtilisateur;
import UTILS.GenericDAO;

@WebServlet("/CommentaireServlet")
public class CommentaireServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // DAO pour les tables commentaire et commentairejeux
        GenericDAO<Commentaire> commentaireDao = new GenericDAO<>(Commentaire.class);
        GenericDAO<CommentaireJeux> commentaireJeuxDao = new GenericDAO<>(CommentaireJeux.class);
        GenericDAO<CommentaireJeuUtilisateur> commentaireJeuUtilisateurDao = new GenericDAO<>(CommentaireJeuUtilisateur.class);

        // Récupération des données envoyées par l'utilisateur
        String contenuCom = request.getParameter("contenu");
        String idJeuxreq= request.getParameter("id_jeux");
        
        int idUtilisateur = 1; 

        if (contenuCom != null && idJeuxreq!=null) {
        	int idJeux = Integer.parseInt(idJeuxreq);
            // Créer un nouveau commentaire
            Commentaire nouveauCommentaire = new Commentaire();
            nouveauCommentaire.setContenu(contenuCom);
            nouveauCommentaire.setStatut_com(true);  // Statut par défaut, peut être ajusté selon votre logique
            nouveauCommentaire.setId_utilisateur(idUtilisateur);  // ID de l'utilisateur

            // Insérer le commentaire dans la table commentaire
            int idCommentaireInsere = commentaireDao.insertCommentaireAndGetId(nouveauCommentaire);

            if (idCommentaireInsere != -1) {
                System.out.println("Commentaire inséré avec succès, ID : " + idCommentaireInsere);

                // Maintenant insérer dans la table commentairejeux
                CommentaireJeux commentaireJeux = new CommentaireJeux();
                commentaireJeux.setId_commentaire(idCommentaireInsere);  // ID du commentaire inséré
                commentaireJeux.setId_jeux(idJeux);  // ID du jeu sélectionné

                commentaireJeuxDao.save(commentaireJeux);  // Insérer dans la table commentairejeux

                System.out.println("Association Commentaire-Jeu insérée avec succès.");
            } else {
                System.out.println("Échec de l'insertion du commentaire.");
            }
        }

        // Récupérer les commentaires mis à jour
        List<CommentaireJeuUtilisateur> commentaires = commentaireJeuUtilisateurDao.findCommentairesJeuxUtilisateurs();
        
        // Passer les commentaires mis à jour à la JSP
        request.setAttribute("commentairesJeuxUtilisateurs", commentaires);

        // Rediriger vers la JSP des commentaires
        request.getRequestDispatcher("commentairejsp.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
