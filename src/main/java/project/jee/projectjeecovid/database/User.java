package project.jee.projectjeecovid.database;

import org.mindrot.jbcrypt.BCrypt;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.*;

public class User extends Model{

    private String firstName;
    private String lastName;
    private String username;
    private String passHash;
    private String profilPicture;
    private Date date;
    private Boolean admin;

    public User(String firstName, String lastName, String username, String passHash, String profilPicture, String date, Boolean admin) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.passHash = passHash;
        this.profilPicture = profilPicture;
        this.date = Date.valueOf("2000-01-01");
        this.admin = admin;
    }

    @Override
    public void save() {
        try {
            String DB_URL = "jdbc:mysql://localhost/projetweb";
            String USER = System.getenv("USERNAME");
            String PASS = System.getenv("PASSWORD");
            try {
                // Why ?
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ignored) {
            }
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

            PreparedStatement statement = conn.prepareStatement("insert into users(first_name, last_name, username, pass_hash, profil_picture, birth_date, admin) values (?, ?, ?, ?, ?, ?, ?)");
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, username);
            statement.setString(4, passHash);
            statement.setString(5, profilPicture);
            statement.setDate(6, date);
            statement.setBoolean(7, admin);

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean checkLogin() {
        try {
            String DB_URL = "jdbc:mysql://localhost/projetweb";
            String USER = System.getenv("USERNAME");
            String PASS = System.getenv("PASSWORD");
            try {
                // Why ?
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ignored) {
            }
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

            PreparedStatement statement = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
            statement.setString(1, username);
            ResultSet result = statement.executeQuery();
            if(result.next()){
                String tmp_hash = result.getString("pass_hash");
                boolean tmp= BCrypt.checkpw(lastName,tmp_hash);
                statement.close();
                result.close();
                return tmp;
            }

            statement.close();
            result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public void delete() {
        System.out.println("TODO");
    }
}
