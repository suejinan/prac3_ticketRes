package com.spring.tic.qna_board;

import java.sql.Date;

public class QnAComVO {
	private int c_idx;
	private int q_idx;
	private String id;
	private String c_content;
	private Date regdate;
	
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
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
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "QnAComVO [c_idx=" + c_idx + ", q_idx=" + q_idx + ", id=" + id + ", c_content=" + c_content
				+ ", regdate=" + regdate + "]";
	}
	
}
