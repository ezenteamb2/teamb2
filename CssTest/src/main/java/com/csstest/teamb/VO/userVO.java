package com.csstest.teamb.VO;

public class userVO {
	private int userNo;
	private String nickname;
	private String id;
	private String pw;
	private String address;
	private int role;
	
	public int getUserNo() {
		return userNo;
	}
	public String getNickname() {
		return nickname;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getAddress() {
		return address;
	}
	public int getRole() {
		return role;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setRole(int role) {
		this.role = role;
	}
}
