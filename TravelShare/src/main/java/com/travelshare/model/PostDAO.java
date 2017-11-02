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

	public String getLastPostURL(int userID) {
		String postPic = null;
		System.err.println("OTIVAM DA TYRSYA PYTQ DO POST SNIMKATA");
		Connection connection = DBConnection.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery( "SELECT post_id, post_date_upload AS date FROM posts WHERE user_id="+ userID + " order by date desc limit 1" );
			System.err.println("V METODA SYM!!!!!!!!!!!!!!!!");
			rs.next();
			int postID = rs.getInt(1);
			System.err.println("POST ID-TO OT BAZATA E " + postID);
			rs = stmt.executeQuery( "SELECT * FROM attachments WHERE post_id ="+ postID);
			rs.next();
			postPic = rs.getString("attachment_photo_url");
			System.err.println("PYTQ E " + postPic);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return postPic;
	}

	public Post getLastFivePosts() {
		System.err.println("TOP USERS - OTIVAM DA TYRSYA PYTQ DO POST SNIMKATA");
		Connection connection = DBConnection.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		Post post = new Post();
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery( "SELECT post_id, post_date_upload AS date FROM posts ORDER BY date DESC limit 5");
			
			while(rs.next()) {			
				int postID = rs.getInt("post_id");
				System.err.println("TOP USERS - POST ID-TO OT BAZATA E " + postID);
				post.getAttachments().add(getAttachment(postID));
				System.out.println("TOP USERS - TUKA VLIZA LI IZOBSHTO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return post;
	}
	
	public Post getLastThreePostsByCategory(int categoryID) {
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
		}
		return post;
	}

	public Attachment getAttachment(int postID) throws SQLException{
		Connection con = DBConnection.getInstance().getConnection();
		PreparedStatement ps = con.prepareStatement(GET_ATTACHMENT_FROM_SQL);
		ps.setInt(1, postID);
		ResultSet rs = ps.executeQuery();
		rs.next();
		System.out.println("TOP USERS - TUKA VLIZA LI IZOBSHTO");
		Attachment attachment = new Attachment(
				rs.getInt("attachment_id"), 
				rs.getString("attachment_title"), 
				rs.getString("attachment_description"), 
				rs.getDate("attachment_date_upload"),
				rs.getInt("post_id"),
				rs.getString("attachment_photo_url"));
		System.err.println("VZIMAM ATACHMENT-TA URL-A E " + attachment.getURL());
		return attachment;
	}


}
