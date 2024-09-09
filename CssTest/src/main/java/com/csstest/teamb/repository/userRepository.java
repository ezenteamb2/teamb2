package com.csstest.teamb.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csstest.teamb.VO.userVO;

@Repository
public class userRepository {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int insertUser(userVO vo) {
		return template.insert("mappers.userMapper.insertUser", vo);
	}
	
	public int idCheck(String id) {
		return template.selectOne("mappers.userMapper.idCheck", id);
	}
	
	public int nicknameCheck(String nickname) {
		return template.selectOne("mappers.userMapper.nicknameCheck", nickname);
	}
	
	public userVO login(userVO vo) {
		return template.selectOne("mappers.userMapper.login", vo);
	}
	
	public userVO findById(String id) {
		return template.selectOne("mappers.userMapper.findById", id);
	}
	
	public userVO findUser(userVO vo) {
		return template.selectOne("mappers.userMapper.findUser", vo);
	}
	
	public List<userVO> getAllUser() {
		return template.selectList("mappers.userMapper.getAllUser");
	}
	
	public int modifyPw(userVO vo) {
		return template.update("mappers.userMapper.modifyPw", vo);
	}
	
	public int editProfile(userVO vo) {
		return template.update("mappers.userMapper.editProfile", vo);
	}
	
	public int deleteUser(String id) {
		return template.delete("mappers.userMapper.deleteUser", id);
	}
	
}
