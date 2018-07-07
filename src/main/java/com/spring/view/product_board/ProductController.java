package com.spring.view.product_board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.tic.product_board.ProductService;
import com.spring.tic.product_board.ProductVO;


@Controller
//@SessionAttributes : session에 저장 설정, 수정작업에 유용
@SessionAttributes("product")
public class ProductController {
   @Autowired
   private ProductService productService;
   
   //상품 관리자
   //01. 상품전체목록
   @RequestMapping("/product/product_list.do")
   public String product_index (ProductVO vo, Model model) {
      System.out.println(">>> 상품 전체 목록 조회");
      List<ProductVO> product_index = productService.product_index(vo);
      model.addAttribute("product_index", product_index);
      return "product_index.jsp";
   }
   
   //02. 카테고리별 목록
   @RequestMapping("/product/product_list_category.do")
   public String product_list (ProductVO vo, Model model) {
      System.out.println(">>> 상품 목록 조회");
      List<ProductVO> product_list = productService.product_list(vo);
      model.addAttribute("product_list", product_list);
      return "product_list.jsp";
      
   }
      
   //03. 상품상세
   @RequestMapping("/product/product_view.do")
   public String product_view (ProductVO vo, Model model) {
      System.out.println(">>> 상품 상세");
      System.out.println("vo : " + vo.toString());
      model.addAttribute("product", productService.product_view(vo));
      return "product_view.jsp";
   }
   
   //04. 상품등록
   @RequestMapping("/product/product_insert.do")
   public String product_insert (ProductVO vo) throws IllegalStateException, IOException  {
      System.out.println(">>> 상품 등록");
      System.out.println("vo : " + vo.toString());

      //파일 업로드 처리
      //MultipartFile 인터페이스의 주요 메소드
      //String getOriginalFilename() : 업로드한 파일명
      //void transferTo(File destFile) : 업로드한 파일을 destFile에 저장
      //boolean isEmpty() : 업로드한 파일의 존재여부(없으면 true 리턴)
      MultipartFile uploadFile = vo.getUploadFile();
      if(!uploadFile.isEmpty()) {
         String file_name = uploadFile.getOriginalFilename(); //실제파일명
         uploadFile.transferTo(new File("c:/java/70_Spring/ticketproject(realfinal)/src/main/webapp/resources/img/" + file_name));
         vo.setFile_name(file_name);
      }
      productService.product_insert(vo);

      return "product_list.do";
   }
   
   //05. 상품수정
   @RequestMapping("/product/product_updateForm.do")
   public String product_updateForm (ProductVO vo, Model model) throws IllegalStateException, IOException {
      System.out.println(">>> 상품 수정 폼으로 이동");
      model.addAttribute("product", productService.product_view(vo));
      System.out.println("vo : " + vo.toString());
      return "product_update.jsp";
   }
   
   @RequestMapping("/product/product_update.do")
   public String product_update (@ModelAttribute("product")ProductVO vo) throws IllegalStateException, IOException {
      System.out.println(">>> 상품 수정");
      System.out.println("vo : " + vo.toString());
      MultipartFile uploadFile = vo.getUploadFile();
      if(!uploadFile.isEmpty()) {
         System.out.println("//새로 첨부파일 넣을 때");
         //새로 첨부파일 넣을 때 
         //매퍼 업데이트문에 file_name 컬럼 까지 전부 업데이트
         String file_name = uploadFile.getOriginalFilename(); //실제파일명
         uploadFile.transferTo(new File("c:/java/70_Spring/ticketproject(realfinal)/src/main/webapp/resources/img/" + file_name));
         vo.setFile_name(file_name);
         productService.product_updatewithFile_name(vo);
      } else {
         System.out.println("//기존의 파일 그대로 사용 할때");
         //기존의 파일 그대로 사용 할때 
         //매퍼 업데이트문에 file_name 컬럼 빼고 업데이트
         productService.product_update(vo);
      }
      return "product_list.do";
   }
   
   //06. 상품삭제
   @RequestMapping("/product/product_delete.do")
   public String product_delete(ProductVO vo, @RequestParam int play_id) {
      System.out.println(">>> 상품 삭제");
      productService.product_delete(vo);
      return "product_list.do";
   }
   
   //07. 상품검색
   /*
   @ModelAttribute 설정을 통해 View에 전달할 데이타를 만들어서 전달
   View(JSP)에서 전달받은 데이타를 사용
   @ModelAttribute로 정의된 메소드는 @RequestMapping 보다 먼저 실행됨
   "conditionMap"라는 이름으로 Map객체를 담아서 전달
   */
   @ModelAttribute("conditionMap")
   public Map<String, String> searchConditionMap() {
      Map<String, String> conditionMap = new HashMap<>();
      conditionMap.put("제목", "TITLE");
      conditionMap.put("내용", "CONTENT");
      return conditionMap;
   }
   
 //페이지 이동
   @RequestMapping("/product/buyticket.do")
   public String buyticket(ProductVO vo, Model model, HttpSession session){
      System.out.println(">>> 상품 확인");
         System.out.println("vo : " + vo.toString());
     
         model.addAttribute("product", productService.product_view(vo));
         return "buyticket.jsp";
   
   }
   
}