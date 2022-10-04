package winwin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import winwin.dao.ApplyMenuDao;
import winwin.dto.Member;
import winwin.dto.Support;

@Service
public class ApplyMenuServiceImpl implements ApplyMenuService{
	
	@Autowired ApplyMenuDao applyMenuDao;

	@Override
	public List getJobopenBasic() {
		return applyMenuDao.getJobopenBasic();
	}

	@Override
	public List getJobopenBasic2() {
		
		return applyMenuDao.getJobopenBasic2();
	}
	
	@Override
	public List getJobopenBasic3() {
		return applyMenuDao.getJobopenBasic3();
	}

	@Override
	public List getJobopenBasic4() {
		
		return applyMenuDao.getJobopenBasic4();
	}

	@Override
	public boolean pwCheck(Member member) {
		if( applyMenuDao.pwCheck(member) == 1) return true;
		else 	return false; 
	}

	@Override
	public boolean checkApplicant(Support supp) {
		if( applyMenuDao.checkApplicant(supp) >= 1) return true;
		return false;
	}

	@Override
	public Support passfail(Support supp) {
		return applyMenuDao.passfail(supp);
	}

}
