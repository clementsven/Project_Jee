package project.jee.projectjeecovid.notif;

import project.jee.projectjeecovid.database.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;

@WebServlet(name = "notifCovid", value = "/notif-covid")
public class NotifCovid extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        if (req.getSession().getAttribute("username") == null || (req.getSession().getAttribute("covid") != null && (boolean)req.getSession().getAttribute("covid"))) {
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        String username = (String) req.getSession().getAttribute("username");

        User currentUser = new User(null , null, username, null, null, null, false);
        currentUser.getOtherData();
        ArrayList<User> users = (ArrayList<User>) currentUser.getAllFriend();
        HashSet<User> usersSet = new HashSet<>(users);

        ArrayList<Activity> tmpActivities = Activity.getAllUserActivities(currentUser.getUsername());
        ArrayList<Activity> activities = new ArrayList<>();

        Date now = Date.valueOf(LocalDate.now());
        Date lastWeek = Date.valueOf(LocalDate.now().minusDays(7));

        for (Activity a: tmpActivities) {
            if (a.getDateBegin().compareTo(now) < 0 || a.getDateEnd().compareTo(lastWeek) > 0) {
                activities.add(a);
            }
        }

        HashSet<Place> places = new HashSet<>();
        for (Activity a: activities) {
            Place p = ActivityPlace.getPlace(a.getId());
            places.add(p);
        }

        tmpActivities = Activity.getAllActivities();
        for (Activity a: tmpActivities) {
            for (Activity b: activities) {
                if (a.getDateEnd().compareTo(b.getDateBegin()) > 0 || a.getDateBegin().compareTo(b.getDateEnd()) < 0) {
                    Place tmpPlace = ActivityPlace.getPlace(a.getId());
                    Place place = ActivityPlace.getPlace(b.getId());
                    if (place != null && tmpPlace != null && place.getId() == tmpPlace.getId()) {
                        User u = new User(null , null, a.getCreator(), null, null, null, false);
                        u.getOtherData();
                        usersSet.add(u);
                    }
                }
            }
        }

        for(User u: usersSet) {
            if (u.getUsername().compareTo(currentUser.getUsername()) == 0) {
                continue;
            }
            String msg = currentUser.getUsername() + " get coroned ! Make sure to check if you don't have it too !";
            Notif ntf = new Notif(0, Date.valueOf(LocalDate.now() ), msg, u.getUsername());
            ntf.save();
        }

        req.getSession().setAttribute("covid", true);
        this.getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
