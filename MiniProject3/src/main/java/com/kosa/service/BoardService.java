package com.kosa.service;


import java.util.List;

import com.kosa.dao.BoardDao;
import com.kosa.dao.OracleBoardDao;
import com.kosa.dto.Board;

public class BoardService {
	BoardDao boardDao = new OracleBoardDao();
	
	// 최근 게시물 5개 가져오기
	public List<Board> recent() {
		return boardDao.findRecent5();
	}
	
	// 특정 게시물 가져오기 (boardid)
	public Board getBoardByBoardid(int boardid) {
		return boardDao.getBoardByBoardid(boardid);
	}
	
	// 게시물 조회수 증가
	public void increaseViews(int boardid) {
		boardDao.increaseViews(boardid);
	}
	
	// 전체 게시물 가져오기 (관리자용)
	public String allBoardPrintAdmin() {
		return boardDao.getAllBoardPrintAdmin();
	}
	
	// 전체 게시물 가져오기
	public String allBoardPrint() {
		return boardDao.getAllBoardPrint();
	}
	
	// 글 작성
	public int write(String title, String contents, String writer_uid) {
		return boardDao.writeBoard(title, contents, writer_uid);
	}
	
	// 글 수정
	public int update(int boardid, String title, String contents) {
		return boardDao.updateBoard(boardid, title, contents);
	}
}
