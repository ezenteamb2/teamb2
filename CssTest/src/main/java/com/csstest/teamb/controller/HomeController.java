package com.csstest.teamb.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.sound.midi.VoiceStatus;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csstest.teamb.VO.lodgingVO;
import com.csstest.teamb.VO.userVO;
import com.csstest.teamb.repository.lodgingRepository;
import com.csstest.teamb.service.userService;





@Controller
public class HomeController {

	@Autowired
	lodgingRepository repository;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "Main";
	}
	
	@RequestMapping(value="/lodging.do", method=RequestMethod.GET)
	public String view(Model model, HttpSession session) {
		
		
		return "lodging";
	}
	
	
	@Autowired
	userService userService;
	
	@Inject
	BCryptPasswordEncoder pwEncoder;
	
	@ResponseBody
	@PostMapping("/join")
	public ResponseEntity<Map<String, Object>> joinOk(userVO vo) {
	    
	    Map<String, Object> response = new HashMap<>();
	    
	    String encodePw = pwEncoder.encode(vo.getPw());
	    vo.setPw(encodePw);
	    vo.setRole(0);
	    
	    int result = userService.insertUser(vo);
	    
	    if (result > 0) {
	        response.put("success", true);
	    } else {
	        response.put("success", false);
	        response.put("error", "회원가입 중 오류가 발생했습니다.");
	    }
	    
	    return ResponseEntity.ok(response); // ResponseEntity로 응답 반환
	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public Map<String, String> idCheck(@RequestParam("id") String id) {
		
		int count = userService.idCheck(id); 
		
		
		Map<String, String> map = new HashMap<>();
		
		if(count > 0) {
			// 아이디 중복 값이 있다. 
			map.put("result", "failed"); 
		}else {
			// 아이디 중복 값이 없다. 
			map.put("result", "success"); 
		}
	
		return map; 
	}
	
	@ResponseBody
	@PostMapping("/nicknameCheck")
	public Map<String, String> nicknameCheck(@RequestParam("nickname") String nickname) {
		
		int count = userService.nicknameCheck(nickname); 
		
		
		Map<String, String> map = new HashMap<>();
		
		if(count > 0) { 
			map.put("result", "failed"); 
		}else { 
			map.put("result", "success"); 
		}
	
		return map; 
	}
	
	@ResponseBody
	@PostMapping("/login")
	public Map<String, Object> loginOk(userVO vo, HttpSession session) {
	    Map<String, Object> response = new HashMap<>();
	    
	    userVO login = userService.findById(vo.getId());

        // ID가 존재하지 않는 경우
        if (login == null) {
            response.put("success", false);
            response.put("error", "아이디 또는 비밀번호가 잘못되었습니다.");
        }

        // 비밀번호 검증
        if (pwEncoder.matches(vo.getPw(), login.getPw())) {
        	session.setAttribute("loggedInUser", login);
        	session.setAttribute("userRole", login.getRole()); 
            response.put("success", true);
            response.put("message", "로그인 성공");
        } else {
            response.put("success", false);
            response.put("error", "아이디 또는 비밀번호가 잘못되었습니다.");
        }

	    return response;
	}
	
	@PostMapping("/logout")
	public ResponseEntity<Map<String, Object>> logout(HttpSession session) throws Exception{
        session.invalidate(); // 세션 무효화
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "로그아웃 성공");
        return ResponseEntity.ok(response);
	}
	
    @GetMapping("/someProtectedResource")
    public ResponseEntity<?> protectedResource(HttpSession session) {
        userVO loggedInUser = (userVO) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인 필요");
        }
        // 로그인된 사용자에 대한 작업 수행
        return ResponseEntity.ok("접근 허용: " + loggedInUser.getId());
    }
    
    @ResponseBody
    @PostMapping("/findUser")
    public Map<String, Object> findUser(
    		@RequestParam(name="id") String id,
    		@RequestParam(name="nickname") String nickname
    		) { 
    	
    	userVO vo = new userVO();
    	
    	vo.setId(id);
    	vo.setNickname(nickname);
    	
    	userVO result = userService.findUser(vo);
        
        Map<String, Object> map = new HashMap<>();

        if (result != null && result.getRole() == 0) {
            map.put("success", true); 
        } else {
            map.put("success", false); 
        }
        return map;
    }
    
    @ResponseBody
    @PostMapping("/modifyPw")
    public Map<String, Object> modifyPw(
    		@RequestParam(value="id", required = false) String id,
    		@RequestParam("pw") String pw,
    		HttpSession session) {
    	Map<String, Object> map = new HashMap<>();
    	    	
    	userVO vo = new userVO();
    	
    	String encodePw = pwEncoder.encode(pw);
	    vo.setPw(encodePw);
	    
	    if(id == null) {
	    	userVO loggedInUser = (userVO) session.getAttribute("loggedInUser");
	        if (loggedInUser != null) {
	            id = loggedInUser.getId();
	        } else {
	            map.put("success", false);
	            map.put("error", "아이디를 제공해야 합니다.");
	            return map;
	        }
	    }
	    
	    vo.setId(id);
	    
	    int result = userService.modifyPw(vo);
	    
	    if(result > 0) {
	    	map.put("success", true);
	    } else {
	    	map.put("success", false);
	    	map.put("error", "비밀번호 변경에 실패했습니다. 다시 시도해 주세요.");
	    }
    	
    	return map;
    }
    
    @ResponseBody
    @PostMapping("/editProfile")
    public Map<String, Object> editProfile(
    		@RequestParam("id") String id,
    		@RequestParam("address") String address,
    		HttpSession session) {
    	Map<String, Object> map = new HashMap<>();
    	
    	userVO vo = new userVO();
    	vo.setId(id);
    	vo.setAddress(address);
    	
    	int result = userService.editProfile(vo);
    	
    	if(result > 0) {
    		userVO updatedUser = userService.findById(id); 
            session.setAttribute("loggedInUser", updatedUser);
    		map.put("success", true);
    	} else {
    		map.put("success", false);
    		map.put("error", "변경에 실패했습니다");
    	}
    	
    	return map;
    }
    
    @PostMapping("/checkLoginStatus")
    @ResponseBody
    public Map<String, Object> checkLoginStatus(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        userVO loggedInUser = (userVO) session.getAttribute("loggedInUser");
        
        response.put("isLoggedIn", loggedInUser != null);
        return response;
    }
    
    @ResponseBody
    @PostMapping("/delete")
    public Map<String, Object> delete(HttpSession session){
    	Map<String, Object> map = new HashMap<>();
    	
    	userVO loggedInUser = (userVO) session.getAttribute("loggedInUser");
    	int result = userService.deleteUser(loggedInUser.getId());
    	
    	if(result > 0) {
    		session.invalidate();
    		map.put("success", true);
    	} else {
    		map.put("success", false);
    		map.put("error", "탈퇴에 실패했습니다");
    	}
    	return map;
    }

}
