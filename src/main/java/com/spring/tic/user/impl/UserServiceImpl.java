package com.spring.tic.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.tic.user.BuyVO;
import com.spring.tic.user.UserService;
import com.spring.tic.user.UserVO;
import com.spring.tic.user.WishVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAOMybatis userDAO;

	@Override
	public int insertUser(UserVO vo) {
		return userDAO.insertUser(vo);
	}

	@Override
	public int updateUser(UserVO vo) {
		return userDAO.updateUser(vo);
	}

	@Override
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}

	@Override
	public UserVO getUserOne(UserVO vo) {
		return userDAO.getUserOne(vo);
	}

	@Override
	public List<WishVO> getWishList(UserVO vo) {
		return userDAO.getWishList(vo);
	}

	@Override
	public void deleteWish(WishVO vo) {
		userDAO.deleteWish(vo);
	}

	@Override
	public List<BuyVO> getBuyList(UserVO vo) {
		return userDAO.getBuyList(vo);
	}

	@Override
	public void deleteBuy(BuyVO vo) {
		userDAO.deleteBuy(vo);
	}


}
