package winwin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import winwin.dao.AdminDao;
import winwin.dto.Admin;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao admindao;
	
	@Override
	public boolean adminlogin(Admin admin) {
		if( admindao.adminlogin(admin) == 1 )	{
			return true;
		}
		else	return false;
	}

	@Override
	public Admin adminInfo(Admin admin) {
		return admindao.adminInfo(admin);
	}
}
