package com.spring.tic.manager.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tic.manager.MemberVO;
import com.spring.tic.manager.PartnerVO;

@Repository("managerDAOMybatis")
public class ManagerDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//회원 목록 조회
	public List<MemberVO> MemberList(MemberVO vo) {
		return mybatis.selectList("ManagerDAO.memberList", vo);
	}
	
	//회원 정보 수정
	public void updateMember(MemberVO vo) {
		mybatis.update("ManagerDAO.updateMember", vo);
	}
	
	//회원 정보 삭제
	public void deleteMember(MemberVO vo) {
		mybatis.delete("ManagerDAO.deleteMember", vo);
	}
	
	//공연사 목록 조회
	public List<PartnerVO> PartnerList(PartnerVO vo) {
		return mybatis.selectList("ManagerDAO.partnerList", vo);
	}
	
	//공연사 등록
	public void insertPartner(PartnerVO vo) {
		mybatis.insert("ManagerDAO.insertPartner", vo);
	}
	
	//공연사 수정
	public void updatePartner(PartnerVO vo) {
		mybatis.update("ManagerDAO.updatePartner", vo);
	}
	
	//공연사 삭제
	public void deletePartner(PartnerVO vo) {
		mybatis.delete("ManagerDAO.deletePartner", vo);
	}
	
	//공연사 하나 조회
	public PartnerVO PartnerOne(PartnerVO vo) {
		return mybatis.selectOne("ManagerDAO.partnerOne", vo);
	}
}
