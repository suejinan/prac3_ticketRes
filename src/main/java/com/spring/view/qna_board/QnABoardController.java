package com.spring.view.qna_board;

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
import com.spring.tic.qna_board.QnABoardService;
import com.spring.tic.qna_board.QnABoardVO;
import com.spring.tic.qna_board.QnAComVO;
import com.spring.tic.review_board.ReviewService;
import com.spring.tic.review_board.ReviewVO;

@Controller			
//board라고 저장된 model(model.addAttribute) 있으면, 세션에 저장하라
@SessionAttributes({"board", "boardList", "commList"})
public class QnABoardController {
	@Autowired
	private QnABoardService qnaService;
	@Autowired
	private NBoardService nBoardService;
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("main.do")
	public String main(QnABoardVO qvo, NBoardVO nvo, ReviewVO rvo, Model model) {
		List<QnABoardVO> boardList = qnaService.getBoardList(qvo);
		model.addAttribute("boardList", boardList);
		
		List<ReviewVO> reviewList = reviewService.getReviewList(rvo);
		model.addAttribute("reviewList", reviewList);
		
		List<NBoardVO> NboardList = nBoardService.getNBoardList(nvo);
		model.addAttribute("NboardList", NboardList);
		return "main.jsp";
	}
	
	/* <다른용도로 사용>
	  View에 전달할 데이타를 만들어서 전달
	  @ModelAttribute로 정의된 메소드는 @RequestMapping 보다 먼저 실행됨
	  "conditionMap"라는 이름으로 Map객체를 담아서 전달
	 */
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "Q_TITLE");
		conditionMap.put("내용", "Q_CONTENT");
		return conditionMap;
	}
	
	@RequestMapping("/QnA/getBoard.do")
	public String getBoard(QnABoardVO vo, QnAComVO cvo, Model model) {
		//조회수증가
		qnaService.updateBoardHit(vo);
		//세션에 넣기
		model.addAttribute("board", qnaService.getBoard(vo));
		// * 댓글 *
		//DB연동
		List<QnAComVO> CommList = qnaService.getComm(cvo);
		//세션에 넣기
		model.addAttribute("commList", CommList);
		return "/QnA/getBoard.jsp";
	}
	
	
	@RequestMapping("/QnA/getBoardList.do")
	public String getBoardList(QnABoardVO vo, Model model) {
		System.out.println("searchCondition: " + vo.getSearchCondition() 
		+ ", searchKeyword: " + vo.getSearchKeyword());
			//null 체크 - null값에 대한 초기화
			if (vo.getSearchCondition() == null) {
				vo.setSearchCondition("Q_TITLE");
			}
			if (vo.getSearchKeyword() == null) {
				vo.setSearchKeyword("");
			}
			System.out.println("vo: " + vo.toString());
		//DB연동
		List<QnABoardVO> boardList = qnaService.getBoardList(vo);
		//세션에 넣기
		model.addAttribute("boardList", boardList);
		return "/QnA/getBoardList.jsp";
	}
	
	
	@RequestMapping("/QnA/insertBoard.do")
	public String insertBoard(QnABoardVO vo) {
		qnaService.insertBoard(vo);
		return "/QnA/getBoardList.do";
	}	
	

	@RequestMapping("/QnA/updateBoard.do")
	public String updateBoard(
			//SessionAttribute으로 인해 저장된 세션인 QnAboardModel인 QnABoardVO
			QnABoardVO vo) {
		qnaService.updateBoard(vo);
		System.out.println(vo);
		return "/QnA/getBoardList.do";
	}
	
	@RequestMapping("/QnA/deleteBoard.do")
	public String deleteBoard(QnABoardVO vo) {
		qnaService.deleteBoard(vo);
		return "/QnA/getBoardList.do";
	}
	   
	@RequestMapping("/QnA/insertComm.do")
	public String insertComm(QnAComVO vo) {
		qnaService.insertComm(vo);
		return "/QnA/getBoard.do";
	}	
	
	@RequestMapping("/QnA/deleteComm.do")
	public String deleteComm(QnAComVO vo) {
		qnaService.deleteComm(vo);
		return "/QnA/getBoard.do";
	}
}
