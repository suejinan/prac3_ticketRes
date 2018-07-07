package com.spring.tic.review_board.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.tic.review_board.ReviewService;
import com.spring.tic.review_board.ReviewVO;

@Service("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAOMybatis reviewDAO;
	
	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		System.out.println(">>> ReviewServiceImpl - insertFile");
		reviewDAO.insertFile(map);
	}

	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);	
	}
	@Override
	public void updateFile(ReviewVO vo) throws Exception {
		reviewDAO.updateFile(vo);	
	}
	@Override
	public void insertUploadFile(ReviewVO vo) throws Exception {
		reviewDAO.insertUploadFile(vo);	
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		System.out.println(">>> ReviewServiceImpl - deleteReview");
		reviewDAO.deleteReview(vo);
	}
	@Override
	public void deleteFile(ReviewVO vo) {
		System.out.println(">>> ReviewServiceImpl - deleteFile");
		reviewDAO.deleteFile(vo);
	}

	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return reviewDAO.getReview(vo);
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return reviewDAO.getReviewList(vo);
	}

	@Override
	public void updateReviewHit(ReviewVO vo) {
		reviewDAO.updateReviewHit(vo);
	}


}
