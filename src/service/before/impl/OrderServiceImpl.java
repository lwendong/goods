package service.before.impl;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import dao.before.OrderDao;
import po.Order;
import service.before.OrderService;
import util.MyUtil;
@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao orderDao;
	
	public String orderSubmit(HttpSession session,Model model) {
		String userId = MyUtil.getUserId(session); 
		String orderCode = MyUtil.getUUID();
		List<Order> list = orderDao.selectGoodsByUserId(userId);
		for(Order o:list) {
			o.setOrderCode(orderCode);
		}
		orderDao.updateGoodsSellNum(list);
		model.addAttribute("oCode", orderCode);
		return "before/orderdone";
	}


}
