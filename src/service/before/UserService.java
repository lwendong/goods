package service.before;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import po.User;

public interface UserService {
	
	public String register(User User,Model model, HttpSession session, String code);
	
	public String login(User User,Model model, HttpSession session, String code);
	
}
