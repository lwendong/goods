package controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.admin.AdminOrderService;

@Controller
@RequestMapping("/admin")
public class AdminOrderController extends BaseController{
	
	@Autowired
	private AdminOrderService adminOrderService;
	
	@RequestMapping("/orderInfo")
	public String orderInfo(Model model,Integer pageNo) {
		return adminOrderService.orderInfo(model,pageNo);
	}
	
	@RequestMapping("/deleteorderManager")
	public String deleteorderManager(String id) {
		return adminOrderService.deleteorderManager(id);
	}
}
