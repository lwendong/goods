package service.before.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import dao.before.UserDao;
import po.User;
import service.before.UserService;
import util.MyUtil;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	
	public String register(User user, Model model, HttpSession session, String code) {
		String displayCode = session.getAttribute("code").toString();
		if(!StringUtils.equalsIgnoreCase(code, displayCode)) {
			model.addAttribute("msg", "验证码错误！");
			return "before/register";
		}
		if(userDao.selectUserByEmail(user.getEmail()) != 0) {
			model.addAttribute("msg", "用户名已存在！");
			return "before/register";
		}
		user.setId(MyUtil.getUUID());
		int successNum = userDao.register(user);
		if(successNum > 0) {
			return "before/login";
		}else {
			model.addAttribute("msg", "注册失败！");
			return "before/register";
		}
	}
	
	public String login(User user, Model model, HttpSession session, String code) {
		String displayCode = session.getAttribute("code").toString();
		if(!StringUtils.equalsIgnoreCase(code, displayCode)) {
			session.setAttribute("msg", "验证码错误！");
			return "redirect:/toLogin";
		}
		User ruser = null;
		List<User> list = userDao.login(user);
		if(list != null && list.size() > 0) {
			ruser = list.get(0);
		}
		if(ruser != null) {
			session.setAttribute("user", ruser);
			return "redirect:/before";
		}else {
			session.setAttribute("msg", "用户名或密码错误！");
			return "redirect:/toLogin";
		}
	}

}
