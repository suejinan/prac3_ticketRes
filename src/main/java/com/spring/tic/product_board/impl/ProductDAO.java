package com.spring.tic.product_board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tic.product_board.ProductVO;

//Mybatis 연동 처리 방법2: SqlSessionTemplate 필드주입
@Repository("productDAO")
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//상품 관리자
	//00. 상품전체목록
	public List<ProductVO> product_index(ProductVO vo) {
		System.out.println("===> product_index() 실행");
		return mybatis.selectList("productDAO.product_index", vo);
	}
	
	//01. 상품목록
	public List<ProductVO> product_list(ProductVO vo) {
		System.out.println("===> product_list() 실행");
		return mybatis.selectList("productDAO.product_list", vo);
	}
	
	//02. 상품상세
	public ProductVO product_view(ProductVO vo) {
		System.out.println("===> product_view() 실행");
		return mybatis.selectOne("productDAO.product_view", vo);
	}
	
	//03. 상품등록
	public void product_insert(ProductVO vo) {
		System.out.println("===> product_insert() 실행");
		mybatis.insert("productDAO.product_insert", vo);
	}
	
	//04. 상품수정
	public void product_update(ProductVO vo) {
		System.out.println("===> product_update() 실행");
		mybatis.update("productDAO.product_update", vo);
	}
	public void product_updatewithFile_name(ProductVO vo) {
		System.out.println("===> product_updatewithFile_name() 실행");
		mybatis.update("productDAO.product_updatewithFile_name", vo);
	}

	//05. 상품삭제
	public void product_delete(ProductVO vo) {
		System.out.println("===> product_delete() 실행");
		mybatis.delete("productDAO.product_delete", vo);
	}

	
}
