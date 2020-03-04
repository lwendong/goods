package service.admin.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import dao.admin.AdminUserDao;
import dao.before.CartDao;
import dao.before.UserCenterDao;
import po.User;
import service.admin.AdminUserService;

@Service("adminUserService")
@Transactional
public class AdminUserServiceImpl implements AdminUserService{
	@Autowired
	private AdminUserDao adminUserDao;

	
	public String userInfo(Model model,Integer pageNo) {
		List<User> list = adminUserDao.userInfo();
		int temp = list.size();
		model.addAttribute("totalCount", temp);
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//总页数
		} else {
			//返回大于或者等于指定表达式的最小整数
			totalPage = (int) Math.ceil((double) temp / 10);
		}
		if (pageNo == null) {
			pageNo = 1;
		}
		//分页查询
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", (pageNo - 1) * 10);//起始位置
		map.put("pageSize", 10);//每页10个
		model.addAttribute("userList", adminUserDao.userInfoBypage(map));
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageNo", pageNo);
		return "admin/userManager";
	}

	public String upUserManager(String id, Model model) {
		User user = adminUserDao.userOne(id);
		int s = user.getState();
		User user2 = new User();
		user2.setState(user.getState());
		user2.setId(id);
		if(adminUserDao.upUserManager(user2) > 0) 
			model.addAttribute("state", "用户状态已修改");
			return "forward:/admin/userInfo";
	}

}
