package com.spring.view.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.tic.user.UserService;
import com.spring.tic.user.UserVO;

@Controller
@SessionAttributes("user") 
//클래스안 어느 함수에서 model에 customer라는 이름으로 addAttribute하는 순간
//그 값이 모델에 저장되고 세션에도 저장이 된다.
//데이터가 들어가는 순간 세션까지 덮여쓰이도록
//joinForm으로 갈 때 아무것도 안들어있는 customer객체를 넣어둔다.
//화면으로 다시 돌아왔을때 값이 입력될 수 있도록~ 
public class JoinController {
    @Autowired
    private UserService userService;
    
    //회원가입 입력 폼으로 이동
    @RequestMapping(value="joinForm.do",method = RequestMethod.GET)
    public String joinForm(Model model) {
    	System.out.println(">>회원 가입 폼 이동");
        UserVO user = new UserVO();
        model.addAttribute("user", user);
        return "user/joinForm.jsp";
    }
    //회원가입
    @RequestMapping(value="joinUser.do", method=RequestMethod.POST) //form으로 보냈기 때문에 post로 받는다. 
    public String insertUser(@ModelAttribute("user") UserVO user, Model model) {
    	System.out.println(user.toString());
    	System.out.println("회원 등록 시작");
        int result = userService.insertUser(user);
        //2.joinForm.jsp에서 입력받은 내용들이 model에도 저장, session에도 저장
        //등록 실패해서 forward되서 joinForm으로 돌아갔을 때 잘못 입력한 데이터가 나타나도록
        if(result != 1) {    
        	//등록 실패 
            model.addAttribute("errorMsg", "[등록 실패] 다시 입력해주세요");
            return "joinForm.do";
        }
        System.out.println("회원 등록 종료");
        return "redirect:joinComplete.do";
    }
    //회원가입 성공 폼으로 이동
    @RequestMapping(value="joinComplete.do", method = RequestMethod.GET)//리다이렉트로 이동했기때문에 모든 리다이렉트는 get으로 받음.
    public String joinComplete(SessionStatus session, Model model, @ModelAttribute("user") UserVO user){
            //내가 원하는 경로를 통해서만 들어올 수 있도록, 
            //부가적으로 id를 가져오려고
        System.out.println(">>회원가입 성공 폼 이동");
        model.addAttribute("id", user.getId());
        session.setComplete();
        
        return "user/joinComplete.jsp";
    }
    
  //form 태그에서 온게 아니면 다 GET (지금 까지 배운거로는)
    @RequestMapping(value="idCheck.do", method=RequestMethod.GET)
    public String idCheck(Model model) { 
    	System.out.println(">>아이디 중복확인 창 이동");
        //검색 유무 확인 데이터 
        /* 아이디 중복 확인에 진입하는 두가지 방법 
        1.아이디 중복 확인을 눌렀을 때-> 아무것도 입력이 안되어 있는 상황
        2.입력 후에 검색을 눌렀을 때 -> 사용중이거나 사용중이 아니거나
        */ 
        model.addAttribute("search", false); //이 창이 검색을 해서 뜬 창이 아니다.
        System.out.println("아이디 중복확인 창 이동 종료");
        return "user/idCheckForm.jsp";
    }
    
    @RequestMapping(value="idSearch.do", method = RequestMethod.POST)
    public String idSearch(String searchId, Model model)
    {    
        System.out.println("아이디 중복확인 시작");
        UserVO user = new UserVO();
        user.setId(searchId);
        user = userService.getUserOne(user);
        
        model.addAttribute("searchId", searchId); 
        //idCheckForm.jsp에서 사용할 수 있는지 없는지를 출력할 때 입력받은 아이디가 필요하기 때문에  
        model.addAttribute("searchResult", user);
        //db에 값이 존재하면 customer객체에 담아 idCheckForm.jsp로 전달
        model.addAttribute("search", true);
        //아이디 중복확인 창을 지나는 두가지 경우 중에 검색을 거쳤을 경우에만 true값이 들어간다.     
        System.out.println("아이디 중복확인 종료");
        return "user/idCheckForm.jsp";
    }
    
 
}
