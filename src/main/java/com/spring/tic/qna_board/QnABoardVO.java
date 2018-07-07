package com.spring.tic.qna_board;

import java.sql.Date;

public class QnABoardVO {
	private int q_idx;
	private String id;
	private String q_title;
	private String q_content;
	private Date regdate;
	private int hit;
	
	//검색조건용 필드 추가
	private String searchCondition;
	private String searchKeyword;
	
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	@Override
	public String toString() {
		return "QnABoardVO [q_idx=" + q_idx + ", id=" + id + ", q_title=" + q_title + ", q_content=" + q_content
				+ ", regdate=" + regdate + ", hit=" + hit + ", searchCondition=" + searchCondition + ", searchKeyword="
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
