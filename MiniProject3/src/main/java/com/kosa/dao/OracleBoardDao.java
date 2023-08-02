package com.kosa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kosa.dto.Board;
import com.kosa.utils.ConnectionHelper;

// 오라클 DAO
public class OracleBoardDao implements BoardDao {
	
	// 1. Board 테이블 전체 조회
	@Override
	public List<Board> getAllBoardList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Board> boardList = new ArrayList<>();
				
		try {
			conn = ConnectionHelper.getConnection("oracle"); 
			sql = "select * from board order by boardid desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				do {
					Board board = new Board();
					board.setBoardid(rs.getInt(1));
					board.setTitle(rs.getString(2));
					board.setContents(rs.getString(3));
					board.setWriter_uid(rs.getString(4));
					board.setReg_date(rs.getString(5));
					board.setMod_date(rs.getString(6));
					board.setView_count(rs.getInt(7));
					board.setDelete_yn(rs.getString(8));
					boardList.add(board);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return boardList;
	}
	
	// 2. Board 조건 조회 where boardid = ?
	@Override
	public Board getBoardByBoardid(int boardid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Board board = new Board();
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from board where boardid = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardid);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board.setBoardid(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContents(rs.getString(3));
				board.setWriter_uid(rs.getString(4));
				board.setReg_date(rs.getString(5));
				board.setMod_date(rs.getString(6));
				board.setView_count(rs.getInt(7));
				board.setDelete_yn(rs.getString(8));
			}
			System.out.println("조회한 게시물 : " + board);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return board;
	}
	
	// 3. insert (boardid, title, contents, writer_uid)
	@Override
	public int insertBoard(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "insert into board(boardid, title, contents, writer_uid) values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, board.getBoardid());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContents());
			pstmt.setString(4, board.getWriter_uid());
			
			row = pstmt.executeUpdate();
			
			if (row > 0) System.out.println(board + " 글 작성 완료");
			else System.out.println("글 작성 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}

	// 4. update (title, contents, mod_date) 조건 where boardid = ?
	@Override
	public int updateBoard(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update board set title = ?, contents = ?, mod_date = ? where boardid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContents());
			pstmt.setString(3, board.getMod_date());
			pstmt.setInt(4, board.getBoardid());
			
			row = pstmt.executeUpdate();
			
			if (row > 0) System.out.println(board + " 글 수정 완료");
			else System.out.println("글 수정 실패");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return row;
	}

	// 5. delete 조건 where boardid = ?
	@Override
	public boolean deleteBoard(int boardid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		boolean result = false;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "delete from board where boardid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) {
				result = true;
				System.out.println(boardid + "번 글 삭제 완료");
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
	public List<Board> findRecent5() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<Board> boardList = new ArrayList<>();
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "select * from (select * from board order by boardid desc) where rownum <= 5";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				do {
					Board board = new Board();
					board.setBoardid(rs.getInt(1));
					board.setTitle(rs.getString(2));
					board.setContents(rs.getString(3));
					board.setWriter_uid(rs.getString(4));
					board.setReg_date(rs.getString(5));
					board.setMod_date(rs.getString(6));
					board.setView_count(rs.getInt(7));
					board.setDelete_yn(rs.getString(8));
					boardList.add(board);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		
		return boardList;
	}
	
	@Override
	public void increaseViews(int boardid, int view_count) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int row = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			sql = "update board set view_count = ? where boardid = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, view_count + 1);
			pstmt.setInt(2, boardid);
			
			row = pstmt.executeUpdate();
			
			if (row > 0) {
				System.out.println(boardid + "번 글 조회수 " + (view_count + 1) + "로 증가");
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
	public String getAllBoardPrint() {
		List<Board> boardList = getAllBoardList();
		
		boardList.stream().forEach(m -> {
			table += "<tr><td>" + "<input type='checkbox'>" + "</td><td><a href='detailBoard.jsp?boardid=" + m.getBoardid() + "'>" + m.getTitle() + "</a></td><td>" + m.getWriter_uid() + "</td><td>" + m.getReg_date() + "</td><td>" + m.getView_count() + "</td></tr>";
		});
		
		return table;
	}
}
