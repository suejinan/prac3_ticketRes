package com.spring.tic.manager;

public class PartnerVO {
	private String p_id;
	private String partner_name;
	private String address;
	private String phone;
	private String email;
	
	//검색조건용 필드 추가
	private String searchCondition;
	private String searchKeyword;
	
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getPartner_name() {
		return partner_name;
	}
	public void setPartner_name(String partner_name) {
		this.partner_name = partner_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "PartnerVO [p_id=" + p_id + ", partner_name=" + partner_name + ", address=" + address + ", phone="
				+ phone + ", email=" + email + ", searchCondition=" + searchCondition + ", searchKeyword="
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
