package com.kosa.dao;

import java.util.List;

import com.kosa.dto.Board;

public interface BoardDao {
	List<Board> getAllBoardList();
	Board getBoardByBoardid(int boardid);
	public int writeBoard(String title, String contents, String writer_uid);
	int updateBoard(int boardid, String title, String contents);
	boolean deleteBoard(int boardid);
	List<Board> findRecent5();
	void increaseViews(int boardid);
	String getAllBoardPrintAdmin();
	String getAllBoardPrint();
}
