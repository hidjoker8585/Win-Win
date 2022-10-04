package winwin.service;

import winwin.dto.Admin;

public interface AdminService {

	public boolean adminlogin(Admin admin);

	public Admin adminInfo(Admin admin);
	
}
