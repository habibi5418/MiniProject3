package com.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kosa.dto.Notice;
import com.kosa.utils.ConnectionHelper;

// 오라클 DAO
public class OracleNoticeDao implements NoticeDao {
	
	// 1. Notice 테이블 전체 조회
	@Override
	public List<Notice> getAllNoticeList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Notice> noticeList = new ArrayList<>();
				
		try {
			conn = ConnectionHelper.getConnection("oracle"); 
			sql = "select * from notice order by noticeid desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				do {
					Notice notice = new Notice();
					notice.setNoticeid(rs.getInt(1));
					notice.setTitle(rs.getString(2));
					notice.setContents(rs.getString(3));
					notice.setWriter_uid(rs.getString(4));
					notice.setReg_date(rs.getString(5));
					notice.setMod_date(rs.getString(6));
					notice.setView_count(rs.getInt(7));
					notice.setDelete_yn(rs.getString(8));
					notice.setFixed_yn(rs.getString(9));
					noticeList.add(notice);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return noticeList;
	}
	
	// 2. Notice 조건 조회 where noticeid = ?
	@Override
	public Notice getNoticeByNoticeid(int noticeid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Notice notice = new Notice();
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from notice where noticeid = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeid);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				notice.setNoticeid(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setContents(rs.getString(3));
				notice.setWriter_uid(rs.getString(4));
				notice.setReg_date(rs.getString(5));
				notice.setMod_date(rs.getString(6));
				notice.setView_count(rs.getInt(7));
				notice.setDelete_yn(rs.getString(8));
				notice.setFixed_yn(rs.getString(9));
			}
			System.out.println("조회한 게시물 : " + notice);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return notice;
	}
	
	// 3. insert (noticeid, title, contents, writer_uid)
	@Override
	public int insertNotice(Notice notice) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "insert into notice(noticeid, title, contents, writer_uid) values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, notice.getNoticeid());
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getContents());
			pstmt.setString(4, notice.getWriter_uid());
			
			row = pstmt.executeUpdate();
			
			if (row > 0) System.out.println(notice + " 글 작성 완료");
			else System.out.println("글 작성 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}

	// 4. update (title, contents, mod_date) 조건 where noticeid = ?
	@Override
	public int updateNotice(Notice notice) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update notice set title = ?, contents = ?, mod_date = ? where noticeid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContents());
			pstmt.setString(3, notice.getMod_date());
			pstmt.setInt(4, notice.getNoticeid());
			
			row = pstmt.executeUpdate();
			
			if (row > 0) System.out.println(notice + " 글 수정 완료");
			else System.out.println("글 수정 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}

	// 5. delete 조건 where noticeid = ?
	@Override
	public boolean deleteNotice(int noticeid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		boolean result = false;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "delete from notice where noticeid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, noticeid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) {
				result = true;
				System.out.println(noticeid + "번 글 삭제 완료");
			}
			else System.out.println("글 삭제 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return result;
	}
	
	// 최근 글 5개 조회
	@Override
	public List<Notice> findRecent5() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Notice> noticeList = new ArrayList<>();
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from (select * from notice order by noticeid desc) where rownum <= 5";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				do {
					Notice notice = new Notice();
					notice.setNoticeid(rs.getInt(1));
					notice.setTitle(rs.getString(2));
					notice.setContents(rs.getString(3));
					notice.setWriter_uid(rs.getString(4));
					notice.setReg_date(rs.getString(5));
					notice.setMod_date(rs.getString(6));
					notice.setView_count(rs.getInt(7));
					notice.setDelete_yn(rs.getString(8));
					notice.setFixed_yn(rs.getString(9));
					noticeList.add(notice);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return noticeList;
	}
	
	@Override
	public void increaseViews(int noticeid, int view_count) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update notice set view_count = ? where noticeid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, view_count + 1);
			pstmt.setInt(2, noticeid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) {
				System.out.println(noticeid + "번 글 조회수 " + (view_count + 1) + "로 증가");
			}
			else System.out.println("조회수 증가 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
	}

	String table = "";
	@Override
	public String getAllNoticePrintAdmin() {
		List<Notice> noticeList = getAllNoticeList();
		
		noticeList.stream().forEach(m -> {
			table += "<tr><td>" + "<input type='checkbox'>" + "</td><td><a href='detailNotice.jsp?noticeid=" + m.getNoticeid() + "'>" + m.getTitle() + "</a></td><td>" + m.getWriter_uid() + "</td><td>" + m.getReg_date() + "</td><td>" + m.getView_count() + "</td></tr>";
		});
		
		return table;
	}
	
	@Override
	public String getAllNoticePrint() {
		List<Notice> noticeList = getAllNoticeList();
		
		noticeList.stream().forEach(m -> {
			table += "<tr><td><a href='detailNotice.jsp?noticeid=" + m.getNoticeid() + "'>" + m.getTitle() + "</a></td><td>" + m.getWriter_uid() + "</td><td>" + m.getReg_date() + "</td><td>" + m.getView_count() + "</td></tr>";
		});
		
		return table;
	}
}
