package com.spring.tic.qna_board.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.tic.qna_board.QnABoardService;
import com.spring.tic.qna_board.QnABoardVO;
import com.spring.tic.qna_board.QnAComVO;

@Service("qnABoardService")
public class QnABoardServiceImpl implements QnABoardService {
	@Autowired
	private QnABoardDAOMybatis boardDAObatis;
	
	@Override
	public void insertBoard(QnABoardVO vo) {
		boardDAObatis.insertBoard(vo);
	}

	@Override
	public void updateBoard(QnABoardVO vo) {
		boardDAObatis.updateBoard(vo);
	}

	@Override
	public void deleteBoard(QnABoardVO vo) {
		boardDAObatis.deleteBoard(vo);
	}

	@Override
	public QnABoardVO getBoard(QnABoardVO vo) {
		return boardDAObatis.getBoard(vo);
	}

	@Override
	public List<QnABoardVO> getBoardList(QnABoardVO vo) {
		return boardDAObatis.getBoardList(vo);
	}

	@Override
	public void updateBoardHit(QnABoardVO vo) {
		boardDAObatis.updateBoardHit(vo);
	}

	@Override
	public List<QnAComVO> getComm(QnAComVO vo) {
		return boardDAObatis.getComm(vo);
	}

	@Override
	public void insertComm(QnAComVO vo) {
		boardDAObatis.insertComm(vo);
	}

	@Override
	public void deleteComm(QnAComVO vo) {
		boardDAObatis.deleteComm(vo);
	}
}
