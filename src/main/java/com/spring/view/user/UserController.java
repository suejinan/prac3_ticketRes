package com.spring.view.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.tic.user.BuyVO;
import com.spring.tic.user.UserService;
import com.spring.tic.user.UserVO;
import com.spring.tic.user.WishVO;

@Controller
@SessionAttributes("user")
public class UserController {
	@Autowired
	private UserService userService;
	
//	@ModelAttribute("conditionMap")
//	public Map<String, String> searchConditionMap() {
//		Map<String, String> conditionMap = new HashMap<>();
//		conditionMap.put("아이디", "ID");
//		conditionMap.put("이름", "NAME");
//		return conditionMap;
//	}
	@RequestMapping("/home.do")
    public String home(Model model) {
    	System.out.println(">>로그인 폼 이동");
    	
        return "main.jsp";
    }
	////////////////////////////로그인, 로그아웃////////////////////////////	
    @RequestMapping(value="/loginForm.do",method = RequestMethod.GET)
    public String joinForm(Model model) {
    	System.out.println(">>로그인 폼 이동");
    	
        return "user/login.jsp";
    }
    
	//@RequestMapping 에 method 속성 부여해서 요청방식에 따른 처리 설정
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, Model model) {		
		//화면에서 전달받은 ID로 db 검색
        //비밀번호 체크
        //세션 처리 
		System.out.println(">>> 로그인 처리");
        
		UserVO user = userService.getUserOne(vo);
		
        if(user == null) {
            model.addAttribute("errorMSg","존재하지 않는 아이디 입니다.");
            return "user/login.jsp";
        } else if(!(user.getPassword().equals(vo.getPassword()))) {
            model.addAttribute("errorMSg","비밀번호가 틀렸습니다.");
            return "user/login.jsp";
        }
        
        session.setAttribute("userId", user.getId());
        session.setAttribute("userName", user.getName());
        
        System.out.println(">>> 홈으로 이동");
        return "home.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println(">>> 로그아웃 처리");
		//1. 브라우저와 연결된 세션 객체를 종료(초기화)
		session.invalidate();
		//2. 화면 네비게이션(로그인 페이지)
		return "home.do";
	}	
	
///////////////////////////////Mypage(정보 수정, 삭제)////////////////////////////	
	@RequestMapping(value="/mypage.do",method = RequestMethod.GET)
    public String mypage(Model model) {
    	System.out.println(">> 마이페이지 이동");
    	
        return "mypage/myPage.jsp";
    }
	
	@RequestMapping(value="/updateForm.do",method = RequestMethod.GET)
	public String updateForm(HttpSession session, UserVO vo, String id, Model model) {
        System.out.println(">>>[마이페이지]회원정보 상세 조회");
        id = (String)session.getAttribute("userId");
        vo.setId(id);
        UserVO user = new UserVO();
        user = userService.getUserOne(vo);
        model.addAttribute("user", user);
        return  "mypage/myInfo.jsp";
    }
	
	@RequestMapping(value="/updateUser.do")
	public String updateUser(@ModelAttribute("user")UserVO vo, Model model) {
		System.out.println(">>> 회원정보 수정 처리");
		System.out.println("전달받은VO : " + vo.toString());
		//DB 연동 처리
		int result = userService.updateUser(vo);
		if(result != 1) {    
        	//등록 실패 
            model.addAttribute("errorMsg", "[등록 실패] 다시 입력해주세요");
            return "updateForm.do";
        } 
		model.addAttribute("errorMsg", "회원정보가 수정되었습니다.");
		//화면 네비게이션(목록 페이지 이동)
		return "redirect:mypage/updateComplete.jsp";
	}
	
	@RequestMapping("/deleteUser.do")
	public String deleteUser(@ModelAttribute("user")UserVO vo, HttpSession session) {
		System.out.println(">>> 회원 삭제 처리");
		//DB 연동 처리
		userService.deleteUser(vo);
		session.invalidate();
		//화면 네비게이션(목록 페이지 이동)
		return "home.do";
	}
	
///////////////////////////////Mypage(위시리스트)////////////////////////////	
	@RequestMapping("/mywish.do")
	public String getWishList(HttpSession session, UserVO vo, Model model) {
		System.out.println(">>> 마이위시");
		String id = (String)session.getAttribute("userId");
        vo.setId(id);
		//2. DB 연동처리
		List<WishVO> wishList = userService.getWishList(vo);
		//3. ModelAndView 형식으로 작성 후 리턴
		model.addAttribute("wishList", wishList);
		return "mypage/myWish.jsp";
	}
	@RequestMapping("/deleteWish.do")
	public String deleteWish(WishVO vo) {
		System.out.println(">>> 찜 삭제 처리");
		System.out.println(vo.getW_idx());
		System.out.println(vo.toString());
		//DB 연동 처리
		userService.deleteWish(vo);
		//화면 네비게이션(목록 페이지 이동)
		return "mywish.do";
	}
	
///////////////////////////////Mypage(예매리스트)////////////////////////////	
	@RequestMapping("/buylist.do")
	public String getBuyList(HttpSession session, UserVO vo, Model model) {
		System.out.println(">>> 예매내역");
		String id = (String)session.getAttribute("userId");
		vo.setId(id);
		List<BuyVO> buyList = userService.getBuyList(vo);
		model.addAttribute("buyList", buyList);
		return "mypage/buyList.jsp";
	}
	
	@RequestMapping("/deleteBuy.do")
		public String deleteBuy(BuyVO vo) {
		System.out.println(">>> 예매내역 처리");
		System.out.println(vo.getB_idx());
		System.out.println(vo.toString());
		//DB 연동 처리
		userService.deleteBuy(vo);
		//화면 네비게이션(목록 페이지 이동)
		return "buylist.do";
	}
	
}
