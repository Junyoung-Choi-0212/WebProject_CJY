package controller;

public class ListDTO {
	private String idx;
	private String title;
	private String content;
	private String authorid;
	private String authorname;
	private String ofile;
	private String sfile;
	private int downcount;
	private int visitcount;
	private java.sql.Date postdate;
	private String listtype;
	private int likecount;
	
	public String getIdx() { return idx; }
	public void setIdx(String idx) { this.idx = idx; }
	
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	
	public String getAuthorid() { return authorid; }
	public void setAuthorid(String authorid) { this.authorid = authorid; }
	
	public String getAuthorname() { return authorname; }
	public void setAuthorname(String authorname) { this.authorname = authorname; }
	
	public String getOfile() { return ofile; }
	public void setOfile(String ofile) { this.ofile = ofile; }
	
	public String getSfile() { return sfile; }
	public void setSfile(String sfile) { this.sfile = sfile; }
	
	public int getDowncount() { return downcount; }
	public void setDowncount(int downcount) { this.downcount = downcount; }
	
	public int getVisitcount() { return visitcount; }
	public void setVisitcount(int visitcount) { this.visitcount = visitcount; }
	
	public java.sql.Date getPostdate() { return postdate; }
	public void setPostdate(java.sql.Date postdate) { this.postdate = postdate; }
	
	public String getListtype() { return listtype; }
	public void setListtype(String listtype) { this.listtype = listtype; }
	
	public int getLikecount() { return likecount; }
	public void setLikecount(int likecount) { this.likecount = likecount; }
}