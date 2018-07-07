package com.spring.tic.noticeboard;

import java.util.List;

public interface NBoardService {

	//CRUD기능 구현 메소드 정의
	
	//글 입력
	void insertNBoard(NBoardVO vo);
	
	//글 수정
	void updateNBoard(NBoardVO vo);
	
	//글 삭제
	void deleteNBoard(NBoardVO vo);
	
	//글목록조회
	List<NBoardVO> getNBoardList(NBoardVO vo);

	//글 상세조회
	NBoardVO getNBoard(NBoardVO vo);
	
	//조회수
	void updateNBoardHit(NBoardVO vo);
	
}
