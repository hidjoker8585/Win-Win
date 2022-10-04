package winwin.dto;

public class Admin {

	private int adminCode;
	private String nick;
	
	@Override
	public String toString() {
		return "Admin [adminCode=" + adminCode + ", nick=" + nick + "]";
	}

	public int getAdminCode() {
		return adminCode;
	}

	public void setAdminCode(int adminCode) {
		this.adminCode = adminCode;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	

}
