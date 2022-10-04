package winwin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import winwin.dto.Activity;
import winwin.dto.ActivityArr;
import winwin.dto.Career;
import winwin.dto.CareerArr;
import winwin.dto.College;
import winwin.dto.Experience;
import winwin.dto.ExperienceArr;
import winwin.dto.GSchool;
import winwin.dto.HighSchool;
import winwin.dto.Introduce;
import winwin.dto.JobopenBasic;
import winwin.dto.Language;
import winwin.dto.LanguageArr;
import winwin.dto.License;
import winwin.dto.LicenseArr;
import winwin.dto.Material;
import winwin.dto.MaterialArr;
import winwin.dto.Member;
import winwin.dto.Military;
import winwin.dto.Support;
import winwin.dto.University;
import winwin.dto.UserDetail;
import winwin.service.Apply2Service;

@Controller
@RequestMapping(value="/apply")
public class Apply2Controller {
	
	@Autowired Apply2Service apply2Service;
	@Autowired ServletContext context;
	private static final Logger logger = LoggerFactory.getLogger(JobopenController.class);
	
	@RequestMapping(value="/career", method=RequestMethod.GET)
	public void career(String jobopenNo, JobopenBasic jobopenBasic, HttpSession session, Model model) {
		
		jobopenBasic.setJobopenNo(Integer.parseInt(jobopenNo));
		model.addAttribute("jobopenBasic", apply2Service.viewJobOpen(jobopenBasic));
		
	}

 
	@RequestMapping(value="/career", method=RequestMethod.POST) 
	public String careerProc(HttpSession session, JobopenBasic jobopenBasic, LanguageArr langArr, LicenseArr licArr, CareerArr carArr, ActivityArr actArr, ExperienceArr expArr/*, MaterialArr matArr*/, MultipartFile file) {

		//language
		Language[] lang = langArr.getLangArr();
		List<Language> langList = new LinkedList<>(Arrays.asList(lang));

		List<Language> resLangList = new ArrayList<>();
		Iterator<Language> langIter = langList.iterator();

		while(langIter.hasNext()) {
			Language l = langIter.next();

			if(	l.getTestName()!=null && !l.getTestName().equals("0")) {
				logger.info("getTestName if문에 들어옴");
				
				resLangList.add(l);
			}
		}
		
		for(int i=0; i<resLangList.size(); i++) {
			resLangList.get(i).setJobopenNo(jobopenBasic.getJobopenNo());
			resLangList.get(i).setUserId((String)session.getAttribute("id"));
			apply2Service.insertLanguage(resLangList.get(i));
		}
		
		//license
		License[] lic = licArr.getLicArr();
		List<License> licList = new LinkedList<>(Arrays.asList(lic));
		
		List<License> resLicList = new ArrayList<>();
		Iterator<License> licIter = licList.iterator();

		while(licIter.hasNext()) {
			License l = licIter.next();
			
			if(	l.getLiName()!=null && !l.getLiName().equals("")) {
				logger.info("getLiName if문에 들어옴");
				
				resLicList.add(l);
			}
		}
		
		for(int i=0; i<resLicList.size(); i++) {
			resLicList.get(i).setJobopenNo(jobopenBasic.getJobopenNo());
			resLicList.get(i).setUserId((String)session.getAttribute("id"));
			apply2Service.insertLicense(resLicList.get(i));
		}
		
		
		//career
		Career[] car = carArr.getCarArr();
		List<Career> carList = new LinkedList<>(Arrays.asList(car));
		
		List<Career> resCarList = new ArrayList<>();
		Iterator<Career> carIter = carList.iterator();

		while(carIter.hasNext()) {
			Career c = carIter.next();
			
			if(c.getPosition()!=null && !c.getPosition().equals("")) {
				
				resCarList.add(c);
			}
		}
		
		for(int i=0; i<resCarList.size(); i++) {
			resCarList.get(i).setJobopenNo(jobopenBasic.getJobopenNo());
			resCarList.get(i).setUserId((String)session.getAttribute("id"));
			apply2Service.insertCareer(resCarList.get(i));
		}
		
		
		//activity
		Activity[] act = actArr.getActArr();
		List<Activity> actList = new LinkedList<>(Arrays.asList(act));
		
		List<Activity> resActList = new ArrayList<>();
		Iterator<Activity> actIter = actList.iterator();

		while(actIter.hasNext()) {
			Activity a = actIter.next();
			logger.info("getaName : " + a.getaName());
			
			if(a.getaName()!=null && !a.getaName().equals("")) {
				resActList.add(a);
			}
		}
		
		for(int i=0; i<resActList.size(); i++) {
			resActList.get(i).setJobopenNo(jobopenBasic.getJobopenNo());
			resActList.get(i).setUserId((String)session.getAttribute("id"));
			apply2Service.insertActivity(resActList.get(i));
		}
		
		//experience
		Experience[] exp = expArr.getExpArr();
		List<Experience> expList = new LinkedList<>(Arrays.asList(exp));
		
		List<Experience> resExpList = new ArrayList<>();
		Iterator<Experience> expIter = expList.iterator();

		while(expIter.hasNext()) {
			Experience e = expIter.next();
			
			if(e.geteOption()!=null && !e.geteOption().equals("0")) {
				resExpList.add(e);
			}
		}
		
		for(int i=0; i<resExpList.size(); i++) {
			resExpList.get(i).setJobopenNo(jobopenBasic.getJobopenNo());
			resExpList.get(i).setUserId((String)session.getAttribute("id"));
			apply2Service.insertExperience(resExpList.get(i));
		}
		
		// ------------파일업로드----------------
		
		String realpath = context.getRealPath("upload");
		
		String uid = UUID.randomUUID().toString().split("-")[4];
		String stored = file.getOriginalFilename()+"_"+uid;
		File dest = new File(realpath, stored);
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Material mat = new Material();
		
		mat.setOriginName(file.getOriginalFilename());
		mat.setStoredName(stored);
		mat.setFilesize(file.getSize());
		mat.setUserId((String)session.getAttribute("id"));
		mat.setPortfolioId(jobopenBasic.getJobopenNo());
		
		System.out.println("파일 이름 " + mat.getOriginName());
		
		if(mat.getOriginName()!="") {
			
			apply2Service.fileUpload(mat);
		}
		//------------------------------------
		
		//introduce 카운트해서 redirect 정하기 
		Introduce intro = new Introduce();
		intro.setUserId((String)session.getAttribute("id"));
		intro.setJobopenNo(jobopenBasic.getJobopenNo());
		int countIntro = apply2Service.countIntro(intro);
		
		if(countIntro==1) {
			return "redirect:/apply/introduceUpdate?jobopenNo="+jobopenBasic.getJobopenNo();
		} else {
			return "redirect:/apply/introduce?jobopenNo="+jobopenBasic.getJobopenNo();
		}
	
	}
		
	@RequestMapping(value="/careerUpdate", method=RequestMethod.GET)
	public void careerUpdate(String jobopenNo, JobopenBasic jobopenBasic, Model model, HttpSession session, Language language, License license, Career career, Activity activity, Experience experience, Material material) {
		

		
		jobopenBasic.setJobopenNo(Integer.parseInt(jobopenNo));
		model.addAttribute("jobopenBasic", apply2Service.viewJobOpen(jobopenBasic));
		
		// language		
		language.setUserId((String)session.getAttribute("id"));
		language.setJobopenNo(Integer.parseInt(jobopenNo));
		List<Language> lang = apply2Service.selectLanguage(language);
		int langCnt = apply2Service.countLanguage(language);
		
		// license
		license.setUserId((String)session.getAttribute("id"));
		license.setJobopenNo(Integer.parseInt(jobopenNo));
		List<License> lice = apply2Service.selectLicense(license);
		int liceCnt = apply2Service.countLicense(license);
		
		// career
		career.setUserId((String)session.getAttribute("id"));
		career.setJobopenNo(Integer.parseInt(jobopenNo));
		List<Career> car = apply2Service.selectCareer(career);
		int carCnt = apply2Service.countCareer(career);
		
		// activity
		activity.setUserId((String)session.getAttribute("id"));
		activity.setJobopenNo(Integer.parseInt(jobopenNo));
		List<Activity> act = apply2Service.selectActivity(activity);
		int actCnt = apply2Service.countActivity(activity);
		
		//experience
		experience.setUserId((String)session.getAttribute("id"));
		experience.setJobopenNo(Integer.parseInt(jobopenNo));
		List<Experience> exp = apply2Service.selectExperience(experience);
		int expCnt = apply2Service.countExperience(experience);
		
		//material
		material.setUserId((String)session.getAttribute("id"));
		material.setPortfolioId(Integer.parseInt(jobopenNo));
		Material mat = apply2Service.selectMaterial(material);
		int matCnt = apply2Service.countMaterial(material);
//		
//		List<String> extFile = new ArrayList<>();
//		List<String> originFile = new ArrayList<>();
		
//		for(int i=0; i<mat.size();i++) {
//			
//			System.out.println(mat.get(i).getOriginName());
//			
//			String[] split = mat.get(i).getOriginName().split("\\.");
////			
//			System.out.println(Arrays.toString(split));
//			System.out.println(split[0]);
//			System.out.println(split[1]);
////			String originName = split[0];
////			String extName = split[1];
////			originFile.add(originName);
////			extFile.add(extName);
//		}
		if(matCnt>0) {
			
			String[] split = mat.getOriginName().split("\\.");
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("mat", mat);
			map.put("split", split);
			model.addAttribute("mate", map);
		}
			
			
			model.addAttribute("language",lang);
			model.addAttribute("license", lice);
			model.addAttribute("career", car);
			model.addAttribute("activity", act);
			model.addAttribute("experience", exp);
			
			model.addAttribute("langCnt",langCnt);
			model.addAttribute("liceCnt", liceCnt);
			model.addAttribute("carCnt", carCnt);
			model.addAttribute("actCnt", actCnt);
			model.addAttribute("expCnt", expCnt);
		
	}


	@RequestMapping(value="/careerUpdate", method=RequestMethod.POST)
	public String careerUpdateProc(String jobNum, HttpSession session, JobopenBasic jobopenBasic, LanguageArr langArr, LicenseArr licArr, CareerArr carArr, ActivityArr actArr, ExperienceArr expArr/*, MaterialArr matArr*/, MultipartFile file) {
		
		String userId = (String)session.getAttribute("id");
		logger.info("jobNum : " + jobNum);
		int jobN = Integer.parseInt(jobNum);
		
		Language language = new Language();
		Material material = new Material();
		
		language.setJobopenNo(jobN);
		language.setUserId(userId);
		material.setPortfolioId(jobN);
		material.setUserId(userId);
		
		//language
		Language[] lang = langArr.getLangArr();
		List<Language> langList = new LinkedList<>(Arrays.asList(lang));
		
		
		apply2Service.deleteLanguage(language);
		apply2Service.deleteLicense(language);
		apply2Service.deleteCareer(language);
		apply2Service.deleteActivity(language);
		apply2Service.deleteExperience(language);
		apply2Service.deleteMaterial(material);

		
		List<Language> resLangList = new ArrayList<>();
		Iterator<Language> langIter = langList.iterator();

		while(langIter.hasNext()) {
			Language l = langIter.next();

			if(	l.getTestName()!=null && !l.getTestName().equals("0")) {
				logger.info("getTestName if문에 들어옴");
				logger.info("l.getJobopenNo : " + l.getJobopenNo());
				resLangList.add(l);
			}
		}
		
		for(int i=0; i<resLangList.size(); i++) {
			resLangList.get(i).setJobopenNo(jobopenBasic.getJobopenNo());
			resLangList.get(i).setUserId((String)session.getAttribute("id"));
			apply2Service.insertLanguage(resLangList.get(i));
		}
		
		//license
		License[] lic = licArr.getLicArr();
		List<License> licList = new LinkedList<>(Arrays.asList(lic));
		
		List<License> resLicList = new ArrayList<>();
		Iterator<License> licIter = licList.iterator();

		while(licIter.hasNext()) {
			License l = licIter.next();
			
			if(	l.getLiName()!=null && !l.getLiName().equals("")) {
				logger.info("getLiName if문에 들어옴");
				
				resLicList.add(l);
			}
		}
		
		for(int i=0; i<resLicList.size(); i++) {
			resLicList.get(i).setJobopenNo(jobopenBasic.getJobopenNo());
			resLicList.get(i).setUserId((String)session.getAttribute("id"));
			apply2Service.insertLicense(resLicList.get(i));
		}
		
		
		//career
		Career[] car = carArr.getCarArr();
		List<Career> carList = new LinkedList<>(Arrays.asList(car));
		
		List<Career> resCarList = new ArrayList<>();
		Iterator<Career> carIter = carList.iterator();

		while(carIter.hasNext()) {
			Career c = carIter.next();
			
			if(c.getPosition()!=null && !c.getPosition().equals("")) {
				
				resCarList.add(c);
			}
		}
		
		for(int i=0; i<resCarList.size(); i++) {
			resCarList.get(i).setJobopenNo(jobopenBasic.getJobopenNo());
			resCarList.get(i).setUserId((String)session.getAttribute("id"));
			apply2Service.insertCareer(resCarList.get(i));
		}
		
		
		//activity
		Activity[] act = actArr.getActArr();
		List<Activity> actList = new LinkedList<>(Arrays.asList(act));
		
		List<Activity> resActList = new ArrayList<>();
		Iterator<Activity> actIter = actList.iterator();

		while(actIter.hasNext()) {
			Activity a = actIter.next();
			logger.info("getaName : " + a.getaName());
			
			if(a.getaName()!=null && !a.getaName().equals("")) {
				resActList.add(a);
			}
		}
		
		for(int i=0; i<resActList.size(); i++) {
			resActList.get(i).setJobopenNo(jobopenBasic.getJobopenNo());
			resActList.get(i).setUserId((String)session.getAttribute("id"));
			apply2Service.insertActivity(resActList.get(i));
		}
		
		//experience
		Experience[] exp = expArr.getExpArr();
		List<Experience> expList = new LinkedList<>(Arrays.asList(exp));
		
		List<Experience> resExpList = new ArrayList<>();
		Iterator<Experience> expIter = expList.iterator();

		while(expIter.hasNext()) {
			Experience e = expIter.next();
			
			if(e.geteOption()!=null && !e.geteOption().equals("0")) {
				resExpList.add(e);
			}
		}
		
		for(int i=0; i<resExpList.size(); i++) {
			resExpList.get(i).setJobopenNo(jobopenBasic.getJobopenNo());
			resExpList.get(i).setUserId((String)session.getAttribute("id"));
			apply2Service.insertExperience(resExpList.get(i));
		}
		
		// ------------파일업로드----------------
		
		String realpath = context.getRealPath("upload");
		
		String uid = UUID.randomUUID().toString().split("-")[4];
		String stored = file.getOriginalFilename()+"_"+uid;
		File dest = new File(realpath, stored);
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Material mat = new Material();
		
		mat.setOriginName(file.getOriginalFilename());
		mat.setStoredName(stored);
		mat.setFilesize(file.getSize());
		mat.setUserId((String)session.getAttribute("id"));
		mat.setPortfolioId(jobopenBasic.getJobopenNo());
		
		System.out.println("파일 이름 " + mat.getOriginName());
		
		if(mat.getOriginName()!="") {
			
			apply2Service.fileUpload(mat);
		}
		//------------------------------------
		
		
		//introduce 카운트해서 redirect 정하기 
		Introduce intro = new Introduce();
		intro.setUserId((String)session.getAttribute("id"));
		intro.setJobopenNo(jobN);
		int countIntro = apply2Service.countIntro(intro);
		
		if(countIntro==1) {
			return "redirect:/apply/introduceUpdate?jobopenNo="+jobN;
		} else {
			return "redirect:/apply/introduce?jobopenNo="+jobN;
		}
	}

	
	

	
}
