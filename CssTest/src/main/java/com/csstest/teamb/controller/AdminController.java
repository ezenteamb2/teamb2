package com.csstest.teamb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.csstest.teamb.VO.userVO;
import com.csstest.teamb.service.userService;

@Controller
@RequestMapping("/a")
public class AdminController {

	@Autowired
	userService userService;
	
	@GetMapping("/users")
	public String list(Model model, userVO vo, HttpSession session) {
		userVO loggedInUser = (userVO) session.getAttribute("loggedInUser");
	    
	    if (loggedInUser == null) {
	        return "redirect:/"; // 로그인하지 않은 경우 메인 페이지로 리다이렉트
	    }

	    if (loggedInUser.getRole() != 1) {
	        return "redirect:/"; // 권한이 없는 경우 메인 페이지로 리다이렉트
	    }
	    
		List<userVO> list = userService.getAllUser();
		
		model.addAttribute("list", list);
		
		return "userTable";
	}
}
