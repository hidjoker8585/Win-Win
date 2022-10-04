package winwin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import winwin.dto.JobopenBasic;
import winwin.dto.Material;
import winwin.dto.SupportBoard;
import winwin.service.SupportBoardService;
import winwin.util.Paging;

@Controller
public class SupportBoardController {

	private static final Logger logger = LoggerFactory.getLogger(SupportBoardController.class);

	@Autowired
	SupportBoardService service;

	@RequestMapping(value = "/support/list", method = RequestMethod.GET)
	public void list(Model model) {
		List<JobopenBasic> title = service.getTitle();
		/*
		int curPage = 1;
		model.addAttribute("curPage", curPage);
		*/
		model.addAttribute("title", title);
	}
	
	@ResponseBody
	@PostMapping(value="/support/list")
	public Map<String, Material> listFile(
			@RequestParam(value="userId") String userId,
			@RequestParam(value="jobOpenNo") int jobOpenNo) {
		
		System.out.println(userId);
		System.out.println(jobOpenNo);
		
		Material mat = service.getFile(userId, jobOpenNo);
		
		Map<String, Material> map = new HashMap<>();
		System.out.println(mat);
		map.put("file", mat);
		
		return map;
	}

	/**
	 * 목록 ajax 호출 
	 * @param page
	 * @param limit
	 * @param pageCount
	 * @param param
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/support/search")
	public Paging listProcess(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "20") int limit,
			@RequestParam(required = false, defaultValue = "5") int pageCount,
			@RequestParam Map<String, Object> param) {
		
		
		
		Paging paging = service.getPaging(page, limit, pageCount, param);
		
		List<SupportBoard> list = service.list(paging, param);
		
		paging.setList(list);
		return paging;
	}
	
	@ResponseBody
	@PostMapping(value = "/support/detail")
	public Map<String, Object> detail(@RequestParam Map<String, Object> param) {
		
		
		String userId = (String)param.get("userId");
		int jobopenNo = Integer.parseInt((String)param.get("jobopenNo"));
		
		Map<String, Object> allData = service.getAllData(userId, jobopenNo);
		
		return allData;
	}
	
	@GetMapping(value="/support/download")
	public ModelAndView download(ModelAndView m,Material file,
				@RequestParam(value="userId") String userId,
				@RequestParam(value="portfolioId") int portfolioId) {
		
		System.out.println(userId);
		System.out.println(portfolioId);
		
		Material downfile = service.download(file);
		
		System.out.println(downfile.toString());
		
		m.setViewName("download");
		m.addObject("downFile",downfile);
		
		System.out.println(userId);
		System.out.println(portfolioId);
		
		return m;
	}
	
	@ResponseBody
	@PostMapping(value="/support/pass")
	public Map<String, Object> pass(
			@RequestParam(value="userId") String userId,
			@RequestParam(value="jobopenNo") int jobopenNo,
			@RequestParam(value="status") String status) {
		
		System.out.println(userId);
		System.out.println(jobopenNo);
		System.out.println(status);
		Map<String, Object> map = new HashMap<>();
		service.statusupdate(jobopenNo, userId, status);
		
		return map;
	}
}
















