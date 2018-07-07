package com.spring.tic.user;

public class WishVO {
	int w_idx;
	String id;
	int play_id;
	String title;
	String category;
	String file_ori;
	String file_name;
	String content;
	
	public int getW_idx() {
		return w_idx;
	}
	public void setW_idx(int w_idx) {
		this.w_idx = w_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPlay_id() {
		return play_id;
	}
	public void setPlay_id(int play_id) {
		this.play_id = play_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFile_ori() {
		return file_ori;
	}
	public void setFile_ori(String file_ori) {
		this.file_ori = file_ori;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	@Override
	public String toString() {
		return "WishVO [w_idx=" + w_idx + ", id=" + id + ", play_id=" + play_id + ", title=" + title + ", category="
				+ category + ", file_ori=" + file_ori + ", file_name=" + file_name + ", content=" + content + "]";
	}
	


	
}
