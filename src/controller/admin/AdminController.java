package controller.admin;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import po.User;
import service.admin.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin")
	public String toLogin(@ModelAttribute User User) {
		return "admin/login";
	}
	@RequestMapping("/admin/login")
	public String login(@ModelAttribute User User, Model model, HttpSession session) {
		return adminService.login(User, model, session);
	}
	@RequestMapping("/admin/exit")
	public String exit(@ModelAttribute User User,HttpSession session) {
		session.invalidate();
		return "admin/login";
	}
}
