package com.spring.tic.product_board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.tic.product_board.ProductService;
import com.spring.tic.product_board.ProductVO;

@Service("ProductService")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	//상품 관리자
	@Override
	public List<ProductVO> product_index(ProductVO vo) {
		return productDAO.product_index(vo);
	}

	@Override
	public List<ProductVO> product_list(ProductVO vo) {
		return productDAO.product_list(vo);
	}

	@Override
	public ProductVO product_view(ProductVO vo) {
		return productDAO.product_view(vo);
	}

	@Override
	public void product_insert(ProductVO vo) {
		productDAO.product_insert(vo);
	}

	@Override
	public void product_update(ProductVO vo) {
		productDAO.product_update(vo);
	}
	@Override
	public void product_updatewithFile_name(ProductVO vo) {
		productDAO.product_updatewithFile_name(vo);
	}

	@Override
	public void product_delete(ProductVO vo) {
		productDAO.product_delete(vo);
	}

	@Override
	public ProductVO buyticket(ProductVO vo) {
		// TODO Auto-generated method stub
		return null;
	}


	

}
