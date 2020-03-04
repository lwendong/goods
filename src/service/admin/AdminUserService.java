package service.admin;

import org.springframework.ui.Model;

public interface AdminUserService {
	
	public String userInfo(Model model,Integer pageNo);
	
	public String upUserManager(String id, Model model);
}
