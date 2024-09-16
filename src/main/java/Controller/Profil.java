package Controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Model.ENTITIES.Utilisateur;
import UTILS.GenericDAO;

@WebServlet("/Profil")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
                 maxFileSize = 1024 * 1024 * 10,      // 10 MB
                 maxRequestSize = 1024 * 1024 * 15)   // 15 MB
public class Profil extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    // Chemin de stockage des fichiers uploadés
    private static final String UPLOAD_DIR = "C:/Users/hp/Desktop/imgGames";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération de la session utilisateur
        HttpSession sessionU = request.getSession();
        Utilisateur user = (Utilisateur) sessionU.getAttribute("user");

        // Vérification de l'utilisateur connecté
        if (user != null) {
            int id = user.getId_utilisateur();
            
            // Passer les données de l'utilisateur à la page JSP
            request.setAttribute("userPhoto", user.getImage());
            request.setAttribute("userId", id);
            request.setAttribute("prenom", user.getNom());
            request.setAttribute("emailU", user.getEmail());
            request.setAttribute("pwd", user.getPassword());
        } else {
            System.out.println("Aucun utilisateur connecté.");
        }

        request.getRequestDispatcher("profil.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GenericDAO<Utilisateur> userDAO = new GenericDAO<Utilisateur>(Utilisateur.class);

        // Récupération des données du formulaire
        Part filePart = request.getPart("profileImage"); // Contenu de l'image
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String userId = request.getParameter("userId");

        // Initialisation des variables
        String fileName = null;
        boolean msVerifForm = false;

        // Vérification des champs
        if ((filePart != null && filePart.getSize() > 0) && !username.isEmpty() && !email.isEmpty() && !password.isEmpty() && userId != null) {
            
            // Traitement de l'image si uploadée
            fileName = getFileName(filePart);
            if (fileName != null && !fileName.isEmpty()) {
                // Générer un nom de fichier unique
                fileName = System.currentTimeMillis() + "_" + fileName;
                String filePath = UPLOAD_DIR + File.separator + fileName;

                // Créer le répertoire si nécessaire
                File uploadDir = new File(UPLOAD_DIR);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                    System.out.println("Dossier créé => " + uploadDir);
                }

                // Sauvegarder l'image sur le disque
                File file = new File(filePath);
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }

                // Log du chemin d'image
                System.out.println("Nom du fichier sauvegardé => " + filePath);
            }

            // Mise à jour de l'utilisateur
            int id = Integer.parseInt(userId);
            Utilisateur u = userDAO.findById(id);
            System.out.println("Utilisateur trouvé avant modification => " + u);

            u.setNom(username);
            u.setEmail(email);
            u.setPassword(password);

            // Mise à jour de l'image de l'utilisateur si uploadée
            if (fileName != null && !fileName.isEmpty()) {
                u.setImage(fileName);  // On stocke uniquement le nom du fichier
            }

            // Sauvegarde dans la base de données
            userDAO.save(u);

            // Mise à jour de la session
            HttpSession sessionU = request.getSession();
            sessionU.setAttribute("user", u);

            System.out.println("Modification réussie et session mise à jour.");
        } else {
            System.out.println("Veuillez saisir tous les champs du formulaire.");
            msVerifForm = true;
            request.setAttribute("msVerifForm", msVerifForm);
        }

        request.getRequestDispatcher("profil.jsp").forward(request, response);
    }

    // Méthode pour récupérer le nom du fichier uploadé
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String cd : contentDisposition.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
