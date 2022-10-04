package winwin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import winwin.dao.Apply2Dao;
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

@Service
public class Apply2ServiceImpl implements Apply2Service{

@Autowired Apply2Dao dao;
	
	public JobopenBasic viewJobOpen(JobopenBasic jopopenBasic) {
		return dao.selectJobOpen(jopopenBasic);
	}
	
	public void insertLanguage(Language language) {
		dao.insertLanguage(language);
	}
	
	public List<Language> selectLanguage(Language language) {
		return dao.selectLanguage(language);
	}
	
	public void updateLanguage(Language language) {
		dao.updateLanguage(language);
	}
	
	public void insertLicense(License license) {
		dao.insertLicense(license);
	}
	
	public List<License> selectLicense(License license) {
		return dao.selectLicense(license);
	}
	
	public void updateLicense(License license) {
		dao.updateLicense(license);
	}
	
	public void insertCareer(Career career) {
		dao.insertCareer(career);
	}
	
	public List<Career> selectCareer(Career career) {
		return dao.selectCareer(career);
	}
	
	public void updateCareer(Career career) {
		dao.updateCareer(career);
	}
	
	public void insertActivity(Activity activity) {
		dao.insertActivity(activity);
	}
	
	public List<Activity> selectActivity(Activity activity) {
		return dao.selectActivity(activity);
	}
	
	public void updateActivity(Activity activity) {
		dao.updateActivity(activity);
	}
	
	public void insertExperience(Experience experience) {
		dao.insertExperience(experience);
	}
	
	public List<Experience> selectExperience(Experience experience) {
		return dao.selectExperience(experience);
	}
	
	public void updateExperience(Experience experience) {
		dao.updateExperience(experience);
	}
	
	public void insertMaterial(Material material) {
		dao.insertMaterial(material);
	}
	
	public Material selectMaterial(Material material) {
		return dao.selectMaterial(material);
	}
	
	public void updateMaterial(Material material) {
		dao.updateMaterial(material);
	}
	
	public void insertIntroduce(Introduce introduce) {
		dao.insertIntroduce(introduce);
	}
	
	public Introduce selectIntroduce(Introduce introduce) {
		return dao.selectIntroduce(introduce);
	}
	
	public void updateIntroduce(Introduce introduce) {
		dao.updateIntroduce(introduce);
	}

	
	public Member selectMember(Member member) {
		return dao.selectMember(member);
	}
	
	public UserDetail selectUserDetail(UserDetail userDetail) {
		return dao.selectUserDetail(userDetail);
	}
	
	public HighSchool selectHighSchool(HighSchool highSchool) {
		return dao.selectHighSchool(highSchool);
	}
	
	public College selectCollege(College college) {
		return dao.selectCollege(college);
	}
	
	public University selectUniversity(University university) {
		return dao.selectUniversity(university);
	}
	
	public GSchool selectGSchool(GSchool gSchool) {
		return dao.selectGSchool(gSchool);
	}
	
	public Military selectMilitary(Military military) {
		return dao.selectMilitary(military);
	}
	
	public void insertSupport(Support support) {
		dao.insertSupport(support);
	}

	@Override
	public void fileUpload(Material mat) {
		dao.fileUpload(mat);
	}

	@Override
	public int countIntro(Introduce intro) {
		return dao.countIntro(intro);
	}

	@Override
	public int countMaterial(Material material) {
		return dao.countMaterial(material);
	}

	@Override
	public int countLanguage(Language language) {
		return dao.countLanguage(language);
	}

	@Override
	public int countLicense(License license) {
		return dao.countLicense(license);
	}

	@Override
	public int countCareer(Career career) {
		return dao.countCareer(career);
	}

	@Override
	public int countActivity(Activity activity) {
		return dao.countActivity(activity);
	}

	@Override
	public int countExperience(Experience experience) {
		return dao.countExperience(experience);
	}

	@Override
	public void deleteLanguage(Language language) {
		dao.deleteLanguage(language);
	}

	@Override
	public void deleteLicense(Language language) {
		dao.deleteLicense(language);
	}

	@Override
	public void deleteCareer(Language language) {
		dao.deleteCareer(language);
	}

	@Override
	public void deleteActivity(Language language) {
		dao.deleteActivity(language);
	}

	@Override
	public void deleteExperience(Language language) {
		dao.deleteExperience(language);
	}

	@Override
	public void deleteMaterial(Material material) {
		dao.deleteMaterial(material);
	}

}
