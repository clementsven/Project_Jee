package project.jee.projectjeecovid.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Friend implements Model{
    private String user1;
    private String user2;

    public Friend(String u1,String u2){
        this.user1 = u1;
        this.user2 = u2;
    }
    @Override
    public void save() {
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("insert into friends(user_1, user_2,status) values (?, ?,123)");
            statement.setString(1, user1);
            statement.setString(2, user2);

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete() {

    }

    @Override
    public boolean exist() {
        return false;
    }

    @Override
    public void update() {

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
