package project.jee.projectjeecovid.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;



@WebServlet(name = "deleteFriends", value = "/deleteFriends")
public class DeleteFriends extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("test je passe dans verife ");
        String username = (String)req.getSession().getAttribute("username");
        String userOrigin = req.getParameter("userToDelete");
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("DELETE FROM friends WHERE ((user_1 = ? and user_2 = ? ) or (user_1 = ? and user_2 = ? )) and status = 667");
            statement.setString(1, username);
            statement.setString(2, userOrigin);
            statement.setString(3, userOrigin);
            statement.setString(4, username);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        this.getServletContext().getRequestDispatcher("/jsp/friends.jsp").forward(req, resp);
        return;
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
