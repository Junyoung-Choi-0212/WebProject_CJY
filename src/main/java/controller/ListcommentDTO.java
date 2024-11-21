package controller;

public class ListcommentDTO {
	private String idx;
	private String listidx;
	private String useridx;
	private String userid;
	private String username;
	private String content;
	private java.sql.Date postdate;
	
	public String getIdx() { return idx; }
	public void setIdx(String idx) { this.idx = idx; }
	
	public String getListidx() { return listidx; }
	public void setListidx(String listidx) { this.listidx = listidx; }
	
	public String getUseridx() { return useridx; }
	public void setUseridx(String userid) { this.useridx = userid; }
	
	public String getUserid() { return userid; }
	public void setUserid(String userid) { this.userid = userid; }
	
	public String getUsername() { return username; }
	public void setUsername(String username) { this.username = username; }
	
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	
	public java.sql.Date getPostdate() { return postdate; }
	public void setPostdate(java.sql.Date postdate) { this.postdate = postdate; }
}
