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
	@Autowired
	private AdminTypeDao adminTypeDao;
	
	public String login(User User, Model model, HttpSession session) {
		if(adminDao.login(User) != null && adminDao.login(User).size() > 0) {
			session.setAttribute("user", User);
			return "admin/main";
		}
		model.addAttribute("msg", "�û������������");
		return "admin/login";
	}

}
