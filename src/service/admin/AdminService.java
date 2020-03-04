package service.admin;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import po.User;
public interface AdminService {
	
	public String login(User User, Model model, HttpSession session);
}
