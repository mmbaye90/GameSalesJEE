package Controller;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/Recommande")
public class Recommande extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Recommande() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		GenericDAO<Jeux> jeuxDAO = new GenericDAO<>(Jeux.class);
		List<Map<String, Object>> recommandedGame = jeuxDAO.findRecommanded();

		HttpSession session = request.getSession(true);
		session.setAttribute("jeuxRecom", recommandedGame);


		request.getRequestDispatcher("recommande.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
