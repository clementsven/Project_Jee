package project.jee.projectjeecovid.User;

import project.jee.projectjeecovid.database.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet(name = "profil", value = "/profil")
public class Profil extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        if (req.getSession().getAttribute("username") == null)
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        User u = new User(null, null, (String) req.getSession().getAttribute("username"), null, null, null, false);
        u.getOtherData();
        req.setAttribute("username", u.getUsername());
        req.setAttribute("first_name", u.getFirstName());
        req.setAttribute("last_name", u.getLastName());
        req.setAttribute("date", u.getDate());
        this.getServletContext().getRequestDispatcher("/jsp/profil.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String first_name = req.getParameter("first_name");
        String last_name = req.getParameter("last_name");
        String dateStr = req.getParameter("date");

        String userSession = (String) req.getSession().getAttribute("username");
        if (userSession == null) {
            userSession = "";
        }

        User u = new User(null , null, userSession, null, null, null, false);
        u.getOtherData();
        u.setFirstName(first_name);
        u.setLastName(last_name);
        u.setDate(dateStr);

        User tmpUser = new User(null , null, username, null, null, null, false);
        boolean userExist = tmpUser.exist() && (userSession.compareTo(username) != 0);

        boolean wrongDate;
        try {
            Date d = Date.valueOf(dateStr);
            LocalDate ldt = LocalDate.now();
            Date now = Date.valueOf(ldt);
            wrongDate = d.after(now);
        } catch (Exception e) {
            System.out.println(e);
            wrongDate = true;
        }

        if (!wrongDate && !userExist) {
            u.update();
            // System.out.println(username + "  " + u.getUsername() + "  " + userSession);
            /*if (username.compareTo(u.getUsername()) != 0) {
                u.updateUsername(username);
                req.getSession().setAttribute("username",username);
                System.out.println("update");
            }*/
        }

        req.setAttribute("username", username);
        req.setAttribute("first_name", first_name);
        req.setAttribute("last_name", last_name);
        req.setAttribute("date", dateStr);
        req.setAttribute("error_user", userExist);
        req.setAttribute("error_date", wrongDate);
        this.getServletContext().getRequestDispatcher("/jsp/profil.jsp").forward(req, resp);
    }
}
