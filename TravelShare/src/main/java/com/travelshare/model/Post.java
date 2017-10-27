package com.travelshare.model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;


public class Post {
	
		private int postId;
		private String category;
		private String title;
		private String location;
		private String description;
	
		private int user_id;
		private int category_id;
	
		private LocalDate upload;
		private LocalDate modify;
		
		private User user;
		
		
	

//		private Set<Attachment> attachments=new HashSet<Attachment>() ;
//		private Set<Coment> coments=new HashSet<Coment>() ;
//		private Map<Emotion, Integer> emotions=new HashMap<Emotion, Integer>();


		
		public Post(String title, String description, LocalDate a, LocalDate b, int user_id, int category_id, String location) {
			
			this.title = title;
			this.description = description;
			this.upload = a;
			this.modify = b;
			this.user_id = 1;
			this.category_id = 1;
			this.location = location;
		}
		
	
		public String getLocation() {
			return location;
		}

		public void setLocation(String location) {
			this.location = location;
		}


//		public Post(String title, String description, LocalDateTime dateTime, User user, HashSet<Attachment> attachments,
//				HashSet<Coment> coments, Map<Emotion, Integer> emotions) {
//			this(title, description, dateTime, user);
//			this.attachments = attachments;
//			this.coments = coments;
//			this.emotions = emotions;
//		}



		public void setPostId(int post_id) {
			this.postId = post_id;
		}
		
		
		public int getPostId() {
			return postId;
		}

		public String getDescription() {
			return description;
		}



		public String getTitle() {
			return title;
		}



		public int getUser_id() {
			return user_id;
		}



		public int getCategory_id() {
			return category_id;
		}

//		public Set<Attachment> getAttachments() {
//			return attachments;
//		}
	//
//		public Set<Coment> getComents() {
//			return coments;
//		}
	//
//		public Map<Emotion, Integer> getEmotions() {
//			return emotions;
//		}

		
		

}
