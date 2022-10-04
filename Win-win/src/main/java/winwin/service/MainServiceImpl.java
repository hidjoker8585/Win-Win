package winwin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import winwin.dao.MainDao;
import winwin.dto.JobopenBasic;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired MainDao mainDao;

	@Override
	public int countQnAUnanswered() {
		
		int answered = mainDao.countQnAUnanswered();
		
		int all = mainDao.allCountQnA();
		
		int Unanswered = all - answered;
		
		
		return Unanswered;
	}
	
	@Override
	public List getNoticeBoard() {
		return mainDao.getNoticeBoard();
	}

	@Override
	public List getQnaBoard() {
		return mainDao.getQnaBoard();
	}

	@Override
	public List getJobopenBasic() {
		return mainDao.getJobopenBasic();
	}

	@Override
	public List countSupport() {
		return mainDao.countSupport();
	}

	@Override
	public int getSec18() {
		return mainDao.getSec18();
	}

	
}
