package com.kosa.service;


import java.util.List;

import com.kosa.dao.NoticeDao;
import com.kosa.dao.OracleNoticeDao;
import com.kosa.dto.Notice;

public class NoticeService {
	NoticeDao noticeDao = new OracleNoticeDao();
	
	// 최근 게시물 5개 가져오기
	public List<Notice> recent() {
		return noticeDao.findRecent5();
	}
	
	// 특정 게시물 가져오기 (noticeid)
	public Notice getNoticeByNoticeid(int noticeid) {
		return noticeDao.getNoticeByNoticeid(noticeid);
	}
	
	// 게시물 조회수 증가
	public void increaseViews(int noticeid) {
		Notice notice = noticeDao.getNoticeByNoticeid(noticeid);
		noticeDao.increaseViews(noticeid, notice.getView_count());
	}

	// 전체 게시물 가져오기 (관리자용)
	public String allNoticePrintAdmin() {
		return noticeDao.getAllNoticePrintAdmin();
	}
	
	// 전체 게시물 가져오기
	public String allNoticePrint() {
		return noticeDao.getAllNoticePrint();
	}
}