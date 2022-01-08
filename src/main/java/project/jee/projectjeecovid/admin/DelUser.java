package project.jee.projectjeecovid.admin;

import project.jee.projectjeecovid.database.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "delUser", value = "/del-user")
public class DelUser extends HttpServlet {

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

        String name = req.getParameter("user");
        System.out.println("name: " + name);
        u = new User(null, null, name, null, null, null, false);
        u.getOtherData();
        u.delete();

        this.getServletContext().getRequestDispatcher("/jsp/users.jsp").forward(req, resp);
    }
}
