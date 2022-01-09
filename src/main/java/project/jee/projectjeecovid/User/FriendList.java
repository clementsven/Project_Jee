package project.jee.projectjeecovid.User;

import project.jee.projectjeecovid.database.Friend;
import project.jee.projectjeecovid.database.Notif;
import project.jee.projectjeecovid.database.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

@WebServlet(name = "friends", value = "/friends")
public class FriendList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        if (req.getSession().getAttribute("username") == null)
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);

        this.getServletContext().getRequestDispatcher("/jsp/friends.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String username = req.getParameter("username");
        User u = new User(null, null, username, null, null, null, false);
        u.getOtherData();
        boolean verif = Boolean.parseBoolean(req.getParameter("verifDelete"));


        if (u.exist()) {

            String userOrigin = (String) req.getSession().getAttribute("username");
            String mess = "WOW, " + username + " wish to become your friend!!";
            Notif ntf = new Notif(0, Date.valueOf(LocalDate.now()), mess, userOrigin);
            Friend frd = new Friend(username, userOrigin);
            frd.save();
            ntf.save();
            req.setAttribute("error", false);
        } else {
            System.out.println("4");
            req.setAttribute("error", true);
        }
        this.getServletContext().getRequestDispatcher("/jsp/friends.jsp").forward(req, resp);
    }


}
