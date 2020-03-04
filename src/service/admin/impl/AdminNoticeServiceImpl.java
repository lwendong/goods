package service.admin.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import dao.admin.AdminNoticeDao;
import po.Notice;
import service.admin.AdminNoticeService;
import util.MyUtil;

@Service("adminNoticeService")
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService{
	
	@Autowired
	private AdminNoticeDao adminNoticeDao;
	
	public String addNotice(Notice notice) {
		notice.setId(MyUtil.getUUID());
		adminNoticeDao.addNotice(notice);
		return "forward:/adminNotice/deleteNoticeSelect";
	}
	
	public String deleteNoticeSelect(Model model) {
		model.addAttribute("allNotices", adminNoticeDao.deleteNoticeSelect());
		return "admin/deleteNoticeSelect";
	}
	
	public String selectNoticeOne(Model model, String noticeId) {
		model.addAttribute("notice", adminNoticeDao.selectNoticeOne(noticeId));
		return "admin/noticeDetail";
	}
	public String deleteNotice(String noticeId) {
		adminNoticeDao.deleteNotice(noticeId);
		return "forward:/adminNotice/deleteNoticeSelect";
	}

}
