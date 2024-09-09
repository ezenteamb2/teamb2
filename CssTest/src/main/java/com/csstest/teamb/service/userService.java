package com.csstest.teamb.service;

import java.util.List;

import com.csstest.teamb.VO.userVO;

public interface userService {
	
	//회원 정보 삽입
	int insertUser(userVO vo); 
	
	//아이디 중복확인
	int idCheck(String id);
	
	//닉네임 중복확인
	int nicknameCheck(String nickname);
	
	//로그인
	userVO login(userVO vo);
	
	//아이디 조회
	userVO findById(String id);
	
	//회원 정보 조회
	userVO findUser(userVO vo);
	
	//모든 회원 조회
	List<userVO> getAllUser();
	
	//비밀번호 변경
	int modifyPw(userVO vo);
	
	//주소 변경
	int editProfile(userVO vo);
	
	//회원 탈뢰
	int deleteUser(String id);
}
