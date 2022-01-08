package project.jee.projectjeecovid.database;

import java.sql.*;
import java.util.ArrayList;

public class Place implements Model{

    private int id;
    private String name;
    private String address;

    public Place(int id, String name, String address) {
        this.id = id;
        this.name = name;
        this.address = address;
    }

    public static ArrayList<Place> getAllPlaces() {
        ArrayList<Place> places = new ArrayList<>();
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("SELECT * FROM place");
            statement.executeQuery();

            ResultSet resultSet = statement.getResultSet();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String adr = resultSet.getString("adress");
                Place p = new Place(id, name, adr);
                places.add(p);
            }

            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return places;
    }

    @Override
    public void save() {
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("insert into place(adress, name) values (?, ?)");
            statement.setString(1, address);
            statement.setString(2, name);

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

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }
}
