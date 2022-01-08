package project.jee.projectjeecovid.database;

import java.sql.*;
import java.util.ArrayList;

public class Activity implements Model{

    private int id;
    private String creator;
    private Date dateBegin;
    private Date dateEnd;
    private String name;

    public Activity(int id, String creator, Date date_begin, Date date_end, String name) {
        this.id = id;
        this.creator = creator;
        this.dateBegin = date_begin;
        this.dateEnd = date_end;
        this.name = name;
    }

    public static ArrayList<Activity> getAllUserActivities(String user) {
        ArrayList<Activity> activities = new ArrayList<>();
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("SELECT * FROM activity WHERE creator = ?");
            statement.setString(1, user);
            statement.executeQuery();

            ResultSet resultSet = statement.getResultSet();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Date date_begin = resultSet.getDate("date_begin");
                Date date_end = resultSet.getDate("date_end");
                String name = resultSet.getString("name");
                Activity a = new Activity(id, user, date_begin, date_end, name);
                activities.add(a);
            }

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return activities;
    }

    @Override
    public void save() {
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("insert into activity(creator, date_begin, date_end, name) values (?, ?, ?, ?)");
            statement.setString(1, creator);
            statement.setDate(2, dateBegin);
            statement.setDate(3, dateEnd);
            statement.setString(4, name);

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

    public int getId() {
        return id;
    }

    public String getCreator() {
        return creator;
    }

    public Date getDateBegin() {
        return dateBegin;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public String getName() {
        return name;
    }
}
