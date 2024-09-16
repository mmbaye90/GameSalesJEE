package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/images/*")
public class ImageServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	
	private static final String BASE_DIR = "C:/Users/hp/Desktop/imgGames"; // Chemin absolu

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestedImage = request.getPathInfo(); // /1726377841064_bbContent.png
        File image = new File(BASE_DIR, requestedImage);
        
        if (!image.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404
            return;
        }

        response.setContentType(getServletContext().getMimeType(image.getName()));
        response.setContentLength((int) image.length());

        Files.copy(image.toPath(), response.getOutputStream());
    }
}
