package com.spring.tic.noticeboard;

import java.sql.Date;

public class NBoardVO {
	private String id;
	private String n_title;
	private String n_content;
	private Date regdate;
	private int n_idx;
	private int hit;
	
	//검색조건 
	private String searchCondition;
	private String searchKeyword;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getN_idx() {
		return n_idx;
	}
	public void setN_idx(int n_idx) {
		this.n_idx = n_idx;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	

	
	@Override
	public String toString() {
		return "NBoardVO [id=" + id + ", n_title=" + n_title + ", n_content=" + n_content + ", regdate=" + regdate
				+ ", n_idx=" + n_idx + ", hit=" + hit + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + "]";
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
