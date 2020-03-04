package controller.admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import po.Notice;
import service.admin.AdminNoticeService;

@Controller
@RequestMapping("/admin")
public class AdminNoticeController extends BaseController{
	
	@Autowired
	private AdminNoticeService adminNoticeService;
	
	@RequestMapping("/toAddNotice")
	public String toAddNotice(Model model) {
		model.addAttribute("notice", new Notice());
		return "admin/addNotice";
	}
	@RequestMapping("/addNotice")
	public String addNotice(@ModelAttribute Notice notice) {
		return adminNoticeService.addNotice(notice);
	}
	@RequestMapping("/deleteNoticeSelect")
	public String deleteNoticeSelect(Model model) {
		return adminNoticeService.deleteNoticeSelect(model);
	}
	@RequestMapping("/selectNoticeOne")
	public String selectNoticeOne(Model model, String noticeId) {
		return adminNoticeService.selectNoticeOne(model, noticeId);
	}
	@RequestMapping("/deleteNotice")
	public String deleteNotice(String noticeId) {
		return adminNoticeService.deleteNotice(noticeId);
	}
}
