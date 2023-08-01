package com.kosa.service;

import java.util.List;

import com.kosa.dao.MemberDao;
import com.kosa.dto.Member;

public class MemberService {
	MemberDao memberDao;
	
	// 생성자로 DB 지정. ex) oracle, mysql, maria ...
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public List<Member> getAllMemberList() {
		return memberDao.getAllMemberList();
	}
	
	// 로그인
	public Member login(String memid, String pwd) {
		return memberDao.getMemberByMemidPwd(memid, pwd);
	}
}
