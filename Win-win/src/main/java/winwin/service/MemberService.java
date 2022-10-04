package winwin.service;

import org.springframework.stereotype.Service;

import winwin.dto.Member;

@Service
public interface MemberService {
	

	public boolean login(Member member);

	public Member info(Member member);

	public void join(Member member);

	public boolean idcheck(Member member);

	public boolean emailSearchCnt(Member member);

	public Member emailSearch(Member member);

	public boolean pwdSearchCnt(Member member);

	public Member pwdSearch(Member member);

	public void temppwchange(Member member);

	public boolean pwChangeCnt(Member member);

	public void pwdChange(Member member);
}
