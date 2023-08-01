package com.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kosa.dto.Member;
import com.kosa.utils.ConnectionHelper;

public class MemberDao {
	
	// 1. Member 테이블 전체 조회
	public List<Member> getAllMemberList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Member> memberList = new ArrayList<>();
				
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				do {
					Member member = new Member();
					member.setMemid(rs.getString(1));
					member.setMname(rs.getString(2));
					member.setPwd(rs.getString(3));
					member.setPhone(rs.getString(4));
					memberList.add(member);
				} while (rs.next());
			}
			System.out.println(memberList);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return memberList;
	}
	
	// 2-1. Member 조건 조회 where memid = ?
	public Member getMemberByMemid(String memid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Member member = new Member();
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from member where memid = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memid);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member.setMemid(rs.getString(1));
				member.setMname(rs.getString(2));
				member.setPwd(rs.getString(3));
				member.setPhone(rs.getString(4));
			}
			System.out.println("조회한 멤버 : " + member);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return member;
	}
	
	// 2-2. 아이디 찾기 where mname = ? and phone = ?
	public String getMemidByMnamePhone(String mname, String phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String memid = "";
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from member where mname = ? and phone = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mname);
			pstmt.setString(2, phone);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) memid = rs.getString(1);
			
			System.out.println("찾은 아이디 : " + memid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return memid;
	}
	
	// 2-3. 비밀번호 찾기 where memid = ? and mname = ?
	public String getPwdByMemidMname(String memid, String mname) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String pwd = "";
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from member where memid = ? and mname = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memid);
			pstmt.setString(2, mname);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) pwd = rs.getString(3);
			
			System.out.println("찾은 비밀번호 : " + pwd);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return pwd;
	}

	// 3. insert (memid, mname, pwd, phone)
	public int insertMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "insert into member(memid, mname, pwd, phone) values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getMemid());
			pstmt.setString(2, member.getMname());
			pstmt.setString(3, member.getPwd());
			pstmt.setString(4, member.getPhone());
			
			row = pstmt.executeUpdate();
			
			if (row > 0) System.out.println(member + " 회원가입 완료");
			else System.out.println("회원가입 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}

	// 4. update (mname, pwd, phone) 조건 where memid = ?
	public int updateMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update member set mname = ?, pwd = ?, phone = ? where memid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member.getMname());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getMemid());
			
			row = pstmt.executeUpdate();
			
			if (row > 0) System.out.println(member + " 정보 수정 완료");
			else System.out.println("정보 수정 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}

	// 5. delete (memid)
	public int deleteMember(String memid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "delete from member where memid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) System.out.println(memid + " 회원탈퇴 완료");
			else System.out.println("회원탈퇴 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}
}
