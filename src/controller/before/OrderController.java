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
	 * Ã·Ωª∂©µ•
	 */
	@RequestMapping("/orderSubmit")
	public String orderSubmit(Model model, HttpSession session) {
		return orderService.orderSubmit(session,model);
	}
}
