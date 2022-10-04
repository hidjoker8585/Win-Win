package winwin.dao;

import java.util.List;
import java.util.Map;

import winwin.dto.JobopenBasic;
import winwin.dto.JobopenDetail;
import winwin.util.Paging;

public interface JobopenDao {
	
	public void insertBasic(JobopenBasic basic);
	
	public void insertDetail(JobopenDetail detail);
	
	public List<JobopenDetail> selectDetail(JobopenDetail detail);
	
	public void updateBasic(JobopenBasic basic);
	
	public JobopenBasic selectByBasic(JobopenBasic basic);
	
	public JobopenDetail selectByDetail(JobopenDetail detail);
	
	public void deleteBasic(int jobopenNo);
	
	public void deleteDetail(int jobopenNo);
	
	public int CountBasic();

	public List selectBasic(Paging paging);
	
	public void resetBasic(JobopenBasic basic);
	
	public void updateDetail(JobopenDetail detail);

	public void updateHit(JobopenBasic basic);
	
	public void updateBasicDis(int jobopenNo);
	
	public void updateDetailDis(int jobopenNo);

	public void updateStatus(JobopenBasic jobopenBasic);
	
	public int countStBasic(Map<String, Object> map);
	
	public void updateStatusByDate(int jobopenNo);
}
