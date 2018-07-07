package com.spring.view.noticeboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.tic.noticeboard.NBoardService;
import com.spring.tic.noticeboard.NBoardVO;

@Controller
@SessionAttributes("board")
public class BoardController {

	@Autowired
	private NBoardService nBoardService;


	
	
	// 검색조건
	/*@ModelAttribute 설정을 통해 view에 전달할 데이터를 만들어서 전달
	  view(jsp)에서 전달받은 데이터를 사용
	 @ModelAttribute로 정의된 메소드는 @RequestMapping 보다 먼저 실행됨
	"conditionMap"라는 이름으로 Map객체를 담아서 전달	  
	 * */
	@ModelAttribute("conditionMap")
	public Map<String,String> sarchConditionMap(){
			//key:제목 value : TITLE
			//key:내용 value : CONTENT
		
			Map<String, String> conditionMap = new HashMap<>();
			conditionMap.put("제목", "TITLE");
			conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
	}
	
	
	//글 목록조회
	@RequestMapping("/hyoboard/getNBoardList.do")
	public String getNBoardList(NBoardVO vo, Model model){
		System.out.println("--- 글목록 조회 ---");
		System.out.println("searchCondition : " + vo.getSearchCondition() + 
								", searchKeyword" + vo.getSearchKeyword());
		
		if(vo.getSearchCondition()==null){
			vo.setSearchCondition("TITLE");
		}
		if(vo.getSearchKeyword()==null){
			vo.setSearchKeyword("");
		}
		System.out.println("vo : " + vo.toString());
		
		//DB연동처리
		List<NBoardVO> NboardList = nBoardService.getNBoardList(vo);
		
		//ModelAndView 형식으로 작성 후 리턴
		model.addAttribute("NboardList", NboardList);
		return "getNBoardList.jsp";
		
	}
	
	
	//글 하나 조회, 조회수 증가
	@RequestMapping("/hyoboard/getNBoard.do")
	public String getNBoard(NBoardVO vo, Model model){
		System.out.println("--- 글 상세보기 ---");
		nBoardService.updateNBoardHit(vo); // 조회수 증가
		model.addAttribute("Nboard", nBoardService.getNBoard(vo));
		return "getNBoard.jsp";
	}
	
	
	
	//글 작성
	@RequestMapping("/hyoboard/insertNBoard.do")
	public String insertNBoard(NBoardVO vo, Model model ){
		System.out.println("--- 글 작성 ---");
		nBoardService.insertNBoard(vo);
		return "getNBoardList.do";
	}
	
	
	@RequestMapping("/hyoboard/updateform.do")
	public String updatefromNBoard(NBoardVO vo, Model model){
		System.out.println("--- 수정수정 ---");
		System.out.println("vo : " + vo.toString());
		model.addAttribute("Nboard", nBoardService.getNBoard(vo));
		return "updateNBoard.jsp";
	}

	//글 수정
	@RequestMapping("/hyoboard/updateNBoard.do")
	public String updateNBoard(NBoardVO vo, Model model){
		System.out.println("--- 글 수정 ---");
		nBoardService.updateNBoard(vo);
		model.addAttribute("Nboard", nBoardService.getNBoard(vo));
		return "getNBoardList.do";
	}
	
	
	//글 삭제
	@RequestMapping("/hyoboard/deleteNBoard.do")
	public String deleteNBoard(NBoardVO vo, Model model) {
		System.out.println("--- 글 삭제 ---");
		nBoardService.deleteNBoard(vo);
		return "getNBoardList.do";
	}


}
