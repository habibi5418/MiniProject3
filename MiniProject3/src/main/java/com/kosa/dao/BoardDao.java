package com.kosa.dao;

import java.util.List;

import com.kosa.dto.Board;

public interface BoardDao {
	List<Board> getAllBoardList();
	Board getBoardByBoardid(int boardid);
	int insertBoard(Board board);
	int updateBoard(Board board);
	boolean deleteBoard(int boardid);
	List<Board> findRecent5();
}
