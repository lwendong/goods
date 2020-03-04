package service.before.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import dao.before.IndexDao;
import dao.before.OrderDao;
import po.Goods;
import po.Order;
import service.before.OrderService;
import util.MyUtil;
@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao orderDao;
	
	public String orderSubmit(HttpSession session) {
		String userId = MyUtil.getUserId(session); 
		//更新商品库存
		List<Order> list = orderDao.selectGoodsByUserId(userId);
		orderDao.updateStore(list);
		return "before/orderdone";
	}
	
	public String pay(HttpSession session) {
		orderDao.pay(MyUtil.getUserId(session));
		return "before/paydone";
	}


}
