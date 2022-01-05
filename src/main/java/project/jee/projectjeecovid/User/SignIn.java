package project.jee.projectjeecovid.User;

import org.mindrot.jbcrypt.BCrypt;
import project.jee.projectjeecovid.database.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "signIn", value = "/sign-in")
public class SignIn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        this.getServletContext().getRequestDispatcher("/jsp/signin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        String hash = BCrypt.hashpw(password, BCrypt.gensalt());

        User u = new User("nop", "nop", username, hash, "nop", "nop", false);
        u.save();

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<html>");
        out.println("<body>");
        out.println("  <h1> Sign in Post </h1>");
        out.println(username);
        out.println(hash);
        out.println("</body>");
        out.println("</html>");
    }
}
