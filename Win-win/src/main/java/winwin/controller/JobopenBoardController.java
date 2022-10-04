package winwin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import winwin.dto.JobopenBasic;
import winwin.dto.JobopenDetail;
import winwin.service.JobopenService;
import winwin.util.Paging;

@Controller
@RequestMapping(value="/jobOpen")
public class JobopenBoardController {
	
	@Autowired JobopenService jobopenService;
	
	@RequestMapping(value="/list", method = RequestMethod.GET) 
	public void list(
			Model model,
			@RequestParam(required=false, defaultValue="0") int curPage,
			@RequestParam(required=false, defaultValue="15") int listCount,
			@RequestParam(required=false, defaultValue="10") int pageCount) {			
		
		Paging paging = jobopenService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging", paging);
		
		String status = "메인";
		paging.setStatus(status);
		List<JobopenBasic> list = jobopenService.selectBasic(paging);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public void view(Model model, @RequestParam int boardNo) {
	
		JobopenBasic jobopenBasic = new JobopenBasic();
		JobopenDetail jobopenDetail = new JobopenDetail();
		
		jobopenBasic.setJobopenNo(boardNo);
		jobopenDetail.setJobopenNo(boardNo);
		
		jobopenBasic = jobopenService.viewBasic(jobopenBasic);
		List<JobopenDetail> detail = jobopenService.selectDetail(jobopenDetail);
		
		model.addAttribute("basic", jobopenBasic);
		model.addAttribute("detail", detail);

		Date date = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String today = fmt.format(date);
		model.addAttribute("today", today);
		if( jobopenBasic.getEndDate() != null ) {
			Date d = jobopenBasic.getEndDate();
			String end = fmt.format(d);
			model.addAttribute("end", end);
		}
		
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete(@RequestParam int boardNo) {
		
		JobopenBasic jobopenBasic = new JobopenBasic();
		JobopenDetail jobopenDetail = new JobopenDetail();
		
		
		jobopenBasic.setJobopenNo(boardNo);
		jobopenDetail.setJobopenNo(boardNo);
		
		jobopenService.deleteJobopen(boardNo);
		
		return "redirect:/jobOpen/list";
	}
}
