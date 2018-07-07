package com.spring.tic.user.impl;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tic.user.BuyVO;
import com.spring.tic.user.UserVO;
import com.spring.tic.user.WishVO;

//Mybatis 연동 처리 방법2: SqlSessionTemplate 필드주입
@Repository("userDAOMybatis")
public class UserDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
		
	//회원 정보 상세 조회(한사람)
	public UserVO getUserOne(UserVO vo) {
		System.out.println("===> Mybatis로 getUserOne() 처리");
		return mybatis.selectOne("UserDAO.getUserOne", vo);
	}
	
	//회원 가입
	public int insertUser(UserVO vo) {
		System.out.println("===> Mybatis로 insertUser() 처리");
		return mybatis.insert("UserDAO.insertUser", vo);
	}
	

	//회원 정보 수정
	public int updateUser(UserVO vo) {
		System.out.println("===> Mybatis로 updateUser() 처리");
		return mybatis.update("UserDAO.updateUser", vo);
	}
	
	//회원 정보 삭제
	public void deleteUser(UserVO vo) {
		System.out.println("===> Mybatis로 deleteUser() 처리");
		mybatis.delete("UserDAO.deleteUser", vo);
	}
	
	//////////////////////////////////////////////////////////////
	//회원 찜 목록
	public List<WishVO> getWishList(UserVO vo) {
		System.out.println("===> Mybatis로 getWishList() 처리");
		return mybatis.selectList("UserDAO.getWishList", vo);
	}
	
	//회원 정보 삭제
	public void deleteWish(WishVO vo) {
		System.out.println("===> Mybatis로 deleteWish() 처리");
		mybatis.delete("UserDAO.deleteWish", vo);
	}
	
	//////////////////////////////////////////////////////////////
	//회원 예매 목록
	public List<BuyVO> getBuyList(UserVO vo) {
		System.out.println("===> Mybatis로 getBuyList() 처리");
		return mybatis.selectList("UserDAO.getBuyList", vo);
	}
	//회원 예매기록 삭제
	public void deleteBuy(BuyVO vo) {
		System.out.println("===> Mybatis로 deleteBuy() 처리");
		mybatis.delete("UserDAO.deleteBuy", vo);
	}
}


