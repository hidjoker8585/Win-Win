package winwin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import winwin.dao.MemberDao;
import winwin.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberdao;
	
	public boolean login(Member member) {
		if( memberdao.selectCnt(member) == 1 )	return true;
		else	return false;
	}

	public Member info(Member member) {
		return memberdao.select(member);
	}

	public void join(Member member) {
		memberdao.join(member);
	}

	@Override
	public boolean idcheck(Member member) {
		if(memberdao.idcheck(member) > 0) {
			return true;
		}
		return false;
		
	}

	@Override
	public boolean emailSearchCnt(Member member) {
		if(memberdao.emailSearchCnt(member) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public Member emailSearch(Member member) {
		return memberdao.emailSearch(member);
	}

	@Override
	public boolean pwdSearchCnt(Member member) {
		if(memberdao.pwdSearchCnt(member) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public Member pwdSearch(Member member) {
		return memberdao.pwdSearch(member);
	}

	@Override
	public void temppwchange(Member member) {
		memberdao.temppwchange(member);
		
	}

	@Override
	public boolean pwChangeCnt(Member member) {
		if(memberdao.pwChangeCnt(member) > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void pwdChange(Member member) {
		memberdao.pwdChange(member);
	}
}
