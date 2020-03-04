package service.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import dao.admin.AdminOrderDao;
import service.admin.AdminOrderService;

@Service("adminOrderService")
@Transactional
public class AdminOrderServiceImpl implements AdminOrderService{
	
	@Autowired
	private AdminOrderDao adminOrderDao;
	
	public String orderInfo(Model model) {
		List<Map<String,Object>> list = adminOrderDao.orderInfo();
		model.addAttribute("orderList", list);
		return "admin/orderManager";
	}
	
	public String deleteorderManager(String orderId) {
		adminOrderDao.deleteOrderBase(orderId);
		return "forward:/adminOrder/orderInfo";
	}

}
