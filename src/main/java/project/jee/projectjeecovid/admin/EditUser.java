package project.jee.projectjeecovid.admin;

import project.jee.projectjeecovid.database.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "editUser", value = "/edit-user")
public class EditUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        if (req.getSession().getAttribute("username") == null) {
            this.getServletContext().getRequestDispatcher("/error_404.jsp").forward(req, resp);
            return;
        }

        User u = new User(null, null, (String) req.getSession().getAttribute("username"), null, null, null, false);
        u.getOtherData();
        if (!u.getAdmin()) {
            this.getServletContext().getRequestDispatcher("/error_404.jsp").forward(req, resp);
            return;
        }

        String name = req.getParameter("username");
        u = new User(null, null, name, null, null, null, false);
        u.getOtherData();
        req.setAttribute("username", u.getUsername());
        req.setAttribute("first_name", u.getFirstName());
        req.setAttribute("last_name", u.getLastName());
        req.setAttribute("date", u.getDate());
        this.getServletContext().getRequestDispatcher("/jsp/edit-user.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String first_name = req.getParameter("first_name");
        String last_name = req.getParameter("last_name");
        String dateStr = req.getParameter("date");

        User u = new User(null , null, username, null, null, null, false);
        u.getOtherData();
        u.setFirstName(first_name);
        u.setLastName(last_name);
        u.setDate(dateStr);

        u.update();

        req.setAttribute("username", username);
        req.setAttribute("first_name", first_name);
        req.setAttribute("last_name", last_name);
        req.setAttribute("date", dateStr);
        this.getServletContext().getRequestDispatcher("/jsp/profil.jsp").forward(req, resp);
    }
}
