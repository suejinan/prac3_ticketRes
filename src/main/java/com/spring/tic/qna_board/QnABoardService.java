package com.spring.tic.qna_board;

import java.util.List;

public interface QnABoardService {
	//CRUD 기능 구현 메소드 정의
	//글입력
	void insertBoard(QnABoardVO vo);
	//글수정
	void updateBoard(QnABoardVO vo);
	//글삭제
	void deleteBoard(QnABoardVO vo);
	//글 상세 조회
	QnABoardVO getBoard(QnABoardVO vo);
	//글 목록 전체 조회
	List<QnABoardVO> getBoardList(QnABoardVO vo);
	//조회수 수정
	void updateBoardHit(QnABoardVO vo);
	
	//댓글 목록 조회
	List<QnAComVO> getComm(QnAComVO vo);
	//댓글입력
	void insertComm(QnAComVO vo);

	//댓글삭제
	void deleteComm(QnAComVO vo);
}
