package Controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ENTITIES.Jeux;
import UTILS.GenericDAO;

@WebServlet("/Populaires")
public class Populaires extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public Populaires() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Assurez-vous que rien n'est écrit dans la réponse avant le forward
        try {
            GenericDAO<Jeux> jeuxDAO = new GenericDAO<>(Jeux.class);
            List<Map<String, Object>> popularGame = jeuxDAO.findPopularGame();

            
            HttpSession session = request.getSession(true);
            session.setAttribute("jeuxPop", popularGame);

            
            request.getRequestDispatcher("populaire.jsp").forward(request, response);

        } catch (Exception e) {
            // En cas d'erreur, vous pouvez rediriger vers une page d'erreur
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Une erreur s'est produite lors de la récupération des jeux populaires.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
