package winwin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import winwin.dto.JobopenBasic;
import winwin.dto.Member;
import winwin.dto.Support;
import winwin.dto.UserDetail;
import winwin.service.Apply1Service;
import winwin.service.ApplyMenuService;

@Controller
@RequestMapping(value="/applyMenu")
public class ApplyMenuController {
	
	@Autowired ApplyMenuService applyMenuService;
	@Autowired Apply1Service apply1Service;
	
	@RequestMapping(value="/selectApply", method = RequestMethod.GET)
	public void selectApply(Model model) {
		
		List<JobopenBasic> list = applyMenuService.getJobopenBasic();
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping(value="/selectApply", method = RequestMethod.POST)
	public @ResponseBody Map<String, List> selectApplyProc(HttpServletResponse resp) {
		
		Map<String, List> map = new HashMap<String, List>();
		
		
		List<JobopenBasic> list1 = applyMenuService.getJobopenBasic();
		
		List<JobopenBasic> list2 = applyMenuService.getJobopenBasic2();
		
		map.put("result1", list1);
		map.put("result2", list2);
		
//		System.out.println("end날짜 확인" +list2);
		
		return map;
		
		
	}
	
	@RequestMapping(value="/passfail", method = RequestMethod.GET)
	public void passfail(Model model) {		
		List<JobopenBasic> list = applyMenuService.getJobopenBasic3();
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/passfail", method = RequestMethod.POST)
	public @ResponseBody Map<String, List> passfailProc(HttpServletResponse resp) {
		Map<String, List> map = new HashMap<String, List>();
		
		
		List<JobopenBasic> list1 = applyMenuService.getJobopenBasic3();
		
		List<JobopenBasic> list2 = applyMenuService.getJobopenBasic4();
		
		map.put("result1", list1);
		map.put("result2", list2);
		return map;	
		
	}
	
	
	@RequestMapping(value="/sessionCheck", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> sessionCheck(HttpServletResponse resp, HttpSession session, int jobopenNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Object obj = session.getAttribute("login");
		
		
		if( session.getAttribute("login") != null ) {
			
			Support supp = new Support();
			supp.setUserId((String)session.getAttribute("id"));
			supp.setJobopenNo(jobopenNo);
			
			Object obj2 = applyMenuService.checkApplicant(supp);
			
			map.put("checkApp", obj2);
		}
		
		
		map.put("result", obj);
		return map;
		
	}
	
	
	@RequestMapping(value="/loginCheck", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> loginCheck(HttpSession session/*, int jobopenNo*/) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Object obj = session.getAttribute("login");

//		if( session.getAttribute("login") != null ) {
//			
//			Support supp = new Support();
//			supp.setUserId((String)session.getAttribute("id"));
//			supp.setJobopenNo(jobopenNo);
//			
//			Object obj2 = applyMenuService.checkApplicant(supp);
//			
//			map.put("checkApp", obj2);
//		}
		
		map.put("result", obj);
		return map;
	}

	@RequestMapping(value="/pwdCheck", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> pwdCheck(HttpSession session , String pw ) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 세션에서 로그인 아이디 가져와서 입력받은 비밀번호랑 정보 같은지 확인해서 결과 반환
		
		Object LoginId = session.getAttribute("id");
		
		Member member = new Member();
		
		member.setUserid((String)session.getAttribute("id"));
		member.setPwd(pw);
		
		boolean pwCheck = applyMenuService.pwCheck(member);
		
		map.put("pwCheck", pwCheck);
		return map;
	}
	
	@RequestMapping(value="/passfailCheck", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> passfailCheck(HttpSession session, int jobopenNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Support supp = new Support();
		
		
		supp.setUserId((String)session.getAttribute("id"));
		supp.setJobopenNo(jobopenNo);
		
		if (applyMenuService.checkApplicant(supp)) {
			
			supp = applyMenuService.passfail(supp);
			
			Object obj = supp.getPass();
			
			map.put("result", obj);
			
		} else {
			
			Object obj2 = "지원결과없음";
			map.put("result", obj2);
		}
		
		
		return map;
	}
	
	@RequestMapping(value="/cntUserD", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> cntUserD(HttpSession session, int jobopenNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		UserDetail userDetail = new UserDetail();
		
		
		userDetail.setUserId((String)session.getAttribute("id"));
		userDetail.setJobopenNo(jobopenNo);
		
		Object obj = apply1Service.countUserDetail(userDetail);

			
		map.put("result", obj);

		
		
		return map;
	}
	
	
}
