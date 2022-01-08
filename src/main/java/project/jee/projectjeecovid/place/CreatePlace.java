package project.jee.projectjeecovid.place;

import project.jee.projectjeecovid.database.Activity;
import project.jee.projectjeecovid.database.Place;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet(name = "newPlace", value = "/new-place")
public class CreatePlace extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        if (req.getSession().getAttribute("username") == null)
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);

        this.getServletContext().getRequestDispatcher("/jsp/new-place.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String address = req.getParameter("adr");
        String name = req.getParameter("name");

/*        boolean errName = false;
        boolean errAdr = false;

        if (errName || errAdr) {
            req.setAttribute("address", address);
            req.setAttribute("name", name);
            req.setAttribute("error_name", errName);
            req.setAttribute("error_address", errAdr);
            this.getServletContext().getRequestDispatcher("/jsp/new-place.jsp").forward(req, resp);
        }else {*/
            Place p = new Place(0, name, address);
            p.save();
            this.getServletContext().getRequestDispatcher("/jsp/places.jsp").forward(req, resp);
        //}
    }
}
