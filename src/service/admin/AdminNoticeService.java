package service.admin;

import org.springframework.ui.Model;

import po.Notice;

public interface AdminNoticeService {
	
	public String addNotice(Notice notice);
	
	public String deleteNoticeSelect(Model model,Integer pageNo);
	
	public String selectNoticeOne(Model model, String noticeId);
	public String deleteNotice(String noticeId);
}
