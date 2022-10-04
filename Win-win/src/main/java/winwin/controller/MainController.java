package winwin.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import winwin.dto.JobopenBasic;
import winwin.dto.NoticeBoard;
import winwin.dto.QnaBoard;
import winwin.service.ApplyMenuService;
import winwin.service.JobopenService;
import winwin.service.MainService;
import winwin.util.Paging;

@Controller
@RequestMapping(value="/main")
public class MainController {
	
	@Autowired MainService mainService;
	@Autowired JobopenService jobopenService;
	@Autowired ApplyMenuService applyMenuService;
	
	@RequestMapping(value="/usermain", method=RequestMethod.GET)
	public void main(
			Model model,
			@RequestParam(required=false, defaultValue="0") int curPage,
			@RequestParam(required=false, defaultValue="10") int listCount,
			@RequestParam(required=false, defaultValue="10") int pageCount,
			HttpSession session) {			
		Paging paging = jobopenService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging", paging);
		session.removeAttribute("adminLogin");
		String status = "메인";
		paging.setStatus(status);
		List<JobopenBasic> list = jobopenService.selectBasic(paging);
		
		Date curDate = new Date();
		
		for(int i=0; i<list.size();i++) {
			Date endDate = list.get(i).getEndDate();
			int jobopenNo = list.get(i).getJobopenNo();
			if(endDate!=null) {
				int compare = curDate.compareTo(endDate);
				
				if( compare > 0 ) {
					if(list.get(i).getStatus().equals("채용 중")){
						jobopenService.updateStatusByDate(jobopenNo);
					}
				}
			}
		}
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/adminmain", method=RequestMethod.GET)
	public void adminmain(Model model, HttpSession session) { 
		session.removeAttribute("login");
		
		//채용공고 리스트 띄우기
		List<JobopenBasic> applylist = mainService.getJobopenBasic();
		Date curDate = new Date();
		
		for(int i=0; i<applylist.size();i++) {
			Date endDate = applylist.get(i).getEndDate();
			if(endDate!=null) {
				int compare = curDate.compareTo(endDate);
				
				if( compare > 0 ) {
					if(applylist.get(i).getStatus().equals("채용 중")){
						jobopenService.updateStatusByDate(applylist.get(i).getJobopenNo());
					}
				}
			}
		}
		
		model.addAttribute("applylist", applylist);
		
		//공지사항 리스트 띄우기
		List<NoticeBoard> noticelist = mainService.getNoticeBoard();
		model.addAttribute("noticelist", noticelist);

		//문의사항 리스트 띄우기 
		List<QnaBoard> qnalist = mainService.getQnaBoard();
		model.addAttribute("qnalist", qnalist);
		
		//차트 값 받기
		int sec18 = mainService.getSec18();
		model.addAttribute("sec18",sec18);


		//Q&A 답변이 완료되지않은 문의사항 갯수세기 
		 int commentCnt = mainService.countQnAUnanswered();
		 model.addAttribute("commentCnt", commentCnt);
		 
		 // 공고별 지원자 수
		 List<JobopenBasic> jobopenbasic = mainService.countSupport();
		 model.addAttribute("supportCnt", jobopenbasic);
		 
		 System.out.println(jobopenbasic);
		
	}
	
}

