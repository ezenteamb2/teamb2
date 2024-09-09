package com.csstest.teamb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csstest.teamb.VO.userVO;
import com.csstest.teamb.repository.userRepository;
import com.csstest.teamb.service.userService;

@Service
public class userServiceImpl implements userService{

	@Autowired
	private userRepository userRepository;
	
	@Override
	public int insertUser(userVO vo) {
		return userRepository.insertUser(vo);
	}

	@Override
	public int idCheck(String id) {
		return userRepository.idCheck(id);
	}

	@Override
	public userVO login(userVO vo) {
		return userRepository.login(vo);
	}

	@Override
	public int nicknameCheck(String nickname) {
		return userRepository.nicknameCheck(nickname);
	}

	@Override
	public userVO findById(String id) {
		return userRepository.findById(id);
	}

	@Override
	public userVO findUser(userVO vo) {
		return userRepository.findUser(vo);
	}

	@Override
	public int modifyPw(userVO vo) {
		return userRepository.modifyPw(vo);
	}

	@Override
	public int editProfile(userVO vo) {
		return userRepository.editProfile(vo);
	}

	@Override
	public int deleteUser(String id) {
		return userRepository.deleteUser(id);
	}

	@Override
	public List<userVO> getAllUser() {
		return userRepository.getAllUser();
	}
	
}
