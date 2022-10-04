package winwin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import winwin.dao.ChartDao;

@Service
public class ChartServiceImpl implements ChartService{

	@Autowired ChartDao dao;
	
	@Override
	public int ages20Cho() {
		return dao.ages20Cho();
	}

	@Override
	public int ages20Hu() {
		return dao.ages20Hu();
	}

	@Override
	public int ages30s() {
		return dao.ages30s();
	}

	@Override
	public int ages40s() {
		return dao.ages40s();
	}

	@Override
	public int eduHigh() {
		return dao.eduHigh();
	}

	@Override
	public int eduColl() {
		return dao.eduColl();
	}

	@Override
	public int eduUniv() {
		return dao.eduUniv();
	}

	@Override
	public int eduMD() {
		return dao.eduMD();
	}

	@Override
	public int first_16() {
		return dao.first_16();
	}

	@Override
	public int second_16() {
		return dao.second_16();
	}

	@Override
	public int first_17() {
		return dao.first_17();
	}

	@Override
	public int second_17() {
		return dao.second_17();
	}

	@Override
	public int first_18() {
		return dao.first_18();
	}

	@Override
	public int second_18() {
		return dao.second_18();
	}

	@Override
	public int eduno() {
		return dao.eduno();
	}

}
