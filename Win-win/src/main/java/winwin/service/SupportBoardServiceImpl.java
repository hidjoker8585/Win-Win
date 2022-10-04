package winwin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import winwin.dao.AllDataDao;
import winwin.dao.SupportDao;
import winwin.dto.Activity;
import winwin.dto.Career;
import winwin.dto.College;
import winwin.dto.Experience;
import winwin.dto.GSchool;
import winwin.dto.HighSchool;
import winwin.dto.Introduce;
import winwin.dto.JobopenBasic;
import winwin.dto.Language;
import winwin.dto.License;
import winwin.dto.Material;
import winwin.dto.Member;
import winwin.dto.Military;
import winwin.dto.SupportBoard;
import winwin.dto.University;
import winwin.dto.UserDetail;
import winwin.util.Paging;

@Service
public class SupportBoardServiceImpl implements SupportBoardService{

	@Autowired SupportDao dao;
	@Autowired AllDataDao datadao;
	
	@Override
	public int totalCnt(Map<String, Object> param) {
		return dao.totalCnt(param);
	}

	@Override
	public int resultCnt(Map<String, Object> param) {
		return dao.resultCnt(param);
	}
	
	@Override
	public List<SupportBoard> list(Paging paging, Map<String, Object> param) {
		param.put("startNo", paging.getStartNo());
		param.put("endNo", paging.getEndNo());
		param.put("curPage", paging.getCurPage());
		return dao.list(param);
	}
	
	@Override
	public List<SupportBoard> resultlist(Paging paging, Map<String, Object> param) {
		param.put("startNo", paging.getStartNo());
		param.put("endNo", paging.getEndNo());
		param.put("curPage", paging.getCurPage());
		return dao.resultlist(param);
	}
	
	@Override
	public List<JobopenBasic> getTitle() {
		return dao.getTitle();
	}
	
	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount, Map<String, Object> param) {
		
		int totalCount = this.totalCnt(param);	
		Paging paging = new Paging(totalCount, curPage, listCount, pageCount);	
		return paging;		
	}

	@Override
	public Paging resultPaging(int curPage, int listCount, int pageCount, Map<String, Object> param) {
		
		int resultCount = this.resultCnt(param);	
		Paging paging = new Paging(resultCount, curPage, listCount, pageCount);	
		return paging;	
	}

	@Override
	public void emailupdate(int passNo) {
		dao.emailupdate(passNo);
		
	}

	@Override
	public Material download(Material file) {
		return dao.download(file);
		
	}

	@Override
	public Material getFile(String userId, int portfolioId) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("userId", userId);
		map.put("portfolioId", portfolioId);
		
		return dao.getFile(map);
		
	}

	@Override
	public Map<String, Object> getAllData(String userId, int jobopenNo) {
		
		Map<String, Object> allData = new HashMap<>();
		
		Map<String, Object> key = new HashMap<>();
		key.put("userId", userId);
		key.put("jobopenNo", jobopenNo);
		
		// userId 필요한 것
		Member mem = datadao.getMem(key);
		UserDetail user = datadao.getUser(key);
		HighSchool high = datadao.getHigh(key);
		College col = datadao.getCol(key);
		University uni = datadao.getUni(key);
		GSchool gs = datadao.getGs(key);
		Military mil = datadao.getMil(key);
		List<Career> car = datadao.getCar(key);
		List<Activity> act = datadao.getAct(key);
		List<License> lic = datadao.getLic(key);
		List<Language> lang = datadao.getLang(key);
		List<Experience> exp = datadao.getExp(key);
		Introduce intro = datadao.getIntro(key);
		
		allData.put("mem", mem);
		allData.put("user", user);
		allData.put("high", high);
		allData.put("col", col);
		allData.put("uni", uni);
		allData.put("gs", gs);
		allData.put("mil", mil);
		allData.put("car", car);
		allData.put("act", act);
		allData.put("lic", lic);
		allData.put("lang", lang);
		allData.put("exp", exp);
		allData.put("intro", intro);
		
		return allData;
	}

	@Override
	public void statusupdate(int jobopenNo, String userId, String status) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("jobopenNo", jobopenNo);
		map.put("userId", userId);
		map.put("status", status);
		
		dao.statusupdate(map);
		
	}







}
