package winwin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import winwin.dto.Activity;
import winwin.dto.Career;
import winwin.dto.College;
import winwin.dto.Experience;
import winwin.dto.GSchool;
import winwin.dto.HighSchool;
import winwin.dto.Introduce;
import winwin.dto.JobopenBasic;
import winwin.dto.JobopenDetail;
import winwin.dto.Language;
import winwin.dto.License;
import winwin.dto.Material;
import winwin.dto.Member;
import winwin.dto.Military;
import winwin.dto.Support;
import winwin.dto.University;
import winwin.dto.UserDetail;
import winwin.service.Apply1Service;
import winwin.service.Apply2Service;

@Controller
@RequestMapping(value="/apply")
public class Apply1Controller {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired Apply1Service apply1Service;
	@Autowired Apply2Service apply2Service;
	
	@RequestMapping(value="/userDetail", method=RequestMethod.GET)
	public void userDetail(String title, String jobopenNo, JobopenDetail jobopenDetail, JobopenBasic jobopenBasic, Member member, HttpSession session, Model model) {	
		logger.info("userDetail 활성화");
		logger.info("공고명"+title);
		logger.info("공고번호"+jobopenNo);
		
		int jobopenNum = Integer.parseInt(jobopenNo);
		
		//apply헤더 정보 가져오기
		jobopenBasic.setJobopenNo(jobopenNum);
		JobopenBasic jobOpen = apply1Service.viewJobOpen(jobopenBasic);
		
		//apply헤더_task 정보 가져오기
		jobopenDetail.setJobopenNo(jobopenNum);
		List<JobopenDetail> task = new ArrayList<>();
		task.addAll(apply1Service.viewTask(jobopenDetail));
		logger.info("task : " + task.toString());
		
		//개인정보 가져오기
		member.setUserid((String)session.getAttribute("id"));
		Member viewUserDetail = apply1Service.viewMember(member);
		
		logger.info("userDetailController : " + viewUserDetail);
		
		model.addAttribute("task", task);
		model.addAttribute("jobopenBasic", jobOpen);
		model.addAttribute("member", viewUserDetail);
		
	}
	

	@RequestMapping(value="/userDetail", method=RequestMethod.POST)
	public String userDetailProc(UserDetail userDetail, HighSchool highSchool, College college, University university, GSchool gSchool, HttpSession session, Model model) {
		
		logger.info("userDetail 데이터 insert 활성화");
		
		logger.info("Apply1Cont_userDetailProc() : " + userDetail);
		apply1Service.insertUserDetail(userDetail);
		
		logger.info(userDetail.toString());
		
		//insert뷰 or update뷰 선택
		highSchool.setJobopenNo(userDetail.getJobopenNo());
		highSchool.setUserId(userDetail.getUserId());

		college.setJobopenNo(userDetail.getJobopenNo());
		college.setUserId(userDetail.getUserId());
		
		university.setJobopenNo(userDetail.getJobopenNo());
		university.setUserId(userDetail.getUserId());
		
		gSchool.setJobopenNo(userDetail.getJobopenNo());
		gSchool.setUserId(userDetail.getUserId());

		int countH = apply1Service.countHighSchool(highSchool);
		int countC = apply1Service.countCollege(college);
		int countU = apply1Service.countUniversity(university);
		int countG = apply1Service.countGSchool(gSchool);
		
		if(countH==1 || countC==1 || countU==1 || countG==1) {
			logger.info("acaemicUpdate로 갑니다!!");
			
			return "redirect:/apply/academicUpdate?jobopenNo="+userDetail.getJobopenNo();
		} else {
			logger.info("academic으로 갈게여!!");
			
			return "redirect:/apply/academic?jobopenNo="+userDetail.getJobopenNo();
		}
		
	}

	@RequestMapping(value="/userDetailUpdate", method=RequestMethod.GET)
	public void userDetailUpdate(String jobopenNo, JobopenDetail jobopenDetail, JobopenBasic jobopenBasic, Member member, UserDetail userDetail, HttpSession session, Model model) {
		logger.info("userDetail update 활성화");
		
		int jobopenNum = Integer.parseInt(jobopenNo);
		jobopenBasic.setJobopenNo(jobopenNum);

		//apply헤더 정보 가져오기
		jobopenBasic.setJobopenNo(jobopenNum);
		JobopenBasic jobOpen = apply1Service.viewJobOpen(jobopenBasic);
		
		//apply헤더_task 정보 가져오기
		jobopenDetail.setJobopenNo(jobopenNum);
		List<JobopenDetail> task = new ArrayList<>();
		task.addAll(apply1Service.viewTask(jobopenDetail));
		logger.info("task : " + task.toString());
		
		//개인정보 가져오기
		member.setUserid((String)session.getAttribute("id"));
		Member viewUserDetail = apply1Service.viewMember(member);
		
		logger.info("userDetailController : " + viewUserDetail);
		
		//userDetail 데이터 가져오기
		userDetail.setJobopenNo(jobopenNum);
		userDetail.setUserId((String)session.getAttribute("id"));
		UserDetail userD = apply1Service.selectUserDetail(userDetail);
		
		//전화번호 split하기
		String[] phoneNum = userD.getPhoneNum().split("-");
		
		logger.info("phoneNum : " + phoneNum.toString()); 

		model.addAttribute("task", task);
		model.addAttribute("jobopenBasic", jobOpen);
		model.addAttribute("member", viewUserDetail);
		model.addAttribute("userDetail", userD);
		model.addAttribute("phoneNum", phoneNum);
	}

	@RequestMapping(value="/userDetailUpdate", method=RequestMethod.POST)
	public String userDetailUpdateProc(UserDetail userDetail, HighSchool highSchool, College college, University university, GSchool gSchool) {
		
		//userDeail 업데이트
		apply1Service.updateUserDetail(userDetail);
		
		//insert뷰 or update뷰 선택
		highSchool.setJobopenNo(userDetail.getJobopenNo());
		highSchool.setUserId(userDetail.getUserId());

		college.setJobopenNo(userDetail.getJobopenNo());
		college.setUserId(userDetail.getUserId());
		
		university.setJobopenNo(userDetail.getJobopenNo());
		university.setUserId(userDetail.getUserId());
		
		gSchool.setJobopenNo(userDetail.getJobopenNo());
		gSchool.setUserId(userDetail.getUserId());

		int countH = apply1Service.countHighSchool(highSchool);
		int countC = apply1Service.countCollege(college);
		int countU = apply1Service.countUniversity(university);
		int countG = apply1Service.countGSchool(gSchool);
		
		if(countH==1 || countC==1 || countU==1 || countG==1) {
			logger.info("acaemicUpdate로 갑니다!!");
			
			return "redirect:/apply/academicUpdate?jobopenNo="+userDetail.getJobopenNo();
		} else {
			logger.info("academic으로 갈게여!!");
			
			return "redirect:/apply/academic?jobopenNo="+userDetail.getJobopenNo();
		}
		
	}

	
	
	
	@RequestMapping(value="/academic", method=RequestMethod.GET)
	public void academic(String jobopenNo, JobopenBasic jobopenBasic, HttpSession session, Model model) {
		
		logger.info("academic 활성화");
		logger.info("공고번호"+jobopenNo);
		
		
		jobopenBasic.setJobopenNo(Integer.parseInt(jobopenNo));
		JobopenBasic jobOpen = apply1Service.viewJobOpen(jobopenBasic);
		
		model.addAttribute("jobopenBasic", jobOpen);

	}
	

	@RequestMapping(value="/academic", method=RequestMethod.POST)
	public String academicProc(Military military,HighSchool highSchool, College college, University university, GSchool gSchool, HttpSession session) {
		
		
		logger.info("academic POST 활성화");
		logger.info("HighSchool : " + highSchool);
		logger.info("College : " + college);
		logger.info("University : " + university);
		logger.info("GSchool : " + gSchool);
		
		String userId = (String)session.getAttribute("id");

		if(!highSchool.getHsName().equals("")) {
			apply1Service.insertHighSchool(highSchool);
			apply1Service.updateMemCountH(userId);
			military.setUserId(highSchool.getUserId());
			military.setJobopenNo(highSchool.getJobopenNo());
		} 
		
		if(!college.getColName().equals("")) {
			apply1Service.insertCollege(college);
			apply1Service.updateMemCountC(userId);
			military.setUserId(college.getUserId());
			military.setJobopenNo(college.getJobopenNo());
		}

		if(!university.getUnivName().equals("")) {
			apply1Service.insertUniversity(university);
			apply1Service.updateMemCountU(userId);
			military.setUserId(university.getUserId());
			military.setJobopenNo(university.getJobopenNo());
		}
		
		if(!gSchool.getGsName().equals("")) {
			apply1Service.insertGSchool(gSchool);
			apply1Service.updateMemCountGS(userId);
			military.setUserId(gSchool.getUserId());
			military.setJobopenNo(gSchool.getJobopenNo());
		} 
		
		if(highSchool.getHsName().equals("") && college.getColName().equals("") && university.getUnivName().equals("") && gSchool.getGsName().equals("")) {
			apply1Service.updateMemCountNone(userId);
			military.setUserId(highSchool.getUserId());
			military.setJobopenNo(highSchool.getJobopenNo());
		}
		
		
		//military insert or update
		
		int count = apply1Service.countMilitary(military);
		
		if(count==1) {
			logger.info("militaryUpdate로 가요");
			
			return "redirect:/apply/militaryUpdate?jobopenNo="+highSchool.getJobopenNo();
		} else {
			logger.info("military로 갑니다");
			
			return "redirect:/apply/military?jobopenNo="+highSchool.getJobopenNo();
		}
	}
	
	@RequestMapping(value="/academicUpdate", method=RequestMethod.GET)
	public void academicUpdate(String jobopenNo, JobopenBasic jobopenBasic, HighSchool highSchool, College college, University university, GSchool gSchool, HttpSession session, Model model) {
		
		int jobopenNum = Integer.parseInt(jobopenNo);
		jobopenBasic.setJobopenNo(jobopenNum);
		
		//apply헤더 정보 가져오기
		jobopenBasic.setJobopenNo(jobopenNum);
		JobopenBasic jobOpen = apply1Service.viewJobOpen(jobopenBasic);
		
		//HighSchool 정보 가져오기
		highSchool.setJobopenNo(jobopenNum);
		highSchool.setUserId((String)session.getAttribute("id"));
		HighSchool hsD = apply1Service.selectHighSchool(highSchool); 
		
		//College 정보 가져오기
		college.setJobopenNo(jobopenNum);
		college.setUserId((String)session.getAttribute("id"));
		College colD = apply1Service.selectCollege(college);

		//University 정보 가져오기
		university.setJobopenNo(jobopenNum);
		university.setUserId((String)session.getAttribute("id"));
		University univD = apply1Service.selectUniversity(university);
		
		//GSchool 정보 가져오기
		gSchool.setJobopenNo(jobopenNum);
		gSchool.setUserId((String)session.getAttribute("id"));
		GSchool gsD = apply1Service.selectGSchool(gSchool);
		
		model.addAttribute("jobopenBasic", jobOpen);
		model.addAttribute("highSchool", hsD);
		model.addAttribute("college", colD);
		model.addAttribute("university", univD);
		model.addAttribute("gSchool", gsD );
	}

	@RequestMapping(value="/academicUpdate", method=RequestMethod.POST)
	public String academicUpdateProc(HttpSession session ,HighSchool highSchool, College college, University university, GSchool gSchool, Military military) {
		
		logger.info("academicUpdate 활성화");
		
		String userId = (String)session.getAttribute("id");

		if(!highSchool.getHsName().equals("")) {
			
			apply1Service.deleteHighSchool(highSchool);
			apply1Service.insertHighSchool(highSchool);
			
			military.setUserId(highSchool.getUserId());
			military.setJobopenNo(highSchool.getJobopenNo());
			
		} else {
			apply1Service.deleteHighSchool(highSchool);
			apply1Service.resetMemAcademic(userId);
		}
		
		if(!college.getColName().equals("")) {
			
			apply1Service.deleteCollege(college);
			apply1Service.insertCollege(college);

			military.setUserId(college.getUserId());
			military.setJobopenNo(college.getJobopenNo());
		} else {
			apply1Service.deleteCollege(college);
			apply1Service.resetMemAcademic(userId);
		}

		if(!university.getUnivName().equals("")) {
			
			apply1Service.deleteUniversity(university);
			apply1Service.insertUniversity(university);
			
			military.setUserId(university.getUserId());
			military.setJobopenNo(university.getJobopenNo());
			
		} else {
			apply1Service.deleteUniversity(university);
			apply1Service.resetMemAcademic(userId);
		}
		
		if(!gSchool.getGsName().equals("")) {
			
			apply1Service.deleteGSchool(gSchool);
			apply1Service.insertGSchool(gSchool);
			
			military.setUserId(gSchool.getUserId());
			military.setJobopenNo(gSchool.getJobopenNo());
		} else {
			apply1Service.deleteGSchool(gSchool);
			apply1Service.resetMemAcademic(userId);
		}
		
		
		if(highSchool.getHsName().equals("") && college.getColName().equals("") && university.getUnivName().equals("") && gSchool.getGsName().equals("")) {
			apply1Service.updateMemCountNone(userId);
			
			military.setUserId(highSchool.getUserId());
			military.setJobopenNo(highSchool.getJobopenNo());
		}
		
		
		//member테이블에 count update
		if(!highSchool.getHsName().equals("")) {
			apply1Service.updateMemCountH(userId);
		}	

		if(!college.getColName().equals("")) {
			apply1Service.updateMemCountC(userId);
		}
				
		if(!university.getUnivName().equals("")) {
			apply1Service.updateMemCountU(userId);
		}
		
		if(!gSchool.getGsName().equals("")) {
			apply1Service.updateMemCountGS(userId);
		}
		
		
		//military insert or update
		int count = apply1Service.countMilitary(military);
		
		if(count==1) {
			logger.info("militaryUpdate로 가요");
			
			return "redirect:/apply/militaryUpdate?jobopenNo="+highSchool.getJobopenNo();
		} else {
			logger.info("military로 갑니다");
			
			return "redirect:/apply/military?jobopenNo="+highSchool.getJobopenNo();
		}

		
	}

	
	@RequestMapping(value="/military", method=RequestMethod.GET)
	public void military(String jobopenNo, JobopenBasic jobopenBasic, HttpSession session, Model model) {
		
		logger.info("military 활성화");
		logger.info("공고번호"+jobopenNo);
		
		
		jobopenBasic.setJobopenNo(Integer.parseInt(jobopenNo));
		JobopenBasic jobOpen = apply1Service.viewJobOpen(jobopenBasic);
		
		model.addAttribute("jobopenBasic", jobOpen);

	}


	@RequestMapping(value="/military", method=RequestMethod.POST)
	public String militaryProc(Military military, Language language, License license, Career career, Experience experience, Activity activity, Material material) {
		
		logger.info("Apply1Controller_militaryProc : " + military);
		apply1Service.insertMilitary(military);
		
		//경력사항 insert or update
		language.setJobopenNo(military.getJobopenNo());
		language.setUserId(military.getUserId());
		
		license.setJobopenNo(military.getJobopenNo());
		license.setUserId(military.getUserId());

		career.setJobopenNo(military.getJobopenNo());
		career.setUserId(military.getUserId());

		experience.setJobopenNo(military.getJobopenNo());
		experience.setUserId(military.getUserId());

		activity.setJobopenNo(military.getJobopenNo());
		activity.setUserId(military.getUserId());

		material.setPortfolioId(military.getJobopenNo());
		material.setUserId(military.getUserId());
		
		int langCount = apply1Service.countLanguage(language);
		int licCount = apply1Service.countLicense(license);
		int carCount = apply1Service.countCareer(career);
		int expCount = apply1Service.countExperience(experience);
		int actCount = apply1Service.countActivity(activity);
		int matCount = apply1Service.countMaterial(material);
		
		if(langCount>0 ||licCount>0 ||carCount>0 ||expCount>0 ||actCount>0 ||matCount>0) {
			logger.info("careerUpdate로 간다");
			
			return "redirect:/apply/careerUpdate?jobopenNo="+military.getJobopenNo();
		} else {
			logger.info("career페이지로 이동!!");
			
			return "redirect:/apply/career?jobopenNo="+military.getJobopenNo();
		}

	}
	
	
	@RequestMapping(value="/militaryUpdate", method=RequestMethod.GET)
	public void militaryUpdate(String jobopenNo, JobopenBasic jobopenBasic, HttpSession session, Military military, Model model) {
		
		int jobopenNum = Integer.parseInt(jobopenNo);
		jobopenBasic.setJobopenNo(jobopenNum);
		
		//apply헤더 정보 가져오기
		jobopenBasic.setJobopenNo(jobopenNum);
		JobopenBasic jobOpen = apply1Service.viewJobOpen(jobopenBasic);
		
		//military 정보 가져오기
		military.setJobopenNo(jobopenNum);
		military.setUserId((String)session.getAttribute("id"));
		Military mil = apply1Service.selectMilitary(military);

		model.addAttribute("jobopenBasic", jobOpen);
		model.addAttribute("military", mil);
	}


	@RequestMapping(value="/militaryUpdate", method=RequestMethod.POST)
	public String militaryUpdateProc(Military military, Language language, License license, Career career, Experience experience, Activity activity, Material material) {
		
		logger.info("military jobopenNo : " + military.getJobopenNo());
		
		apply1Service.deleteMilitary(military);
		apply1Service.insertMilitary(military);
		
		//경력사항 insert or update
		language.setJobopenNo(military.getJobopenNo());
		language.setUserId(military.getUserId());
		
		license.setJobopenNo(military.getJobopenNo());
		license.setUserId(military.getUserId());

		career.setJobopenNo(military.getJobopenNo());
		career.setUserId(military.getUserId());

		experience.setJobopenNo(military.getJobopenNo());
		experience.setUserId(military.getUserId());

		activity.setJobopenNo(military.getJobopenNo());
		activity.setUserId(military.getUserId());

		material.setPortfolioId(military.getJobopenNo());
		material.setUserId(military.getUserId());
		
		int langCount = apply1Service.countLanguage(language);
		int licCount = apply1Service.countLicense(license);
		int carCount = apply1Service.countCareer(career);
		int expCount = apply1Service.countExperience(experience);
		int actCount = apply1Service.countActivity(activity);
		int matCount = apply1Service.countMaterial(material);
		
		if(langCount>0 ||licCount>0 ||carCount>0 ||expCount>0 ||actCount>0 ||matCount>0) {
			logger.info("careerUpdate로 간다");
			
			return "redirect:/apply/careerUpdate?jobopenNo="+military.getJobopenNo();
		} else {
			logger.info("career페이지로 이동!!");
			
			return "redirect:/apply/career?jobopenNo="+military.getJobopenNo();
		}
		
	}

	@RequestMapping(value="/checkUserD", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> checkuserD(HttpSession session, int jobopenNo, UserDetail userDetail) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		String userId = (String)session.getAttribute("id");
		
		userDetail.setUserId(userId);
		userDetail.setJobopenNo(jobopenNo);
		
		Object objUD = apply1Service.countUserDetail(userDetail);
		
		map.put("userDetail", objUD);
		
		return map;
	}	
	
	@RequestMapping(value="/checkAca", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> checkAca(HttpSession session, int jobopenNo, HighSchool highSchool, College college, University university, GSchool gSchool) {
		logger.info("ajax로 왔다!");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String userId = (String)session.getAttribute("id");
		
		highSchool.setUserId(userId);
		highSchool.setJobopenNo(jobopenNo);
		
		college.setUserId(userId);
		college.setJobopenNo(jobopenNo);

		university.setUserId(userId);
		university.setJobopenNo(jobopenNo);

		gSchool.setUserId(userId);
		gSchool.setJobopenNo(jobopenNo);

		
		Object objH = apply1Service.countHighSchool(highSchool);
		Object objC = apply1Service.countCollege(college);
		Object objU = apply1Service.countUniversity(university);
		Object objG = apply1Service.countGSchool(gSchool);
		
		map.put("highSchool", objH);
		map.put("college", objC);
		map.put("university", objU);
		map.put("gSchool", objG);
		
		return map;
	}
	
	@RequestMapping(value="/checkMil", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> checkMil(HttpSession session, Military military, int jobopenNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String userId = (String)session.getAttribute("id");
		
		military.setUserId(userId);
		military.setJobopenNo(jobopenNo);
		
		Object objM = apply1Service.countMilitary(military);
		
		map.put("military", objM);
		
		return map;
	}
	
	@RequestMapping(value="/checkCar", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> checkCar(HttpSession session, Language language, License license, Career career, Activity activity, Experience experience, Material material, int jobopenNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String userId = (String)session.getAttribute("id");
		
		language.setUserId(userId);
		language.setJobopenNo(jobopenNo);
		
		license.setUserId(userId);
		license.setJobopenNo(jobopenNo);

		career.setUserId(userId);
		career.setJobopenNo(jobopenNo);

		activity.setUserId(userId);
		activity.setJobopenNo(jobopenNo);

		experience.setUserId(userId);
		experience.setJobopenNo(jobopenNo);

		material.setUserId(userId);
		material.setPortfolioId(jobopenNo);

		Object objLang = apply1Service.countLanguage(language);
		Object objLic = apply1Service.countLicense(license);
		Object objCar = apply1Service.countCareer(career);
		Object objAct = apply1Service.countActivity(activity);
		Object objExp = apply1Service.countExperience(experience);
		Object objMat = apply1Service.countMaterial(material);
		
		map.put("language", objLang);
		map.put("license", objLic);
		map.put("career", objCar);
		map.put("activity", objAct);
		map.put("experience", objExp);
		map.put("material", objMat);
		
		return map;
	}
	
	
	@RequestMapping(value="/checkIntro", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> checkIntro(HttpSession session, Introduce introduce, int jobopenNo) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		String userId = (String)session.getAttribute("id");
		
		introduce.setUserId(userId);
		introduce.setJobopenNo(jobopenNo);
		
		Object objIntro = apply1Service.countIntroduce(introduce);
		
		map.put("introduce", objIntro);
		
		return map;
	}
	
	
	@RequestMapping(value="/introduce", method=RequestMethod.GET)
	public void introduce(String jobopenNo, JobopenBasic jobopenBasic, Model model) {
		
		jobopenBasic.setJobopenNo(Integer.parseInt(jobopenNo));
		model.addAttribute("jobopenBasic", apply2Service.viewJobOpen(jobopenBasic));
	
	}
	
	
	@RequestMapping(value="/introduce", method=RequestMethod.POST)
	public String introduceProc(Introduce introduce, HttpSession session) {
		
		logger.info("jobopenNo : " + introduce.getJobopenNo());

		introduce.setUserId((String)session.getAttribute("id"));
		apply2Service.insertIntroduce(introduce);
		
		return "redirect:/apply/finish?jobopenNo="+introduce.getJobopenNo();
		
	}


	@RequestMapping(value="/introduceUpdate", method=RequestMethod.GET)
	public void introduceUpdate(String jobopenNo, JobopenBasic jobopenBasic, Introduce introduce, HttpSession session, Model model) {
		
		jobopenBasic.setJobopenNo(Integer.parseInt(jobopenNo));
		model.addAttribute("jobopenBasic", apply2Service.viewJobOpen(jobopenBasic));
		
		// introduce 정보 가져오기 
		introduce.setUserId((String)session.getAttribute("id"));
		introduce.setJobopenNo(Integer.parseInt(jobopenNo));
		Introduce intro = apply2Service.selectIntroduce(introduce);
		
		model.addAttribute("intro", intro);
	}

	@RequestMapping(value="/introduceUpdate", method=RequestMethod.POST)
	public String introduceUpdateProc(Introduce introduce, HttpSession session, ModelAndView mav) {
	
		introduce.setUserId((String)session.getAttribute("id"));
		apply2Service.updateIntroduce(introduce);
		
		
		return "redirect:/apply/finish?jobopenNo="+introduce.getJobopenNo();
		
	}
	
	
	
	@RequestMapping(value="/finish", method=RequestMethod.GET)
	public void finish(String jobopenNo, HttpSession session, JobopenBasic jobopenBasic, Member member, UserDetail userDetail, HighSchool highSchool, College college, University university, GSchool gSchool, 
			Military military, Language language, License license, Career career, Activity activity, Experience experience, Introduce introduce, Material material, Model model) {
		
		
		jobopenBasic.setJobopenNo(Integer.parseInt(jobopenNo));
		model.addAttribute("jobopenBasic", apply2Service.viewJobOpen(jobopenBasic));

		member.setUserid((String)session.getAttribute("id"));
		model.addAttribute("member", apply2Service.selectMember(member));
		
		userDetail.setUserId((String)session.getAttribute("id"));
		userDetail.setJobopenNo(jobopenBasic.getJobopenNo());
		model.addAttribute("userDetail", apply2Service.selectUserDetail(userDetail));
		
		highSchool.setUserId((String)session.getAttribute("id"));
		highSchool.setJobopenNo(jobopenBasic.getJobopenNo());
		model.addAttribute("highSchool", apply2Service.selectHighSchool(highSchool));

		college.setUserId((String)session.getAttribute("id"));
		college.setJobopenNo(jobopenBasic.getJobopenNo());
		model.addAttribute("college", apply2Service.selectCollege(college));
		
		university.setUserId((String)session.getAttribute("id"));
		university.setJobopenNo(jobopenBasic.getJobopenNo());
		model.addAttribute("university", apply2Service.selectUniversity(university));
		
		gSchool.setUserId((String)session.getAttribute("id"));
		gSchool.setJobopenNo(jobopenBasic.getJobopenNo());
		model.addAttribute("gSchool", apply2Service.selectGSchool(gSchool));
		
		military.setUserId((String)session.getAttribute("id"));
		military.setJobopenNo(jobopenBasic.getJobopenNo());
		model.addAttribute("military", apply2Service.selectMilitary(military));
		
		language.setUserId((String)session.getAttribute("id"));
		language.setJobopenNo(jobopenBasic.getJobopenNo());
		List<Language> langList = apply2Service.selectLanguage(language);
		model.addAttribute("language", langList);

		license.setUserId((String)session.getAttribute("id"));
		license.setJobopenNo(jobopenBasic.getJobopenNo());
		List<License> licList = apply2Service.selectLicense(license);
		model.addAttribute("license", licList);

		career.setUserId((String)session.getAttribute("id"));
		career.setJobopenNo(jobopenBasic.getJobopenNo());
		List<Career> carList = apply2Service.selectCareer(career);
		model.addAttribute("career", carList);
		
		activity.setUserId((String)session.getAttribute("id"));
		activity.setJobopenNo(jobopenBasic.getJobopenNo());
		List<Activity> actList = apply2Service.selectActivity(activity);
		model.addAttribute("activity", actList);

		experience.setUserId((String)session.getAttribute("id"));
		experience.setJobopenNo(jobopenBasic.getJobopenNo());
		List<Experience> expList = apply2Service.selectExperience(experience);
		model.addAttribute("experience", expList);
		
		material.setUserId((String)session.getAttribute("id"));
		material.setPortfolioId(jobopenBasic.getJobopenNo());
		Material mat = apply2Service.selectMaterial(material);
		model.addAttribute("material", mat);
		
		introduce.setUserId((String)session.getAttribute("id"));
		introduce.setJobopenNo(jobopenBasic.getJobopenNo());
		model.addAttribute("introduce", apply2Service.selectIntroduce(introduce));
		
	}
	
	@RequestMapping(value="/submit", method=RequestMethod.GET)
	public String finishProc(HttpSession session, JobopenBasic jobopenBasic, Support support) {
		
		support.setJobopenNo(jobopenBasic.getJobopenNo());
		support.setUserId((String)session.getAttribute("id"));
		
		apply2Service.insertSupport(support);
		
		return "redirect:/main/usermain";
		
	}

	
	
}	

