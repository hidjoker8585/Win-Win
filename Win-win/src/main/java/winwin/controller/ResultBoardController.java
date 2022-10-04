package winwin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import winwin.dto.JobopenBasic;
import winwin.dto.Mail;
import winwin.dto.SupportBoard;
import winwin.service.SupportBoardService;
import winwin.util.Paging;

@Controller
public class ResultBoardController {

	private static Logger logger;

	@Autowired
	SupportBoardService service;

	@RequestMapping(value = "/result/list", method = RequestMethod.GET)
	public void list(Model model) {

		// int curPage = 1;
		List<JobopenBasic> title = service.getTitle();

		// model.addAttribute("curPage", curPage);
		model.addAttribute("title", title);
	}

	@ResponseBody
	@RequestMapping(value = "/result/search")
	public Paging listProcess(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "20") int limit,
			@RequestParam(required = false, defaultValue = "5") int pageCount,
			@RequestParam Map<String, Object> param) {

		Paging paging = service.resultPaging(page, limit, pageCount, param);

		System.out.println(param);
		System.out.println(paging);

		List<SupportBoard> resultlist = service.resultlist(paging, param);

		paging.setList(resultlist);

		return paging;
	}

	@ResponseBody
	@PostMapping(value = "/result/emailsend")
	public Map<Object, Object> emailsend(
					@RequestParam(value="userId[]") List<String> userId,
					@RequestParam(value="title[]") List<String> title,
					@RequestParam(value="username[]") List<String> username,
					@RequestParam(value="pass[]") List<String> pass,
					@RequestParam(value="passNo[]") List<String> passNo) {
			
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		SendPassEmail SendPassEmail = new SendPassEmail();
		SendFailEmail SendFailEmail = new SendFailEmail();
		Mail mail = new Mail();
		
		System.out.println(passNo);
		System.out.println(userId);
		
		for(int i=0; i<userId.size();i++) {
			if(pass.get(i).equals("합격")) {
				mail.setSender(userId.get(i));
				mail.setTitle(username.get(i)+"님의 지원결과 메일입니다.");
				mail.setContent(title.get(i));
				
				service.emailupdate(Integer.parseInt(passNo.get(i)));
				SendPassEmail.sendMail(mail);
				
			} else if(pass.get(i).equals("불합격")) {
				mail.setSender(userId.get(i));
				mail.setTitle(username.get(i)+"님의 지원결과 메일입니다.");
				mail.setContent(title.get(i));
				
				service.emailupdate(Integer.parseInt(passNo.get(i)));
				SendFailEmail.sendMail(mail);
			} 
		}
		
		
				
		return map;
	}
}
