
package winwin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import winwin.dto.Admin;
import winwin.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService adminservice;

	private static final Logger logger =
			LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="/admin/adminLogin", method=RequestMethod.GET)
	public void adminlogin(HttpSession session, Model model) {
		logger.info("관리자 로그인 폼");

	}
	
	@RequestMapping(value="/admin/adminLogin", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> adminloginProc(HttpSession session, int adminCode, Admin admin) {
		logger.info("관리자 로그인");
		Map<Object, Object> map = new HashMap<Object, Object>();
		admin.setAdminCode(adminCode);
		logger.info(admin.toString());
		boolean success = adminservice.adminlogin(admin);
		if(success==true) {
			logger.info("관리자 로그인 성공!");
			admin = adminservice.adminInfo(admin);
			session.setAttribute("adminLogin", true);
			session.setAttribute("admincode", admin.getAdminCode());
			session.setAttribute("adminname", admin.getNick());
			map.put("success", success);
			
		}  else {
		logger.info("로그인 실패");
		}
		return map;
	}
	
	@RequestMapping(value="/admin/adminLogout", method=RequestMethod.GET)
	public String adminLogout(HttpSession session) {
		logger.info("관리자 로그아웃");
		session.invalidate();
		return "redirect:/admin/adminLogin";
	}
}
