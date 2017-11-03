package com.travelshare.model;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.travelshare.util.Encrypter;
import com.travelshare.util.UserException;

@Component
public class UserDAO {

	private static final String INSERT_USER_SQL = "INSERT INTO users VALUES (null, ?,?,?,?,?,?)";
	//private static final String CHECK_FOR_EMAIL = "SELECT user_id from users WHERE user_email LIKE ?%";
	private static final String SELECT_USER_SQL = "SELECT user_id FROM users WHERE email = ? AND password = ?";
	private static final String GET_USER_FROM_SQL = "SELECT user_id, username, password, first_name, last_name, avatar_url FROM users WHERE email = ?";
	private static final String DELETE_USER_ACCOUNT = "DELETE FROM users WHERE email = ?";


	private static UserDAO instance;
	private UserDAO(){}

	public static synchronized UserDAO getInstance(){
		if(instance == null){
			instance = new UserDAO();
		}
		return instance;
	}

	public void addProfilePic(User u) throws SQLException {
		Connection connection = DBConnection.getInstance().getConnection();		  
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement("UPDATE users SET avatar_url = ? WHERE user_id = ?");
			ps.setString(1, u.getPictureURL());
			ps.setLong(2, u.getUserID());
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			System.out.println("Adding picture url failed!" + e.getMessage());
			throw e;
		}

	}

	public boolean registerUser(User user) throws UserException {
		Connection connection = DBConnection.getInstance().getConnection();

		try {
			PreparedStatement ps = connection.prepareStatement(INSERT_USER_SQL, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, user.getUsername());
			ps.setString(2, Encrypter.encrypt(user.getPassword()));
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getFirstName());
			ps.setString(5, user.getLastName());
			ps.setString(6, null);

			ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			user.setUserID(rs.getInt(1));
			new File("/Users/Mumko/Desktop/images/POSTS/"+user.getUserID()).mkdir();
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("User cannot be registered now, please try again later!", e);

		}
	}

	public boolean checkForUser(String email, String password) throws UserException {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(SELECT_USER_SQL, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, email);
			ps.setString(2, Encrypter.encrypt(password));
			ps.executeQuery();
			ResultSet rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1) > 0;
		} catch (SQLException e) {
			return false;
		}
	}			

	public User getUser(String email) throws SQLException{
		Connection con = DBConnection.getInstance().getConnection();
		PreparedStatement ps = con.prepareStatement(GET_USER_FROM_SQL);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		rs.next();

		User user = new User(
				rs.getInt("user_id"), 
				rs.getString("username"), 
				rs.getString("password"), 
				rs.getString("first_name"),
				rs.getString("last_name"),
				rs.getString("avatar_url"));

		return user;
	}

	public boolean checkForEmail(String email) {
		final String CHECK_FOR_EMAILS = "SELECT user_id from users WHERE email LIKE '"+ email + "%'";
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(CHECK_FOR_EMAILS, Statement.RETURN_GENERATED_KEYS);
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(CHECK_FOR_EMAILS);
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean deleteAccount (String email, String password) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		try {
			if(checkForUser(email, password)) {
				ps = connection.prepareStatement(DELETE_USER_ACCOUNT);
				ps.setString(1, email);
				ps.executeUpdate();
//				if(checkForUser(email, password)) {
//					System.err.println("Neshto ne se iztri");
//					return false;
//				}
				System.err.println("USER DELETED");
				return true;
			}
		} catch (UserException | SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
	}

	public int getUserID(String email) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		int id = 0;
		try {
			ps = connection.prepareStatement("SELECT user_id FROM users WHERE email = ?", Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, email);
			ps.executeQuery();
			ResultSet rs = ps.executeQuery();
			rs.next();
			System.err.println("USER ID " + rs.getInt(1));
			id = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return id;
	}

	public boolean changeFirstName (String name, int userID) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;

		try {
			ps = connection.prepareStatement("UPDATE users SET first_name = ? WHERE user_id = ?");
			ps.setString(1, name);
			ps.setInt(2, userID);
			ps.executeUpdate();
			int result = ps.executeUpdate();
			if(result > 0) {
				System.err.println("USER FIRST NAME UPDATED");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
	}

	public boolean changeLastName (String name, int userID) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;

		try {
			ps = connection.prepareStatement("UPDATE users SET last_name = ? WHERE user_id = ?");
			ps.setString(1, name);
			ps.setInt(2, userID);
			ps.executeUpdate();
			int result = ps.executeUpdate();
			if(result > 0) {
				System.err.println("USER LAST UPDATED");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
	}

	public boolean changeUsername (String username, int userID) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;

		try {
			//da napravq proverka syshtestvuva li veche
			ps = connection.prepareStatement("UPDATE users SET username = ? WHERE user_id = ?");
			ps.setString(1, username);
			ps.setInt(2, userID);
			ps.executeUpdate();
			int result = ps.executeUpdate();
			if(result > 0) {
				System.err.println("USER USERNAME UPDATED");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
	}

	public boolean changeEmail (String email, int userID) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		
		try {
			//da proverya syshtestvuva li emaila
			ps = connection.prepareStatement("UPDATE users SET email = ? WHERE user_id = ?");
			ps.setString(1, email);
			ps.setInt(2, userID);
			ps.executeUpdate();
			int result = ps.executeUpdate();
			if(result > 0) {
				System.err.println("USER EMAIL UPDATED");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
	}

	public boolean changePassword (String newPassword, int userID) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;

		try {
			ps = connection.prepareStatement("UPDATE users SET password = ? WHERE user_id = ?");
			ps.setString(1, Encrypter.encrypt(newPassword));
			ps.setInt(2, userID);
			ps.executeUpdate();
			int result = ps.executeUpdate();
			if(result > 0) {
				System.err.println("USER PASSWORD UPDATED");
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
	}

	public boolean changeAvatarURL (String URL, int userID) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;

		try {
			ps = connection.prepareStatement("UPDATE users SET avatar_url = ? WHERE user_id = ?");
			ps.setString(1, URL);
			ps.setInt(2, userID);
			ps.executeUpdate();
			int result = ps.executeUpdate();
			if(result > 0) {
				System.err.println("USER AVATAR URL UPDATED " + URL);
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("NO SUCH USER");
		return false;
	}

	public User getTopUsers () {
		System.err.println("V METODA SYM!!!!!!!!!!!!!!!!");
		Connection connection = DBConnection.getInstance().getConnection();
		User user = new User();
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery( "SELECT * FROM users ORDER BY avatar_url ASC" );
			System.err.println("V METODA SYM!!!!!!!!!!!!!!!!");
			while ( rs.next() || user.getPosts().size()<5) {
				System.out.println("USER-A " + UserDAO.getInstance().getUser(rs.getString("email")));
				user.getPosts().add(UserDAO.getInstance().getUser(rs.getString("email")));
				//user.getPosts().add(rs.getString("user_pictureURL"));
				System.out.println("TUKA VLIZA LI IZOBSHTO " + rs.getString("email"));
			}		 			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	public synchronized void followUser(int followerId, int followedId) {
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		try {
			ps=connection.prepareStatement("INSERT INTO users_has_followers (user_id, users_follower_id) VALUES (?, ?)");
			ps.setInt(1, followedId);
			ps.setInt(2, followerId);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("NE MOVE DA SE SLEDWA ");
			e.printStackTrace();
		}
	}
	
	
	
	public synchronized void unfollowUser(int followerId, int followedId) throws SQLException{
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		try {
		ps=connection.prepareStatement("DELETE FROM users_has_followers WHERE user_id=? AND users_follower_id=?");
		ps.setInt(1, followedId);
		ps.setInt(2, followerId);
		ps.executeUpdate();
	
	} catch (SQLException e) {
		System.out.println("NE MOVE DA SE Premahne SLEDWANE ");
		e.printStackTrace();
	}
}
	
	
	
	
	
	
	
	
	
	
	
	
}
