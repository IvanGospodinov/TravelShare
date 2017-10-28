package com.travelshare.model;

public class PostDAO {
	
	
	private static PostDAO instance;
	private PostDAO(){}
	
	public static synchronized PostDAO getInstance(){
		if(instance == null){
			instance = new PostDAO();
		}
		return instance;
	}
}
