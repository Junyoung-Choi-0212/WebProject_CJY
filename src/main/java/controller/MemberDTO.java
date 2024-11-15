package controller;

public class MemberDTO {
	private String idx;
	private String id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String regidate;
	
	public String getIdx() { return idx; }
	public void setIdx(String idx) { this.idx = idx; }
	
	public String getId() { return id; }
	public void setId(String id) { this.id = id; }
	
	public String getPassword() { return password; }
	public void setPassword(String password) { this.password = password; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
	
	public String getRegidate() { return regidate; }
	public void setRegidate(String regidate) { this.regidate = regidate; }
}