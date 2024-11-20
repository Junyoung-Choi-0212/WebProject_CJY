package controller;

public class LikeinfoDTO {
	private String idx;
	private String listidx;
	private String userid;
	private java.sql.Date likedate;
	
	public String getIdx() { return idx; }
	public void setIdx(String idx) { this.idx = idx; }
	
	public String getListidx() { return listidx; }
	public void setListidx(String listidx) { this.listidx = listidx; }
	
	public String getUserid() { return userid; }
	public void setUserid(String userid) { this.userid = userid; }
	
	public java.sql.Date getLikedate() { return likedate; }
	public void setLikedate(java.sql.Date likedate) { this.likedate = likedate; }
}