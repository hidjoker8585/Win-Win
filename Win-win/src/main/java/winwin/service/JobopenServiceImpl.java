package winwin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import winwin.dao.JobopenDao;
import winwin.dto.JobopenBasic;
import winwin.dto.JobopenDetail;
import winwin.util.Paging;

@Service
public class JobopenServiceImpl implements JobopenService {

	@Autowired
	JobopenDao jobopenDao;
	
	@Override
	public void writeBasic(JobopenBasic basic) {
		jobopenDao.insertBasic(basic);
	}

	@Override
	public void writeDetail(JobopenDetail detail) {
		jobopenDao.insertDetail(detail);
	}

	@Override
	public List<JobopenDetail> selectDetail(JobopenDetail detail) {
		return jobopenDao.selectDetail(detail);
	}

	@Override
	public void updateBasic(JobopenBasic basic) {
		jobopenDao.updateBasic(basic);
	}

	@Override
	public JobopenBasic viewBasic(JobopenBasic basic) {
		jobopenDao.updateHit(basic);
		return jobopenDao.selectByBasic(basic);
	}

	@Override
	public JobopenDetail viewDetail(JobopenDetail detail) {
		return jobopenDao.selectByDetail(detail);
	}

	@Override
	public void deleteJobopen(int jobopenNo) {
		jobopenDao.deleteBasic(jobopenNo);
		jobopenDao.deleteDetail(jobopenNo);
	}

	@Override
	public int CountBasic() {
		return jobopenDao.CountBasic();
	}
	
	@Override
	public List selectBasic(Paging paging) {
		return jobopenDao.selectBasic(paging);
	}

	public int countStBasic(String status) {
		Map<String, Object> map = new HashMap<>();
		map.put("status", status);
		return jobopenDao.countStBasic(map);
	}
	
	@Override
	public Paging getPaging(int curPage, int listCount, int pageCount) {

		int totalCount = this.CountBasic();
		
		Paging paging = new Paging(totalCount, curPage, listCount, pageCount);
		
		return paging;		
	}
	
	public Paging getStPaging(int curPage, int listCount, int pageCount, String status) {
		int totalCount = this.countStBasic(status);
		Paging paging = new Paging(totalCount, curPage, listCount, pageCount);
		paging.setStatus(status);
		return paging;
	}
	

	@Override
	public void resetBasic(JobopenBasic jobopenBasic) {
		jobopenDao.resetBasic(jobopenBasic);
	}
	
	
	

	@Override
	public void regiInfo(int jobopenNo) {
		jobopenDao.updateBasicDis(jobopenNo);
//		jobopenDao.updateDetailDis(jobopenNo);
	}

	@Override
	public void updateDetail(JobopenDetail jobopenDetail) {
		jobopenDao.updateDetail(jobopenDetail);
	}

	@Override
	public void updateStatusByNo(JobopenBasic jobopenBasic) {
		jobopenDao.updateStatus(jobopenBasic);
	}

	@Override
	public void updateStatusByDate(int jobopenNo) {
		jobopenDao.updateStatusByDate(jobopenNo);
		
	}

	@Override
	public JobopenBasic getBasic(JobopenBasic basic) {
		return jobopenDao.selectByBasic(basic);
	}

}
