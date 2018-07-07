package com.spring.tic.noticeboard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.tic.noticeboard.NBoardService;
import com.spring.tic.noticeboard.NBoardVO;

@Service("nboardService")
public class NBoardServiceImpl implements NBoardService {
	
	@Autowired
	private NBoardDAOMybatis nboardDAO;
	
	
	@Override //글등록
	public void insertNBoard(NBoardVO vo) {
		nboardDAO.insertNBoard(vo);
		
	}

	@Override //글수정
	public void updateNBoard(NBoardVO vo) {
		nboardDAO.updateNBaord(vo);
		
	}

	@Override //글삭제
	public void deleteNBoard(NBoardVO vo) {
		nboardDAO.deleteNBoard(vo);
		
	}

	@Override //글목록
	public List<NBoardVO> getNBoardList(NBoardVO vo) {
		
		return nboardDAO.getNBoardList(vo);
	}

	@Override //글상세
	public NBoardVO getNBoard(NBoardVO vo) {
	
		return nboardDAO.getNBoard(vo);
	}

	@Override //조회수
	public void updateNBoardHit(NBoardVO vo) {
		nboardDAO.updateNBoardHit(vo);
	}

}
