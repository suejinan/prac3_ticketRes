package com.spring.view.review_board;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.tic.review_board.ReviewService;
import com.spring.tic.review_board.ReviewVO;
import com.spring.tic.user.BuyVO;

@Controller
@SessionAttributes("review")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("연극", "PLAY");
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("작성자", "ID");
		return conditionMap;
	}
	
	@RequestMapping("/Review/getReviewList.do")
	public String getReviewList(ReviewVO vo, Model model) {
		System.out.println(">> 글 목록 조회 처리");
		//null 체크 - null값에 대한 초기화
			if (vo.getSearchCondition() == null) {
				vo.setSearchCondition("R_TITLE");
			}
			if (vo.getSearchKeyword() == null) {
				vo.setSearchKeyword("");
			}
		//DB연동
		List<ReviewVO> reviewList = reviewService.getReviewList(vo);
		for(int i=0; i<reviewList.size(); i++) {
			System.out.println(reviewList.get(i).toString());
		}
		//세션에 넣기
		model.addAttribute("reviewList", reviewList);
		return "/Review/getReviewList.jsp";
	}
	
	@RequestMapping("/Review/getReview.do")
	public String getReview(ReviewVO vo, Model model) {
		System.out.println(">> 후기 상세 조회");
		System.out.println(vo.toString());
		//조회수증가
		reviewService.updateReviewHit(vo);
		//세션에 넣기
		model.addAttribute("review", reviewService.getReview(vo));
		
		return "/Review/getReviewOne.jsp";
	}
	
	@RequestMapping(value="/Review/insertForm.do",method = RequestMethod.GET)
	public String insertForm(BuyVO vo, Model model, HttpSession session) {
		System.out.println(">>> 후기 폼 이동 처리");
		int play_id = vo.getPlay_id();
		String title = vo.getTitle();
		String id = (String)session.getAttribute("userId");
		System.out.println("title:" + title + ", play_id : "+ play_id);
		ReviewVO review = new ReviewVO();
		review.setPlay_id(play_id);
		review.setTitle(title);
        review.setId(id);
        
		model.addAttribute("review", review);
	return "/Review/insertReview.jsp";
	}
	
	@RequestMapping(value="/Review/insertReview.do", method=RequestMethod.POST)
	public String insertReview(MultipartHttpServletRequest request, HttpSession session) throws Exception {
		System.out.println(">>> 후기 등록 처리");
		String r_title = request.getParameter("r_title");
		String title = request.getParameter("title");
		String r_content = request.getParameter("r_content");
		String play_id = request.getParameter("play_id");
		
		System.out.println("r_title : " + r_title);
		System.out.println("title : " + title);
		System.out.println("r_content : " + r_content);
		System.out.println("play_id : " + play_id);
		
		ReviewVO vo = new ReviewVO();
		vo.setR_title(r_title);
		vo.setTitle(title);
		vo.setR_content(r_content);
		vo.setPlay_id(Integer.parseInt(play_id));
		vo.setId((String)session.getAttribute("userId"));
		reviewService.insertReview(vo);
		
		MultipartFile uploadFile = request.getFile("uploadFile");
		if(!(uploadFile.isEmpty())) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));//-> .확장자
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + ext;
	
			System.out.println("------------- file start -------------"); 
	        System.out.println("originalFileName:"+originalFileName); 
	        System.out.println("ext\t:"+ext); 
	        System.out.println("storedFileName:"+storedFileName);
	        System.out.println("-------------- file end --------------");
	        
	        /*resources루트를 가져오기 */
//	        String filePath = "C:\\java\\70_Spring\\ticketproject(realfinal)\\src\\main\\webapp\\resources\\review\\";
//	        String filePath = "classpath:/resources\\review\\";
	        Set filePath =request.getSession().getServletContext().getResourcePaths("/"); //web-inf바로전 까지 경로 가져오기저장할 경로
	        System.out.println("파일 저장 경로:" + filePath);
	        
	        //파일 이동(파일 카피가 아님)            
	        File file = new File(filePath + storedFileName);
	        
	        //파일 저장 
	        uploadFile.transferTo(file);
	        
	        //DB저장 
	        Map<String, Object> map = new HashMap<String,Object>(); 
	        map.put("original_file_name", originalFileName); 
	        map.put("saved_file_name", storedFileName);
	        map.put("file_size", uploadFile.getSize());
	        
	        reviewService.insertFile(map);
		}
		return "redirect:/Review/getReviewList.do";
    }
	
	@RequestMapping("/Review/updateReviewForm.do")
	public String updateReviewForm(ReviewVO vo, Model model) {
		System.out.println(">> 후기 수정폼 이동");
		System.out.println("전달받은VO : " + vo.toString());
		model.addAttribute("review", reviewService.getReview(vo));
		
		return "/Review/updateReview.jsp";
	}
	
	@RequestMapping("/Review/updateReview.do")
	public String updateReview(MultipartHttpServletRequest request, HttpSession session) throws Exception {
		System.out.println(">>후기 수정 처리");
		String r_idx = request.getParameter("r_idx");
		String r_title = request.getParameter("r_title");
		String r_content = request.getParameter("r_content");
		String file_idx = request.getParameter("file_idx");
		String id = (String)session.getAttribute("userId");
		System.out.println("file_idx: "+file_idx);
		
		ReviewVO updatevo = new ReviewVO();
		updatevo.setR_idx(Integer.parseInt(r_idx));
		updatevo.setR_title(r_title);
		updatevo.setR_content(r_content);
		updatevo.setFile_idx(Integer.parseInt(file_idx));
		updatevo.setId(id);

		reviewService.updateReview(updatevo);//REVIEW_BOARD 업데이트
		
		System.out.println("update할 vo : " + updatevo.toString());
		MultipartFile uploadFile = request.getFile("uploadFile");

		//새로운 첨부파일이 있을 경우
		if(!(uploadFile.isEmpty())) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));//-> .확장자
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + ext;

			System.out.println("------------- file start -------------"); 
	        System.out.println("originalFileName |"+originalFileName); 
	        System.out.println("ext\t |"+ext); 
	        System.out.println("storedFileName |"+storedFileName);
	        System.out.println("-------------- file end --------------");
	        updatevo.setOriginal_file_name(originalFileName);
	        updatevo.setSaved_file_name(storedFileName);
	        updatevo.setFile_size(uploadFile.getSize());
	        /*resources루트를 가져오기 */
	        String filePath = "C:\\java\\70_Spring\\ticketproject(realfinal)\\src\\main\\webapp\\resources\\review\\";
	        System.out.println("파일 저장 경로:" + filePath);
	        
	        //파일 이동(파일 카피가 아님)            
	        File file = new File(filePath + storedFileName);
	        
	        //파일 저장 
	        uploadFile.transferTo(file);
			
			if(updatevo.getFile_idx() != 0) {
			//기존의 첨부파일이 있는 경우
				//기존의 DB내용을 수정 후 새로운 파일을 서버에 등록
				System.out.println("파일 있는데 수정");
				reviewService.updateFile(updatevo);
			} else {
			//기존의 첨부파일이 없는 경우
				//DB에 새로운 내용 insert 후 새로운 파일을 서버에 등록 
				System.out.println("파일 없을때 수정");
				reviewService.insertUploadFile(updatevo);
			}
			
		}

		return "/Review/getReviewList.do";
	}
	
	@RequestMapping("/Review/deleteReview.do")
	public String deleteReview(ReviewVO vo) {
		System.out.println(">>후기 삭제 처리");
		System.out.println(vo);
		vo = reviewService.getReview(vo);
		System.out.println(">>"+ vo.toString());

		if(!(vo.getSaved_file_name()==null)) {
			System.out.println("controller");
			reviewService.deleteFile(vo);
		}
		reviewService.deleteReview(vo);
		
		return "/Review/getReviewList.do";
	}
	
	
}
