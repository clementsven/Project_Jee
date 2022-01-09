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

@WebServlet(name = "friendsRequest", value = "/friendsRequest")
public class FriendRequest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        if (req.getSession().getAttribute("username") == null) {
            this.getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }
        this.getServletContext().getRequestDispatcher("/jsp/friendsRequest.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String username = req.getParameter("hiddenUsername");
        System.out.println(username + " username");
        User u = new User(null, null, username, null, null, null, false);
        u.getOtherData();
        boolean choice = Boolean.parseBoolean(req.getParameter("radio"));
        if(u.exist()) {
            String userOrigin = (String)req.getSession().getAttribute("username");
            String mess = "";
            if(choice){
                 mess +="Congratulation " +  username + " has accepted your friend request";
                try {
                    if(!username.equalsIgnoreCase(userOrigin)){
                    Connection conn = connect();

                    PreparedStatement statement = conn.prepareStatement("DELETE FROM friends WHERE ((user_1 = ? and user_2 = ? ) or (user_1 = ? and user_2 = ? )) and status = 123");
                    statement.setString(1,username);
                    statement.setString(2, userOrigin);
                    statement.setString(3,userOrigin);
                    statement.setString(4, username);
                    statement.executeUpdate();
                    statement.close();

                    statement = conn.prepareStatement("insert into friends(user_1, user_2,status) values (?, ?,667)");
                    statement.setString(1,username);
                    statement.setString(2, userOrigin);
                    statement.executeUpdate();
                    statement.close();}
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            else{
                mess +="Looser, " +  username + " has declined your friend request";
                try {
                    Connection conn = connect();

                    PreparedStatement statement = conn.prepareStatement("DELETE FROM friends WHERE ((user_1 = ? and user_2 = ? ) or (user_1 = ? and user_2 = ? )) and status = 123");
                    statement.setString(1, username);
                    statement.setString(2, userOrigin);
                    statement.setString(3, userOrigin);
                    statement.setString(4, username);
                    statement.executeUpdate();
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            Notif ntf = new Notif(0, Date.valueOf(LocalDate.now() ), mess, userOrigin);
            ntf.save();
        }
        else {

        }
        this.getServletContext().getRequestDispatcher("/jsp/friendsRequest.jsp").forward(req, resp);





    }
    private static Connection connect() throws SQLException {
        String DB_URL = "jdbc:mysql://localhost/projetweb";
        String USER = System.getenv("USERNAME");
        String PASS = System.getenv("PASSWORD");
        try {
            // Why ?
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ignored) {
        }
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }
}
