package winwin.dao;

import java.util.List;
import java.util.Map;

import winwin.dto.Activity;
import winwin.dto.Career;
import winwin.dto.College;
import winwin.dto.Experience;
import winwin.dto.GSchool;
import winwin.dto.HighSchool;
import winwin.dto.Introduce;
import winwin.dto.Language;
import winwin.dto.License;
import winwin.dto.Member;
import winwin.dto.Military;
import winwin.dto.University;
import winwin.dto.UserDetail;

public interface AllDataDao {

	public Member getMem(Map<String,Object> key);
	public UserDetail getUser(Map<String,Object> key);
	public HighSchool getHigh(Map<String,Object> key);
	public College getCol(Map<String,Object> key);
	public University getUni(Map<String,Object> key);
	public GSchool getGs(Map<String,Object> key);
	public Military getMil(Map<String,Object> key);

	public List<Career> getCar(Map<String,Object> key);
	public List<Activity> getAct(Map<String,Object> key);
	public List<License> getLic(Map<String,Object> key);
	public List<Language> getLang(Map<String,Object> key);
	public List<Experience> getExp(Map<String,Object> key);
	public Introduce getIntro(Map<String,Object> key);
}
