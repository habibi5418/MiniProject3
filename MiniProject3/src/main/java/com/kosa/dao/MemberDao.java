package com.kosa.dao;

import java.util.List;

import com.kosa.dto.Member;

public interface MemberDao {
	public List<Member> getAllMemberList();
	public Member getMemberByMemid(String memid);
	public String getMemidByMnamePhone(String mname, String phone);
	public String getPwdByMemidMname(String memid, String mname);
	public Member getMemberByMemidPwd(String memid, String pwd);
	public int insertMember(Member member);
	public int updateMember(Member member);
	public boolean deleteMember(String memid, String pwd);
	public String getAllMemberPrint();
}
