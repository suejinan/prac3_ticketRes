package com.spring.tic.user;

import java.util.List;

public interface UserService {

	//**회원가입(JoinController)
	int insertUser(UserVO vo);
	
	//회원 정보 수정
	int updateUser(UserVO vo);
	
	//회원 정보 삭제
	void deleteUser(UserVO vo);
	
	//**회원 정보 상세 조회(한사람)
	UserVO getUserOne(UserVO vo);
	
	//회원 찜 목록
	List<WishVO> getWishList(UserVO vo);
	
	//회원 찜 삭제
	void deleteWish(WishVO vo);
	
	//회원 예매 목록
	List<BuyVO> getBuyList(UserVO vo);
	
	//회원 예매기록 삭제
	void deleteBuy(BuyVO vo);
		
}
