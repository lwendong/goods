package controller.before;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import po.User;
import service.before.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired 
	private UserService userService;
	
	@RequestMapping("/register")
	public String register(@ModelAttribute User user,Model model, HttpSession session, String code) {
		return userService.register(user, model, session, code);
	}
	
	@RequestMapping("/login")
	public String login(@ModelAttribute User user,Model model, HttpSession session, String code) {
		return userService.login(user, model, session, code);
	}
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.invalidate();
		return "redirect:/before";
	}
}
