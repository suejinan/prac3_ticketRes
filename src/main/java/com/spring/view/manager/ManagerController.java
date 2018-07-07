package com.spring.view.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.tic.manager.ManagerService;
import com.spring.tic.manager.MemberVO;
import com.spring.tic.manager.PartnerVO;

@Controller		
@SessionAttributes({"memberList", "partnerList", "partnerId", "partnerOne"})
public class ManagerController {
	@Autowired
	private ManagerService manService;

	//회원 검색
	@ModelAttribute("M_conditionMap")
	public Map<String, String> M_searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("아이디", "ID");
		return conditionMap;
	}
	
	//공연사 검색
	@ModelAttribute("P_conditionMap")
	public Map<String, String> P_searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("아이디", "P_ID");
		conditionMap.put("이름", "PARTNER_NAME");
		return conditionMap;
	}
	
	//회원 전체 조회
	@RequestMapping("/Manager/memberList.do")
	public String memberList(MemberVO vo, Model model) {
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("ID");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		List<MemberVO> memberList = manService.MemberList(vo);
		model.addAttribute("memberList", memberList);
		return "/Manager/getMemberList.jsp";
	}
	
	//회원 수정
	@RequestMapping("/Manager/updateMember.do")
	public String updateMember(MemberVO vo) {
		manService.updateMember(vo);
		return "/Manager/memberList.do";
	}
	
	//회원 삭제
	@RequestMapping("/Manager/deleteMember.do")
	public String deleteMember(MemberVO vo) {
		manService.deleteMember(vo);
		return "/Manager/memberList.do";
	}
	
	//공연사 전체 조회
	@RequestMapping("/Manager/partnerList.do")
	public String partnerList(PartnerVO vo, Model model) {
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("P_ID");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		List<PartnerVO> partnerList = manService.PartnerList(vo);
		model.addAttribute("partnerList", partnerList);
		return "/Manager/getPartnerList.jsp";
	}
	
	@RequestMapping("/Manager/insertPartner.do")
	//공연사 등록
	public String insertPartner(PartnerVO vo) {
		manService.insertPartner(vo);
		return "/Manager/partnerList.do";
	}
	
	@RequestMapping("/Manager/updatePartner.do")
	//공연사 수정
	public String updatePartner(PartnerVO vo) {
		System.out.println("수정 전 : " + vo);
		manService.updatePartner(vo); //문제
		System.out.println("수정 후 : " + vo);
		return "/Manager/partnerList.do";
	}
	
	@RequestMapping("/Manager/deletePartner.do")
	//공연사 삭제
	public String deletePartner(PartnerVO vo) {
		manService.deletePartner(vo);
		return "/Manager/partnerList.do";
	}
}
