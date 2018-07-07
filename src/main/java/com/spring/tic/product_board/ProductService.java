package com.spring.tic.product_board;

import java.util.List;

public interface ProductService {
	//상품 관리자(product_management)
	//전체상품
	List<ProductVO> product_index(ProductVO vo);
	//카테고리별 상품
	List<ProductVO> product_list(ProductVO vo);
	//글 상세 조회
	ProductVO product_view(ProductVO vo);
	//상품등록
	void product_insert(ProductVO vo);
	//상품수정
	void product_update(ProductVO vo);
	void product_updatewithFile_name(ProductVO vo);
	//상품삭제
	void product_delete(ProductVO vo);
	
	
	ProductVO buyticket(ProductVO vo);
}
