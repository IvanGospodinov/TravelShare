package com.travelshare.model;

public class Attachment {

	private int attachmentID;
	private int postID;
	private String URL;
	
	public Attachment() {}
	
	public Attachment(int attachmentID, int postID, String URL) {
		super();
		this.attachmentID = attachmentID;
		this.postID = postID;
		this.URL = URL;
	}
	public int getAttachmentID() {
		return attachmentID;
	}
	public void setAttachmentID(int attachmentID) {
		this.attachmentID = attachmentID;
	}
	public int getPostID() {
		return postID;
	}
	public void setPostID(int postID) {
		this.postID = postID;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
	
	
	
	
	
}
