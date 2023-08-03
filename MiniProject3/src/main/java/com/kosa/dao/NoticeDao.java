package com.kosa.dao;

import java.util.List;

import com.kosa.dto.Notice;

public interface NoticeDao {
	List<Notice> getAllNoticeList();
	Notice getNoticeByNoticeid(int noticeid);
	int writeNotice(String title, String contents, String writer_uid);
	int updateNotice(int noticeid, String title, String contents);
	boolean deleteNotice(int noticeid);
	List<Notice> findRecent5();
	void increaseViews(int noticeid);
	String getAllNoticePrintAdmin();
	String getAllNoticePrint();
}
