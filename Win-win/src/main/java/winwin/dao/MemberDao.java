package winwin.dao;

import winwin.dto.Member;

public interface MemberDao {

	public int selectCnt(Member member);

	public Member select(Member member);

	public void join(Member member);

	public int idcheck(Member member);

	public int emailSearchCnt(Member member);

	public Member emailSearch(Member member);

	public int pwdSearchCnt(Member member);

	public Member pwdSearch(Member member);

	public void temppwchange(Member member);

	public int pwChangeCnt(Member member);

	public void pwdChange(Member member);

}
