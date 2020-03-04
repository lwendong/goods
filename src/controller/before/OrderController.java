package controller.before;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.before.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseBeforeController{
	@Autowired
	private OrderService orderService;
	/**
	 * 提交订单
	 */
	@RequestMapping("/orderSubmit")
	public String orderSubmit( HttpSession session) {
		return orderService.orderSubmit( session);
	}
	/**
	 * 支付订单
	 */
	@RequestMapping("/pay")
	public String pay(HttpSession session) {
		return orderService.pay(session);
	}
}
