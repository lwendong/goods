package controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.admin.AdminUserService;

@Controller
@RequestMapping("/admin")
public class AdminUserController extends BaseController{
	
	@Autowired
	private AdminUserService adminUserService;
	
	@RequestMapping("/userInfo")
	public String userInfo(Model model,Integer pageNo) {
		return adminUserService.userInfo(model,pageNo);
	}
	
	@RequestMapping("/upUserManager")
	public String upUserManager(String id, Model model) {
		
		return adminUserService.upUserManager(id, model);
	}
}
