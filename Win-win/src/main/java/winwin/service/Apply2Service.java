package winwin.service;

import java.util.List;

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
import winwin.dto.Support;
import winwin.dto.University;
import winwin.dto.UserDetail;

public interface Apply2Service {

	public JobopenBasic viewJobOpen(JobopenBasic jopopenBasic);
	
	public void insertLanguage(Language language);
	
	public List<Language> selectLanguage(Language language);
	
	public void updateLanguage(Language language);
	
	public void insertLicense(License license);
	
	public List<License> selectLicense(License license);
	
	public void updateLicense(License license);
	
	public void insertCareer(Career career);
	
	public List<Career> selectCareer(Career career);
	
	public void updateCareer(Career career);
	
	public void insertActivity(Activity activity);
	
	public List<Activity> selectActivity(Activity activity);
	
	public void updateActivity(Activity activity);
	
	public void insertExperience(Experience experience);
	
	public List<Experience> selectExperience(Experience experience);
	
	public void updateExperience(Experience experience);
	
	public void insertMaterial(Material material);
	
	public Material selectMaterial(Material material);
	
	public void updateMaterial(Material material);
	
	public void insertIntroduce(Introduce introduce);

	public Introduce selectIntroduce(Introduce introduce);

	public void updateIntroduce(Introduce introduce);
	
	public Member selectMember(Member member);
	
	public UserDetail selectUserDetail(UserDetail userDetail);
	
	public HighSchool selectHighSchool(HighSchool highSchool);
	
	public College selectCollege(College college);
	
	public University selectUniversity(University university);
	
	public GSchool selectGSchool(GSchool gSchool);
	
	public Military selectMilitary(Military military);
	
	public void insertSupport(Support support);

	public void fileUpload(Material mat);

	public int countIntro(Introduce intro);

	public int countMaterial(Material material);

	public int countLanguage(Language language);

	public int countLicense(License license);

	public int countCareer(Career career);

	public int countActivity(Activity activity);

	public int countExperience(Experience experience);

	public void deleteLanguage(Language language);

	public void deleteLicense(Language language);

	public void deleteCareer(Language language);

	public void deleteActivity(Language language);

	public void deleteExperience(Language language);

	public void deleteMaterial(Material material);
	
}
