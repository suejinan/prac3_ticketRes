package com.spring.tic.review_board;

import java.sql.Date;

public class ReviewVO {
//	ID,
//	R_TITLE,
//	R_CONTENT,
//	REGDATE,
//	PLAY_ID,
//	R_IDX,
//	TITLE
//	HIT,
//	ORIGINAL_FILE_NAME,
//	SAVED_FILE_NAME

	private String id;
	private String r_title;
	private String r_content;
	private Date regdate;
	private int play_id;
	private int r_idx;
	private String title;
	private int hit;
	private int file_idx;
	private String original_file_name;
	private String saved_file_name;
	private long file_size;
	
	//검색조건용 필드 추가
	private String searchCondition;
	private String searchKeyword;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	
	public int getFile_idx() {
		return file_idx;
	}
	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}
	public String getOriginal_file_name() {
		return original_file_name;
	}
	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}
	public String getSaved_file_name() {
		return saved_file_name;
	}
	public void setSaved_file_name(String saved_file_name) {
		this.saved_file_name = saved_file_name;
	}
	
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long l) {
		this.file_size = l;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getPlay_id() {
		return play_id;
	}
	public void setPlay_id(int play_id) {
		this.play_id = play_id;
	}
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "ReviewVO [id=" + id + ", r_title=" + r_title + ", r_content=" + r_content + ", regdate=" + regdate
				+ ", play_id=" + play_id + ", r_idx=" + r_idx + ", title=" + title + ", hit=" + hit + ", file_idx="
				+ file_idx + ", original_file_name=" + original_file_name + ", saved_file_name=" + saved_file_name
				+ ", file_size=" + file_size + ", searchCondition=" + searchCondition + ", searchKeyword="
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
