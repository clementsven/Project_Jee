package project.jee.projectjeecovid.database;

import java.sql.*;

public class ActivityPlace implements Model{

    private int idActivity;
    private int idPlace;

    public ActivityPlace(int idActivity, int idPlace) {
        this.idActivity = idActivity;
        this.idPlace = idPlace;
    }

    public static Place getPlace(int id) {
        Place p = null;
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("SELECT * FROM place INNER JOIN activity_place ON activity_place.id_place=place.id WHERE activity_place.id_activity = ?");
            statement.setInt(1, id);
            statement.executeQuery();

            ResultSet resultSet = statement.getResultSet();
            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String adr = resultSet.getString("adress");
                int idPlace = resultSet.getInt("id");
                p = new Place(idPlace, name, adr);
            }

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    public static String getPlaceName(int id) {
        String name = "NULL";
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("SELECT name FROM place INNER JOIN activity_place ON activity_place.id_place=place.id WHERE activity_place.id_activity = ?");
            statement.setInt(1, id);
            statement.executeQuery();

            ResultSet resultSet = statement.getResultSet();
            if (resultSet.next()) {
                name = resultSet.getString("name");
            }

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return name;
    }

    @Override
    public void save() {
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("insert into activity_place(id_activity, id_place) values (?, ?)");
            statement.setInt(1, idActivity);
            statement.setInt(2, idPlace);

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
