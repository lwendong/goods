package service.before.impl;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.before.OrderDao;
import po.Order;
import service.before.OrderService;
import util.MyUtil;
@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao orderDao;
	
	public String orderSubmit(HttpSession session) {
		String userId = MyUtil.getUserId(session); 
		List<Order> list = orderDao.selectGoodsByUserId(userId);
//		orderDao.updateStore(list);
		orderDao.updateGoodsSellNum(list);
		return "before/orderdone";
	}
	
	public String pay(HttpSession session) {
		orderDao.pay(MyUtil.getUserId(session));
		return "before/paydone";
	}


}
