package com.kosa.dao;

import java.util.List;

import com.kosa.dto.Notice;

public interface NoticeDao {
	List<Notice> getAllNoticeList();
	Notice getNoticeByNoticeid(int noticeid);
	int writeNotice(String title, String contents, String writer_uid);
	int updateNotice(int noticeid, String title, String contents);
	int deleteNotice(int noticeid);
	int deleteNotices(String deleteNotices);
	List<Notice> findRecent5();
	void increaseViews(int noticeid);
	String getAllNoticePrintAdmin();
	String getAllNoticePrint();
	int fixNotice(int noticeid, String doYN);
}
