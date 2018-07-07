package com.spring.tic.manager;

import java.util.List;

public interface ManagerService {
	//회원 목록 조회
	List<MemberVO> MemberList(MemberVO vo);
	//회원 수정
	void updateMember(MemberVO vo);
	//회원 삭제
	void deleteMember(MemberVO vo);
	//공연사 목록 조회
	List<PartnerVO> PartnerList(PartnerVO vo);
	//공연사 등록
	void insertPartner(PartnerVO vo);
	//공연사 수정
	void updatePartner(PartnerVO vo);
	//공연사 삭제
	void deletePartner(PartnerVO vo);
}
