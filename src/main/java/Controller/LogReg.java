package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ENTITIES.Jeux;
import Model.ENTITIES.Utilisateur;
import Model.ENTITIES.UtilisateurJeux;
import UTILS.GenericDAO;


@WebServlet("/LogReg")
public class LogReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LogReg() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GenericDAO<Utilisateur> userDAO = new GenericDAO<Utilisateur>(Utilisateur.class);
		
		//Recupération des parametres
		String emailLog = request.getParameter("emailLog");
		String pwdLog = request.getParameter("pwdLog");
		String firstLastName = request.getParameter("firstLastName");
		String emailReg = request.getParameter("emailReg");
		String pwdReg = request.getParameter("pwdReg");
		boolean testMsgErr =  false; 
		
		//GESTION LOGIN
		if(emailLog !=null && pwdLog!=null) {
			
			Utilisateur user =  userDAO.login(emailLog, pwdLog);
			if(user!=null) {
				System.out.println(user);
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user);
				if (user.isAdmin()) {
					request.getRequestDispatcher("Dashboard").forward(request, response);
					return;
				} else {
					request.getRequestDispatcher("Index").forward(request, response);
					return;
				}
				
				
			}else {
				
				testMsgErr = true;
				request.setAttribute("testMsgErr", testMsgErr);
				request.setAttribute("errLog", "Email et ou Mot de passe invalid");
				request.getRequestDispatcher("logReg.jsp").forward(request, response);
				return ; //pour sortir aussitot
			}
		}
		
		//GESTION REGISTER
		if(firstLastName!=null && emailReg!=null && pwdReg!=null) {
			Utilisateur u = new Utilisateur();
			u.setNom(firstLastName);
			u.setEmail(emailReg);
			u.setPassword(pwdReg);
			userDAO.save(u);
			System.out.println(u);
		}
		
		request.getRequestDispatcher("logReg.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
