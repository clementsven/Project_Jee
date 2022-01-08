package project.jee.projectjeecovid.activity;

import project.jee.projectjeecovid.database.Activity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet(name = "NewActivity", value = "/new-activity")
public class CreateActivity extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        if (req.getSession().getAttribute("username") == null)
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);

        this.getServletContext().getRequestDispatcher("/jsp/new-activity.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dateBeginStr = req.getParameter("date_start");
        String dateEndStr = req.getParameter("date_end");
        String name = req.getParameter("name");

        boolean wrongDateBegin;
        try {
            Date d = Date.valueOf(dateBeginStr);
            LocalDate ldt = LocalDate.now();
            Date now = Date.valueOf(ldt);
            wrongDateBegin = d.before(now);
        } catch (Exception e) {
            System.out.println(e);
            wrongDateBegin = true;
        }

        boolean wrongDateEnd;
        try {
            Date db = Date.valueOf(dateBeginStr);
            Date de = Date.valueOf(dateEndStr);
            LocalDate ldt = LocalDate.now();
            Date now = Date.valueOf(ldt);
            wrongDateEnd = de.before(db);
        } catch (Exception e) {
            System.out.println(e);
            wrongDateEnd = true;
        }

        if (wrongDateBegin || wrongDateEnd) {
            req.setAttribute("date_start", dateBeginStr);
            req.setAttribute("date_end", dateEndStr);
            req.setAttribute("name", name);
            req.setAttribute("error_date_begin", wrongDateBegin);
            req.setAttribute("error_date_end", wrongDateEnd);
            this.getServletContext().getRequestDispatcher("/jsp/new-activity.jsp").forward(req, resp);
        }else {
            Date dateBegin = Date.valueOf(dateBeginStr);
            Date dateEnd = Date.valueOf(dateEndStr);
            String creator = (String) req.getSession().getAttribute("username");
            Activity activity = new Activity(0, creator, dateBegin, dateEnd, name);
            activity.save();
            this.getServletContext().getRequestDispatcher("/jsp/activity.jsp").forward(req, resp);
        }
    }
}
