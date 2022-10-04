package winwin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import winwin.dto.JobopenBasic;
import winwin.service.JobopenService;
import winwin.util.Paging;

@Controller
@RequestMapping(value="/jobOpen")
public class JobopenManageController {
	
	@Autowired JobopenService jobopenService;
	
	private static final Logger logger = LoggerFactory.getLogger(JobopenManageController.class);

	@RequestMapping(value="/manage", method=RequestMethod.GET)
	public void manage(Model model,
			@RequestParam(required=false, defaultValue="0") int curPage,
			@RequestParam(required=false, defaultValue="15") int listCount,
			@RequestParam(required=false, defaultValue="10") int pageCount,
			HttpSession session) {			
		session.setAttribute("insertDetail", true);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/manage", method=RequestMethod.POST)
	public Paging manageAjax(Model model,
			@RequestParam(required=false, defaultValue="0") int curPage,
			@RequestParam(required=false, defaultValue="15") int listCount,
			@RequestParam(required=false, defaultValue="10") int pageCount,
			@RequestParam(required=false, defaultValue="전체 확인") String status) {
		
		
		Paging paging = jobopenService.getStPaging(curPage, listCount, pageCount, status);
	
		
		List<JobopenBasic> list = jobopenService.selectBasic(paging);
		
		paging.setList(list);
		
		return paging;
	}
	
	
	@RequestMapping(value="/jo_delete", method=RequestMethod.POST)
	public String manageDelete(int jobopenNo) {
		
		jobopenService.deleteJobopen(jobopenNo);
		
		return "/jobOpen/manage";
	}
	
	@RequestMapping(value="/jo_status", method=RequestMethod.POST)
	public String manageStatus(JobopenBasic jobopenBasic) {
		
		jobopenService.updateStatusByNo(jobopenBasic);
		
		return "/jobOpen/manage";
	}
	
}
