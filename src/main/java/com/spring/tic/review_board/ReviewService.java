package com.spring.tic.review_board;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	//글 목록 전체 조회
	List<ReviewVO> getReviewList(ReviewVO vo);
	
	//글 상세 조회
	ReviewVO getReview(ReviewVO vo);
		//조회수 수정
		void updateReviewHit(ReviewVO vo);

	//글
	void insertReview(ReviewVO vo);
		//첨부파일 삽입
		void insertFile(Map<String, Object> map) throws Exception;
	
	//글수정
	void updateReview(ReviewVO vo);
		//기존 첨부파일
		void updateFile(ReviewVO vo) throws Exception;
		//새로운 첨부파일 삽입
		void insertUploadFile(ReviewVO vo) throws Exception;
	
	//글삭제
	void deleteReview(ReviewVO vo);
		void deleteFile(ReviewVO vo);



}
