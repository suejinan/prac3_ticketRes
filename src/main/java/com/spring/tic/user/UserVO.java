package com.spring.tic.user;
/*
CREATE TABLE USERS (
	ID	VARCHAR2(20 BYTE)
	PASSWORD	VARCHAR2(20 BYTE)
	NAME	VARCHAR2(20 BYTE)
	PHONE	VARCHAR2(20 BYTE)
	ADDRESS	VARCHAR2(20 BYTE)
	EMAIL	VARCHAR2(20 BYTE)
	POINT	NUMBER
);
 */
public class UserVO {
	private String id;
	private String password;
	private String name;
	private String address;
	private String phone1;
	private String phone2;
	private String phone3;
	private String emailid;
	private String email_dns;
	private String emailaddr;
	private int point;
	//검색조건용 필드 추가
	private String searchCondition;
	private String searchKeyword;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getEmail_dns() {
		return email_dns;
	}
	public void setEmail_dns(String email_dns) {
		this.email_dns = email_dns;
	}
	public String getEmailaddr() {
		return emailaddr;
	}
	public void setEmailaddr(String emailaddr) {
		this.emailaddr = emailaddr;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	

	
}
