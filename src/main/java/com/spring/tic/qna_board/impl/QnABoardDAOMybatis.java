package com.spring.tic.qna_board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tic.qna_board.QnABoardVO;
import com.spring.tic.qna_board.QnAComVO;

			//where?
@Repository("qnABoardDAOMybatis")
public class QnABoardDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//게시글 상세 조회
	public QnABoardVO getBoard(QnABoardVO vo) {
								//mapper의 namespace
		return mybatis.selectOne("QnABoardDAO.getBoard", vo);
	}
	
	//게시글 목록 조회
	public List<QnABoardVO> getBoardList(QnABoardVO vo) {
		return mybatis.selectList("QnABoardDAO.getBoardList", vo);
	}
	
	//게시글 입력 처리
	public void insertBoard(QnABoardVO vo) {
		mybatis.insert("QnABoardDAO.insertBoard", vo);
	}
	
	//게시글 수정 처리
	public void updateBoard(QnABoardVO vo) {
		mybatis.update("QnABoardDAO.updateBoard", vo);
	}
	
	//게시글 삭제 처리
	public void deleteBoard(QnABoardVO vo) {
		mybatis.delete("QnABoardDAO.deleteBoard", vo);
	}

	//게시글 조회수 처리
	public void updateBoardHit(QnABoardVO vo) {
		mybatis.update("QnABoardDAO.updateBoardHit", vo);
	}
	
	//댓글 목록 조회
	public List<QnAComVO> getComm(QnAComVO vo) {
		return mybatis.selectList("QnABoardDAO.getComm", vo);
	}

	//댓글 등록
	public void insertComm(QnAComVO vo) {
		mybatis.insert("QnABoardDAO.insertComm", vo);
	}
	
	//댓글 삭제
	public void deleteComm(QnAComVO vo) {
		mybatis.delete("QnABoardDAO.deleteComm", vo);
	}
}
