package winwin.dao;

import winwin.dto.Admin;

public interface AdminDao {

	public int adminlogin(Admin admin);

	public Admin adminInfo(Admin admin);

}
