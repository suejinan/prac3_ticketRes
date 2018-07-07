package com.spring.tic.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.tic.manager.ManagerService;
import com.spring.tic.manager.MemberVO;
import com.spring.tic.manager.PartnerVO;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDAOMybatis managerDAObatis;
	
	@Override
	public List<MemberVO> MemberList(MemberVO vo) {
		return managerDAObatis.MemberList(vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		managerDAObatis.updateMember(vo);
	}

	@Override
	public void deleteMember(MemberVO vo) {
		managerDAObatis.deleteMember(vo);
	}

	@Override
	public List<PartnerVO> PartnerList(PartnerVO vo) {
		return managerDAObatis.PartnerList(vo);
	}

	@Override
	public void insertPartner(PartnerVO vo) {
		managerDAObatis.insertPartner(vo);
	}

	@Override
	public void updatePartner(PartnerVO vo) {
		managerDAObatis.updatePartner(vo);
	}

	@Override
	public void deletePartner(PartnerVO vo) {
		managerDAObatis.deletePartner(vo);
	}
}
