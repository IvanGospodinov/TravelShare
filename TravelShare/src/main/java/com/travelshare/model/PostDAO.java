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
			rs = stmt.executeQuery( "SELECT post_id, post_date_upload AS date FROM posts where user_id="+ userID + " order by date desc limit 1" );
			System.err.println("V METODA SYM!!!!!!!!!!!!!!!!");
			rs.next();
			int postID = rs.getInt(1);
			System.err.println("POST ID-TO OT BAZATA E " + postID);
			rs = stmt.executeQuery( "select * from attachments where post_id ="+ postID);
			rs.next();
			postPic = rs.getString("attachmentURL");
			System.err.println("PYTQ E " + postPic);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return postPic;
	}


}
