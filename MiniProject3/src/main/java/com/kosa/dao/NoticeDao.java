package com.kosa.dao;

import java.util.List;

import com.kosa.dto.Notice;

public interface NoticeDao {
	List<Notice> getAllNoticeList();
	Notice getNoticeByNoticeid(int noticeid);
	int insertNotice(Notice notice);
	int updateNotice(Notice notice);
	boolean deleteNotice(int noticeid);
	List<Notice> findRecent5();
	void increaseViews(int noticeid, int view_count);
	String getAllNoticePrintAdmin();
	String getAllNoticePrint();
}
