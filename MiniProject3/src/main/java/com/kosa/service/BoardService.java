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
		Board board = boardDao.getBoardByBoardid(boardid);
		boardDao.increaseViews(boardid, board.getView_count());
	}
	
	// 전체 게시물 가져오기
	public String allBoardPrint() {
		return boardDao.getAllBoardPrint();
	}
}
