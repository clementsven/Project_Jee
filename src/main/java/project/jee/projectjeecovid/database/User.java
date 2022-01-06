package project.jee.projectjeecovid.database;

import org.mindrot.jbcrypt.BCrypt;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.*;

public class User extends Model {

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
        try {
            this.date = Date.valueOf(date);
        } catch (Exception e) {
            this.date = Date.valueOf("2000-01-01");
        }
        this.admin = admin;
    }

    @Override
    public void save() {
        try {
            Connection conn = connect();

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
            Connection conn = connect();

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
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("DELETE FROM users WHERE username = ?");
            statement.setString(1, username);
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

            PreparedStatement statement = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
            statement.setString(1, username);
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

            PreparedStatement statement = conn.prepareStatement("update users set first_name=?, last_name=?, username=?, pass_hash=?, profil_picture=?, birth_date=?, admin=? where username = ?");
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, username);
            statement.setString(4, passHash);
            statement.setString(5, profilPicture);
            statement.setDate(6, date);
            statement.setBoolean(7, admin);
            statement.setString(8, username);

            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void getOtherData() {
        try {
        Connection conn = connect();

        PreparedStatement statement = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
        statement.setString(1, username);
        ResultSet result = statement.executeQuery();
        if (result.next()) {
            System.out.println("result");
            firstName = result.getString("first_name");
            lastName = result.getString("last_name");
            date = result.getDate("birth_date");
            passHash = result.getString("pass_hash");
            admin = result.getBoolean("admin");
            profilPicture = result.getString("profil_picture");
        }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUsername(String username) {
        System.out.println("0 " + passHash);
        getOtherData();
        System.out.println("1 " + passHash);
        delete();
        System.out.println("2 " + passHash);
        this.username = username;
        save();
        System.out.println("3 " + passHash);
    }

    private Connection connect() throws SQLException {
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

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getUsername() {
        return username;
    }

    public String getPassHash() {
        return passHash;
    }

    public String getProfilPicture() {
        return profilPicture;
    }

    public Date getDate() {
        return date;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassHash(String passHash) {
        this.passHash = passHash;
    }

    public void setProfilPicture(String profilPicture) {
        this.profilPicture = profilPicture;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void setDate(String date) {
        try {
            this.date = Date.valueOf(date);
        } catch (Exception e) {
            this.date = Date.valueOf("2000-01-01");
        }
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }
}
