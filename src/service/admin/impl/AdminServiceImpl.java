package service.admin.impl;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import dao.admin.AdminDao;
import dao.admin.AdminTypeDao;
import po.User;
import service.admin.AdminService;

@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;

	
	public String login(User User, Model model, HttpSession session) {
		if(adminDao.login(User) != null && adminDao.login(User).size() > 0) {
			session.setAttribute("auser", User);
			return "admin/main";
		}
		model.addAttribute("m", "用户名或密码错误！");
		return "admin/login";
	}

}
