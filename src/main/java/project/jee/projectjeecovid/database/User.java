package project.jee.projectjeecovid.database;

import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class User implements Model {

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

    public static ArrayList<User> getAllUser() {
        ArrayList<User> users = new ArrayList<>();
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("SELECT * FROM users");
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                String firstname = result.getString("first_name");
                String lastname = result.getString("last_name");
                String username = result.getString("username");
                String pass_hash = result.getString("pass_hash");
                String profilpicture = result.getString("profil_picture");
                String birthdate = result.getString("birth_date");
                boolean admin = result.getBoolean("admin");
                User u = new User(firstname, lastname, username, pass_hash, profilpicture, birthdate, admin);
                users.add(u);
            }

            statement.close();
            result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
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
            if (result.next()) {
                String tmp_hash = result.getString("pass_hash");
                boolean tmp = BCrypt.checkpw(lastName, tmp_hash);
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
    public List<User> getAllHalfFriend() {
        List<User> listUser = new ArrayList<>();
        try {
            Connection conn = connect();
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM friends WHERE (user_1 like ? or user_2 like ? ) and status = 123");
            statement.setString(1, username);
            statement.setString(2, username);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                String tmp = result.getString("user_2");
                if (username.equalsIgnoreCase(tmp))
                    listUser.add(this.getUser(result.getString("user_1")));
                else
                    listUser.add(this.getUser(result.getString("user_2")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listUser;
    }

    public List<User> getAllFriend() {
        List<User> listUser = new ArrayList<>();
        try {
            Connection conn = connect();
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM friends WHERE (user_1 like ? or user_2 like ? ) and status = 667");
            statement.setString(1, username);
            statement.setString(2, username);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                String tmp = result.getString("user_1");

                if (username.equalsIgnoreCase(tmp))
                    listUser.add(this.getUser(result.getString("user_2")));
                else
                    listUser.add(this.getUser(result.getString("user_1")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listUser;
    }

    public User getUser(String username) {
        User u = null;
        try {
            Connection conn = connect();

            PreparedStatement statement = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
            statement.setString(1, username);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                u = new User(null, null, username, null, null, null, false);
                u.getOtherData();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
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

//    public String getPassHash() {
//        return passHash;
//    }

//    public String getProfilPicture() {
//        return profilPicture;
//    }

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

//    public void setPassHash(String passHash) {
//        this.passHash = passHash;
//    }

//    public void setProfilPicture(String profilPicture) {
//        this.profilPicture = profilPicture;
//    }

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

//    public void setAdmin(Boolean admin) {
//        this.admin = admin;
//    }
}
