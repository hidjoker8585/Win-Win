package winwin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.PrivateKey;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import winwin.dto.Mail;
import winwin.dto.Member;
import winwin.dto.RSA;
import winwin.service.MemberService;
import winwin.util.RSAUtil;

@Controller
public class UserController {

	@Autowired
	MemberService memberservice;


	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public void join() {
		logger.info("회원가입 페이지");
	}

	@RequestMapping(value = "/user/join", method = RequestMethod.POST)
	public String joinProc(Member member) {
		logger.info("회원가입 성공");
		logger.info(member.toString());
		memberservice.join(member);

		return "redirect:/user/login";
	}

	@RequestMapping(value = "/user/idcheck", method = RequestMethod.POST)
	public void idcheck(HttpServletRequest request, HttpServletResponse resp, Member member) {
		logger.info("아이디 중복확인");

		String userid = request.getParameter("userid");
		member.setUserid(userid);
		boolean success = memberservice.idcheck(member);
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter out;
		try {
			out = resp.getWriter();
			out.append("{\"success\":" + success + "}");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public void login(HttpSession session, Model model) {
		logger.info("로그인 페이지");

		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
		if (key != null) { // 기존 key 파기
			session.removeAttribute("RSAprivateKey");
			logger.info("기존 key파기 성공");
		}

		RSAUtil rsaUtil = new RSAUtil();
		RSA rsa = rsaUtil.createRSA();

		model.addAttribute("modulus", rsa.getModulus());
		model.addAttribute("exponent", rsa.getExponent());
		session.setAttribute("RSAprivateKey", rsa.getPrivateKey());
	}

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> loginProc(Member member, HttpSession session, RedirectAttributes ra) {

		logger.info("로그인 활성화");
		Map<Object, Object> map = new HashMap<Object, Object>();
		// 개인키 취득
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");

		if (key == null) {
			ra.addFlashAttribute("resultMsg", "비정상적인 접근입니다.");
		}

		// session에 저장된 개인키 초기화
		session.removeAttribute("RSAprivateKey");

		RSAUtil rsaUtil = new RSAUtil();

		// 아이디/비밀번호 복호화
		try {

			String password = rsaUtil.getDecryptText(key, member.getPwd());

			logger.info("복호화 한 password : " + password);
			logger.info(member.toString());

			member.setPwd(password);
			boolean success = memberservice.login(member);

			if (success == true) {
				logger.info("email, password 일치!");
				member = memberservice.info(member);
				session.setAttribute("login", true);
				session.setAttribute("id", member.getUserid());
				session.setAttribute("name", member.getUsername());
				map.put("success", success);
			
			} else {
				logger.info("email, password 불일치!");
			
			}
		} catch (Exception e) {
			ra.addFlashAttribute("resultMsg", "비정상적인 접근입니다");
			
		}
		return map;
	}

	@RequestMapping(value = "user/loginHelper", method = RequestMethod.GET)
	public void loginHelper() {
		logger.info("이메일/비밀번호찾기 페이지");
	}

	@RequestMapping(value = "user/idSearch", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> idSearchProc(String username, String phone, Member member) {
		logger.info("이메일 찾기");
		Map<Object, Object> map = new HashMap<Object, Object>();
		member.setUsername(username);
		member.setPhone(phone);
		boolean success = memberservice.emailSearchCnt(member);
		if (success == true) {
			logger.info("일치");
			member = memberservice.emailSearch(member);
			String userid = member.getUserid();
			logger.info(userid);
			map.put("success", success);
			map.put("userid", userid);
		} else {
			logger.info("불일치!");
		}
		return map;
	}
	
	@RequestMapping(value = "user/pwdSearch", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> pwdSearchProc(String username2, String userid, Member member) {
		logger.info(member.toString());
		logger.info("비밀번호 찾기");
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		member.setUsername(username2);
		member.setUserid(userid);
		logger.info(member.toString());
		
		boolean success = memberservice.pwdSearchCnt(member);
		
		if (success == true) {
			logger.info("일치");
			member = memberservice.pwdSearch(member);
			SendMail sendmail = new SendMail();
			Mail mail = new Mail();
			
			String newPw = null;
			int min = 100000; 
			int max = 999999;
			double doubleRanNum = Math.floor(Math.random()*(max-min+1))+min;		
			int intRanNum = (int)doubleRanNum;		
			newPw = String.valueOf(intRanNum);
			member.setPwd(newPw);
			member.setUserid(userid);
			logger.info(member.toString());
			
			memberservice.temppwchange(member);
			mail.setContent(newPw);
			mail.setSender(userid);
			mail.setTitle(userid+"님의 비밀번호 찾기 메일입니다.");
			sendmail.sendMail(mail);
			map.put("success", success);
			map.put("pwd", newPw);
		} else {
			logger.info("불일치!");
		}
		return map;
	}

	@RequestMapping(value = "/user/pwchange", method = RequestMethod.GET)
	public void pwChange() {
		logger.info("비밀번호 변경 페이지");
		
	}

	@RequestMapping(value = "/user/pwchange", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> pwChangeProc(String userid, String temppwd, String chpwd, Member member) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		logger.info(member.toString());
		member.setPwd(temppwd);
		logger.info(member.toString());
		boolean success = memberservice.pwChangeCnt(member);
		
		if(success == true) {
			logger.info("일치!");
			member.setPwd(chpwd);
			logger.info(member.toString());
			memberservice.pwdChange(member);
			map.put("success", success);
		} else {
			logger.info("불일치!");
		}
		return map;
	}

	@RequestMapping(value = "user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그아웃 성공");
		session.invalidate();
		return "redirect:/user/login";
	}
}
