package com.travelshare.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import com.travelshare.util.UserException;



public class PostDAO {


	private static PostDAO instance;

	public PostDAO(){}

	public static synchronized PostDAO getInstance(){
		if(instance==null){
			instance=new PostDAO();
		}
		return instance;
	}


	private static final String INSERT_POST_SQL = "INSERT INTO posts VALUES (null,?,?,?,?,?,?,?)";
	private static final String INSERT_ATTACHMENT_SQL = "INSERT INTO attachments VALUES (null,?,?,?,?,?)";
	private static final String GET_ATTACHMENT_FROM_SQL = "SELECT * FROM attachments WHERE post_id =?";
	//private static final String GET_POST_ID = "SELECT post_id FROM attachments WHERE attachment_id =?"
	private static final String DELETE_POST = "DELETE FROM posts WHERE post_id = ?";

	//SELECT post_id FROM attachments WHERE attachment_id =
	public int createPost(Post post, String URL) throws UserException {
		Connection connection = DBConnection.getInstance().getConnection();	
		try {
			PreparedStatement ps = connection.prepareStatement(INSERT_POST_SQL, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, post.getTitle());
			ps.setString(2, post.getDescription());
			ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			ps.setInt(5, post.getCategory_id());
			ps.setInt(6, post.getUser_id());
			ps.setString(7, post.getLocation());
			ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			rs.next();
			post.setPostId(rs.getInt(1));

			//ATACHMENT PART
			Attachment a = new Attachment();
			ps = connection.prepareStatement(INSERT_ATTACHMENT_SQL, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, post.getTitle());
			ps.setString(2, post.getDescription());
			ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			ps.setInt(4, post.getPostId());
			ps.setString(5, URL);
			ps.executeUpdate();
			rs = ps.getGeneratedKeys();
			rs.next();
			a.setAttachmentID((rs.getInt(1)));
			return post.getPostId();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("post cannot be registered now, please try again later!", e);
		}

	}

	public String getLastPostURL(int userID) throws UserException {
		String postPic = null;
		System.err.println("OTIVAM DA TYRSYA PYTQ DO POST SNIMKATA");
		Connection connection = DBConnection.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery( "SELECT post_id, post_date_upload AS date FROM posts WHERE user_id="+ userID + " order by date desc limit 1" );
			System.err.println("V METODA SYM!!!!!!!!!!!!!!!!");
			if(rs.next()) {
				int postID = rs.getInt(1);
				System.err.println("POST ID-TO OT BAZATA E " + postID);
				rs = stmt.executeQuery( "SELECT * FROM attachments WHERE post_id ="+ postID);
				rs.next();
				postPic = rs.getString("attachment_photo_url");
				System.err.println("PYTQ E " + postPic);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			//throw new UserException("Error at getting last Five Posts", e);
		}
		return postPic;
	}

	public Post getLastFivePosts() throws UserException {
		System.err.println("TOP USERS - OTIVAM DA TYRSYA PYTQ DO POST SNIMKATA");
		Connection connection = DBConnection.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		Post post = new Post();
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery( "SELECT post_id, post_date_upload AS date FROM posts ORDER BY date DESC limit 6");

			while(rs.next()) {			
				int postID = rs.getInt("post_id");
				System.err.println("TOP USERS - POST ID-TO OT BAZATA E " + postID);
				post.getAttachments().add(getAttachment(postID));
				System.out.println("TOP USERS - TUKA VLIZA LI IZOBSHTO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("Error at getting last Five Posts", e);
		}
		return post;
	}

	public Post getLastThreePostsByCategory(int categoryID) throws UserException {
		System.err.println("CATEGORY - OTIVAM DA TYRSYA PYTQ DO POST SNIMKATA");
		Connection connection = DBConnection.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		Post post = new Post();
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery("SELECT post_id AS post_id FROM posts WHERE post_category_id ="+categoryID+" ORDER BY post_id DESC limit 6");
			while(rs.next()) {			
				int postID = rs.getInt("post_id");
				System.err.println("WHILE CATEGORY - TOP USERS - POST ID-TO OT BAZATA E " + postID);
				post.getAttachments().add(getAttachment(postID));
				System.out.println("WHILE CATEGORY - TOP USERS - TUKA VLIZA LI IZOBSHTO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			//throw new UserException("Error at getting last Five Posts", e);
		}
		return post;
	}

	public Post getMyPosts(int userID) throws UserException {
		System.err.println("MY POSTS - OTIVAM DA TYRSYA PYTQ DO POST SNIMKATA");
		Connection connection = DBConnection.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		Post post = new Post();
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery("SELECT post_id AS post_id FROM posts WHERE user_id ="+userID+" ORDER BY post_id DESC limit 12");
			while(rs.next()) {			
				int postID = rs.getInt("post_id");
				System.err.println("WHILE MY POSTS - MY POSTS - POST ID-TO OT BAZATA E " + postID);
				post.getAttachments().add(getAttachment(postID));
				System.out.println("WHILE MY POSTS - MY POSTS - TUKA VLIZA LI IZOBSHTO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("Error at getting last Five Posts", e);
		}
		return post;
	}

	public Attachment getAttachment(int postID) throws UserException {
		Connection con = DBConnection.getInstance().getConnection();
		PreparedStatement ps;
		Attachment attachment = null;
		
		try {
			ps = con.prepareStatement(GET_ATTACHMENT_FROM_SQL);
			ps.setInt(1, postID);
			ResultSet rs = ps.executeQuery();
			rs.next();
			System.out.println("TOP USERS - TUKA VLIZA LI IZOBSHTO");
			attachment = new Attachment(
					rs.getInt("attachment_id"), 
					rs.getString("attachment_title"), 
					rs.getString("attachment_description"), 
					rs.getDate("attachment_date_upload"),
					rs.getInt("post_id"),
					rs.getString("attachment_photo_url"));
			System.err.println("VZIMAM ATACHMENT-TA URL-A E " + attachment.getURL());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("Error at getting last Five Posts", e);
		}
		
		return attachment;
	}

	public int getPostID(int attachmentID) throws UserException {
		System.err.println("GET POST ID");
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		int id = 0;
		try {
			ps = connection.prepareStatement("SELECT post_id AS post_id FROM attachments WHERE attachment_id =?", Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, attachmentID);
			ps.executeQuery();
			ResultSet rs = ps.executeQuery();
			rs.next();
			System.err.println("POST ID IS " + rs.getInt(1));
			id = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new UserException("Error at getting last Five Posts", e);
		}

		return id;
	}

	public boolean deletePost (int attachmentID) {
		System.err.println("DELET POST");
		Connection connection = DBConnection.getInstance().getConnection();
		PreparedStatement ps = null;
		int postID = 0;
		try {
			postID = getPostID(attachmentID);
		} catch (UserException e1) {
			e1.printStackTrace();
		}
		try {
			ps = connection.prepareStatement(DELETE_POST);
			ps.setInt(1, postID);
			ps.executeUpdate();
			System.err.println("POST IS DELETED");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("POST IS NOT DELETED");
		return false;
	}

}
