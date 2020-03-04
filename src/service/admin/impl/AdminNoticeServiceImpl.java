package service.admin.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return "forward:/admin/deleteNoticeSelect";
	}
	
	public String deleteNoticeSelect(Model model,Integer pageNo) {
		List<Notice> list = adminNoticeDao.deleteNoticeSelect();
		int temp = list.size();
		model.addAttribute("totalCount", temp);
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//总页数
		} else {
			//返回大于或者等于指定表达式的最小整数
			totalPage = (int) Math.ceil((double) temp / 10);
		}
		if (pageNo == null) {
			pageNo = 1;
		}
		//分页查询
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", (pageNo - 1) * 10);//起始位置
		map.put("pageSize", 10);//每页10个
		model.addAttribute("allNotices", adminNoticeDao.deleteNoticeSelectBypage(map));
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageNo", pageNo);
		return "admin/deleteNoticeSelect";
	}
	
	public String selectNoticeOne(Model model, String noticeId) {
		model.addAttribute("notice", adminNoticeDao.selectNoticeOne(noticeId));
		return "admin/noticeDetail";
	}
	public String deleteNotice(String noticeId) {
		adminNoticeDao.deleteNotice(noticeId);
		return "forward:/admin/deleteNoticeSelect";
	}

}
