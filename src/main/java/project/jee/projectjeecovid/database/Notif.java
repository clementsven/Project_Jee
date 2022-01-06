package project.jee.projectjeecovid.database;

import java.sql.*;
import java.util.ArrayList;

public class Notif extends Model {

    private int id;
    private Date date;
    private String msg;
    private String username;

    public Notif(int id, Date date, String msg, String username) {
        this.id = id;
        this.date = date;
        this.msg = msg;
        this.username = username;
    }

    public static ArrayList<Notif> getAllUserNotif(String user) {
        ArrayList<Notif> notifs = new ArrayList<>();
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("SELECT * FROM notif WHERE username = ?");
            statement.setString(1, user);
            statement.executeQuery();

            ResultSet resultSet = statement.getResultSet();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Date date = resultSet.getDate("date");
                String msg = resultSet.getString("msg");
                Notif n = new Notif(id, date, msg, user);
                notifs.add(n);
            }

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notifs;
    }

    @Override
    public void save() {
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("insert into notif(date, msg, username) values (?, ?, ?)");
            statement.setDate(1, date);
            statement.setString(2, msg);
            statement.setString(3, username);

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete() {
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("DELETE FROM notif WHERE id = ?");
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean exist() {
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("SELECT * FROM notif WHERE id = ?");
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            boolean exist = result.next();
            statement.close();
            result.close();
            return exist;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public void update() {
        if (!exist())
            return;
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("update notif set msg=?, date=?, username=? where id = ?");
            statement.setString(1, msg);
            statement.setDate(2, date);
            statement.setString(3, username);
            statement.setInt(4, id);

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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

    public int getId() {
        return id;
    }

    public Date getDate() {
        return date;
    }

    public String getMsg() {
        return msg;
    }

    public String getUsername() {
        return username;
    }
}
