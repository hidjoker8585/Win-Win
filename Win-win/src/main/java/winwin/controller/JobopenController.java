package winwin.controller;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import winwin.dto.JobopenArr;
import winwin.dto.JobopenBasic;
import winwin.dto.JobopenDetail;
import winwin.service.JobopenService;

/**
 * 
 * @author 김동현
 * @category 채용 공고
 * 
 * First commit : 18.10.10 
 * 
 * memo : start winwin project
 *
 *
 * Last commit : 18.11.02
 * 
 * memo : remains update page
 */

@Controller
@RequestMapping(value="/jobOpen")
public class JobopenController {
	
	private static final Logger logger = LoggerFactory.getLogger(JobopenController.class);
	
	@Autowired
	JobopenService jobopenService;
	
	@RequestMapping(value="/basicInfo", method=RequestMethod.GET)
	public void basic(HttpSession session) {
		session.removeAttribute("insertDetail");
	}
	
	@RequestMapping(value="/basicInfo", method=RequestMethod.POST)
	public String basicProc(@Validated JobopenBasic jobopenBasic, Errors errors, HttpSession session) {
	      if( errors.hasErrors() ) {
	          jobopenBasic.setStartPay(0);
	          jobopenBasic.setEndPay(0);
	       }
	      
	      if(jobopenBasic.getRulePay()==null) {
	    	  jobopenBasic.setRulePay("0");
	      }
	      if(jobopenBasic.getAllOpen()==null) {
	    	  jobopenBasic.setAllOpen("0");
	      }
	      
	      
	      jobopenService.writeBasic(jobopenBasic);
	      session.setAttribute("jobopen", jobopenBasic.getJobopenNo());
	      
	      logger.info(jobopenBasic.toString());
	
		return "redirect:detailInfo";
	}
	
	@RequestMapping(value="/basicUpdate", method=RequestMethod.GET)
	public void basicUpdate(int jobopenNo, Model model, HttpSession session) {
		
		JobopenBasic basic = new JobopenBasic();
		session.setAttribute("jobopen", jobopenNo);
		basic.setJobopenNo(jobopenNo);
		
		model.addAttribute("basic", jobopenService.getBasic(basic));
		
	}
	
	@RequestMapping(value="/basicUpdate", method=RequestMethod.POST)
	public String basicUpdateProc(@Validated JobopenBasic jobopenBasic, Errors errors, HttpSession session) {
		
		if( errors.hasErrors() ) {
	          jobopenBasic.setStartPay(0);
	          jobopenBasic.setEndPay(0);
	       }
	      
	      if(jobopenBasic.getRulePay()==null) {
	    	  jobopenBasic.setRulePay("0");
	      }
	      if(jobopenBasic.getAllOpen()==null) {
	    	  jobopenBasic.setAllOpen("0");
	      }
	      
	      jobopenBasic.setJobopenNo((int)session.getAttribute("jobopen"));
	      
	      jobopenService.resetBasic(jobopenBasic);
	      
	
	      if(session.getAttribute("insertDetail")==null) {
	    	  return "redirect:detailInfo";
	      } else {
	    	  return "redirect:detailUpdate?jobopenNo="+jobopenBasic.getJobopenNo();
	      }
	}
	
	
	
	@RequestMapping(value="/detailInfo", method=RequestMethod.GET)
	public void detail(HttpSession session) {
		
		
		
	}
	
	@RequestMapping(value="/detailInfo", method=RequestMethod.POST)
	public String detailProc(JobopenArr detail, JobopenBasic jobopenBasic) {
		
		String title = jobopenService.getBasic(jobopenBasic).getTitle();
		
		JobopenDetail[] d = detail.getDetail();
		List<JobopenDetail> e = new LinkedList<JobopenDetail>(Arrays.asList(d));
		
//		System.out.println(e.toString());
		
		for(int i=0; i<e.size(); i++) {
			if(e.get(i).getJobopenNo()==0)
				e.remove(i);
		}
//		System.out.println(e.toString());
		for(int i=0; i<e.size();i++) {
			e.get(i).setTitle(title);
			jobopenService.writeDetail(e.get(i));
		}
		  
		
//		logger.info(jobopenBasic.toString());
		
		jobopenService.updateBasic(jobopenBasic);
		
		return "redirect:register";
	}
	
	
	@RequestMapping(value="/detailUpdate", method=RequestMethod.GET)
	public void detailUpdate(int jobopenNo, Model model) {
		logger.info("dd");
		
		JobopenBasic basic = new JobopenBasic();
		basic.setJobopenNo(jobopenNo);
		
		JobopenDetail jobopenDetail = new JobopenDetail();
		jobopenDetail.setJobopenNo(jobopenNo);
		List<JobopenDetail> detail = jobopenService.selectDetail(jobopenDetail);
		
		
		model.addAttribute("basic", jobopenService.getBasic(basic));
		model.addAttribute("detail", detail);
	}
	
	@RequestMapping(value="/detailUpdate", method=RequestMethod.POST)
	public String detailUpdateProc(@Validated JobopenArr detail, JobopenBasic jobopenBasic) {
		
		
		JobopenDetail[] d = detail.getDetail();
		List<JobopenDetail> e = new LinkedList<JobopenDetail>(Arrays.asList(d));
		
		for(int i=0; i<e.size(); i++) {
			if(e.get(i).getJobopenNo()==0)
				e.remove(i);
		}
//		System.out.println(e.toString());
		for(int i=0; i<e.size();i++) {
			jobopenService.updateDetail(e.get(i));
		}
	      
		jobopenService.updateBasic(jobopenBasic);
		
		return "redirect:register";
	      
	}
	
	

	
	@RequestMapping(value="/detailCancel", method=RequestMethod.POST)
	public String detailCancel(HttpSession session) {
		
		jobopenService.deleteJobopen((int)session.getAttribute("jobopen"));
		
		return "redirect:/main/adminmain";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void regi(Model model, HttpSession session) {
		
		session.setAttribute("insertDetail", true);
		int jobopenNo = (int)session.getAttribute("jobopen");
		JobopenBasic jobopenBasic = new JobopenBasic();
		jobopenBasic.setJobopenNo(jobopenNo);
		JobopenBasic basic = jobopenService.getBasic(jobopenBasic);
		
		JobopenDetail jobopenDetail = new JobopenDetail();
		jobopenDetail.setJobopenNo(jobopenNo);
		
		List<JobopenDetail> detail = jobopenService.selectDetail(jobopenDetail);
		
		logger.info(basic.toString());
		logger.info(detail.toString());
		
		model.addAttribute("basic", basic);
		model.addAttribute("detail", detail);
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public void regiProc(HttpSession session) {
		
		jobopenService.regiInfo((int)session.getAttribute("jobopen"));
		session.removeAttribute("insertDetail");
	}
	
}





















