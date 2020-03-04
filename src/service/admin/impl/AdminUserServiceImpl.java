package service.admin.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import dao.admin.AdminUserDao;
import dao.before.CartDao;
import dao.before.UserCenterDao;
import service.admin.AdminUserService;

@Service("adminUserService")
@Transactional
public class AdminUserServiceImpl implements AdminUserService{
	@Autowired
	private AdminUserDao adminUserDao;
	@Autowired
	private CartDao cartDao;
	@Autowired
	private UserCenterDao userCenterDao;
	
	public String userInfo(Model model) {
		model.addAttribute("userList", adminUserDao.userInfo());
		return "admin/userManager";
	}
	
	public String deleteuserManager(String userId, Model model) {
		//�û��й���
		if(cartDao.selectCart(userId).size() > 0 ||
				userCenterDao.myFocus(userId).size() > 0||
				userCenterDao.myOrder(userId).size() > 0) {
			model.addAttribute("msg", "�û��й���������ɾ����");
			return "forward:/adminUser/userInfo";
		}
		if(adminUserDao.deleteuserManager(userId) > 0) 
			model.addAttribute("msg", "�ɹ�ɾ���û���");
		return "forward:/adminUser/userInfo";
	}

}
