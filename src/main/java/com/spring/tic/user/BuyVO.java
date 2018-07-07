package com.spring.tic.user;

import java.sql.Date;

public class BuyVO {
//**BUY_LIST**
//	B_IDX
//	ID
//	PLAY_ID
//	BUY_QUANTITY
//	TITLE
//	PLAY_DATE
//	TIME
//	CATEGORY
//	FILE_ORI
//	FILE_NAME
	int b_idx;
	String id;
	int play_id;
	int buy_quantity;
	String title;
	Date play_date;
	String time;
	String category;
	String file_ori;
	String file_name;
	
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
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
	public int getBuy_quantity() {
		return buy_quantity;
	}
	public void setBuy_quantity(int buy_quantity) {
		this.buy_quantity = buy_quantity;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getPlay_date() {
		return play_date;
	}
	public void setPlay_date(Date play_date) {
		this.play_date = play_date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
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
	@Override
	public String toString() {
		return "BuyVO [b_idx=" + b_idx + ", id=" + id + ", play_id=" + play_id + ", buy_quantity=" + buy_quantity
				+ ", title=" + title + ", play_date=" + play_date + ", time=" + time + ", category=" + category
				+ ", file_ori=" + file_ori + ", file_name=" + file_name + "]";
	}



}
