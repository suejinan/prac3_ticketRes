package com.spring.tic.noticeboard.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tic.noticeboard.NBoardVO;



@Repository("nBoardDAOMybatis")
public class NBoardDAOMybatis {

	//Mybatis 연동처리 방법 : SqlSessionTemplate 필드주입
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	//글 목록 조회
	public List<NBoardVO> getNBoardList(NBoardVO vo){
		System.out.println("--> Mybatis()로 목록보기 처리");
		return mybatis.selectList("NBoardDAO.getNBoardList", vo);
		}
	
	//조회수
	public void updateNBoardHit(NBoardVO vo) {
		System.out.println("--> Mybatis()로 조회수 증가 처리");
		mybatis.update("NBoardDAO.updateNBoardHit", vo);
	}
	
	//글 하나 조회
	public NBoardVO getNBoard(NBoardVO vo){
		System.out.println("--> Mybatis()로 상세보기 처리");
		System.out.println("vo : " + vo);
		return mybatis.selectOne("NBoardDAO.getNBoard", vo);
	}
	
	//글 작성
	public void insertNBoard(NBoardVO vo){
		System.out.println("--> Mybatis()로 처리");
		System.out.println("vo : " + vo);
		mybatis.insert("NBoardDAO.insertNBoard", vo);
	}
	
	//글 수정
	public void updateNBaord(NBoardVO vo){
		System.out.println("-->Mybatis()로 처리");
		System.out.println("vo : " + vo);
		mybatis.update("NBoardDAO.updateNBoard", vo);
	}

		
	//글 삭제
	public void deleteNBoard(NBoardVO vo) {
		System.out.println("--> Mybatis()로 처리");
		System.out.println("vo : " + vo);
		mybatis.delete("NBoardDAO.deleteNBoard", vo);
		
	}
	
}
