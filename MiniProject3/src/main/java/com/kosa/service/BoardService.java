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
}
