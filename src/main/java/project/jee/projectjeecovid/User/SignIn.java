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
import java.sql.Date;
import java.time.LocalDate;

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
        String first_name = req.getParameter("first_name");
        String last_name = req.getParameter("last_name");
        String dateStr = req.getParameter("date");

        String hash = BCrypt.hashpw(password, BCrypt.gensalt());

        User u = new User(first_name , last_name, username, hash, null, dateStr, false);
        boolean userExist = u.exist();

        boolean wrongDate = false;
        try {
            Date d = Date.valueOf(dateStr);
            LocalDate ldt = LocalDate.now();
            Date now = Date.valueOf(ldt);
            wrongDate = d.after(now);
        } catch (Exception e) {
            System.out.println(e);
            wrongDate = true;
        }

        boolean passLengthError = password.length() < 8;

        if (userExist || wrongDate || passLengthError) {
            req.setAttribute("username", username);
            req.setAttribute("password", password);
            req.setAttribute("first_name", first_name);
            req.setAttribute("last_name", last_name);
            req.setAttribute("date", dateStr);
            req.setAttribute("error_user", userExist);
            req.setAttribute("error_date", wrongDate);
            req.setAttribute("error_length", passLengthError);
            this.getServletContext().getRequestDispatcher("/jsp/signin.jsp").forward(req, resp);
        }else {
            u.save();
            resp.setContentType("text/html");
            PrintWriter out = resp.getWriter();
            out.println("<html>");
            out.println("<body>");
            out.println("  <h1> Sign in Post </h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
