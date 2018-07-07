package com.spring.tic.review_board.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tic.review_board.ReviewVO;

@Repository("reviewDAOMybatis")
public class ReviewDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//게시글 상세 조회
	public ReviewVO getReview(ReviewVO vo) {
		System.out.println(">>> mybatis - getReview");
		return mybatis.selectOne("ReviewDAO.getReview", vo);
	}
		//게시글 조회수 처리
		public void updateReviewHit(ReviewVO vo) {
			mybatis.update("ReviewDAO.updateReviewHit", vo);
		}
	
	//게시글 목록 조회
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println(">>> mybatis - getReviewList");
		return mybatis.selectList("ReviewDAO.getReviewList", vo);
	}
	
	//게시글 입력 처리
	public void insertReview(ReviewVO vo) {
		System.out.println(">>> mybatis - insertReview");
		mybatis.insert("ReviewDAO.insertReview", vo);
	}
		//게시글 파일입력 처리
		public void insertFile(Map<String, Object> map) throws Exception{
			System.out.println(">>> mybatis - insertFile");
		    mybatis.insert("ReviewDAO.insertFile", map);
		}
	
	//게시글 수정 처리
	public void updateReview(ReviewVO vo) {
		mybatis.update("ReviewDAO.updateReview", vo);
	}
		public void updateFile(ReviewVO vo) throws Exception{
			System.out.println(">>> mybatis - updateFile");
		    mybatis.insert("ReviewDAO.updateFile", vo);
		}
		public void insertUploadFile(ReviewVO vo) throws Exception{
			System.out.println(">>> mybatis - insertUploadFile");
			mybatis.insert("ReviewDAO.insertUploadFile", vo);
		}
	
	
	//게시글 삭제 처리
	public void deleteReview(ReviewVO vo) {
		System.out.println(">>> mybatis - deleteReview");
		mybatis.delete("ReviewDAO.deleteReview", vo);
	}
		//게시글의 파일 삭제 처리
		public void deleteFile(ReviewVO vo) {
			System.out.println(">>> mybatis - deleteFile");
			mybatis.delete("ReviewDAO.deleteFile", vo);
		}


	
}
