package winwin.service;

import java.util.List;

import winwin.dto.Member;
import winwin.dto.Support;

public interface ApplyMenuService {

	public List getJobopenBasic();

	public List getJobopenBasic2();
	
	public List getJobopenBasic3();

	public List getJobopenBasic4();


	public boolean pwCheck(Member member);

	public boolean checkApplicant(Support supp);

	public Support passfail(Support supp);

}
