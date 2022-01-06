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

@WebServlet(name = "LogIn", value = "/login")
public class LogIn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        req.setAttribute("check", false);
        this.getServletContext().getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User u = new User("nop", password, username,"nop", "nop", "nop", false);
        if(!u.checkLogin()) {
            req.setAttribute("check", true);
            this.getServletContext().getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
        }
        else{
            req.getSession().setAttribute("username",username);
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
