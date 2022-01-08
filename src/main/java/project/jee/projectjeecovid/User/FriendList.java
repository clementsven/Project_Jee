package project.jee.projectjeecovid.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "friends", value = "/friends")
public class FriendList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        if (req.getSession().getAttribute("username") == null)
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);

        this.getServletContext().getRequestDispatcher("/jsp/friends.jsp").forward(req, resp);
    }
}
