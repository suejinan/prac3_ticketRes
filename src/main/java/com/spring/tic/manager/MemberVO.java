package com.spring.tic.manager;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String phone1;
	private String phone2;
	private String phone3;
	private String address;
	private String email;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", phone1=" + phone1 + ", phone2="
				+ phone2 + ", phone3=" + phone3 + ", address=" + address + ", email=" + email + ", emailaddr="
				+ emailaddr + ", point=" + point + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + "]";
	}
	
	//검색조건용 필드
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
