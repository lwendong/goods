package controller.admin;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.admin.AdminTypeService;
@Controller
@RequestMapping("/admin")
public class AdminTypeController extends BaseController{
	@Autowired
	private AdminTypeService adminTypeService;
	
	@RequestMapping("/toAddType")
	public String toAddType(Model model,Integer pageNo) {
		return adminTypeService.toAddType(model,pageNo);
	}
	
	/**
	 * 添加类型
	 */
	@RequestMapping("/addType")
	public String addType(String name,String code,Model model,HttpSession session) {
		return adminTypeService.addType(name,code,model, session);
	}
	
	/**
	 * 删除类型
	 */
	@ResponseBody
	@RequestMapping("/deleteType")
	public Map<String, Object> deleteType(String id,Model model) {
		Map<String, Object> map = adminTypeService.deleteType(id, model);
		return map;
	}
	
}
