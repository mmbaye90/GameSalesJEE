package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ENTITIES.Commande;
import Model.ENTITIES.Utilisateur;
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
		
		
		
		request.setAttribute("nbrUser", nbrUsers);
		request.setAttribute("chiffAf", chifAff);
		
		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
