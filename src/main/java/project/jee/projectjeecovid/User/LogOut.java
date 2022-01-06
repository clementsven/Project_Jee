package project.jee.projectjeecovid.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "logOut", value = "/log-out")
public class LogOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        req.getSession().removeAttribute("username");
        req.getSession().removeAttribute("passhash");

        this.getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
