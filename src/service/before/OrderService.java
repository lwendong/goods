package service.before;
import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.ui.Model;

import po.Order;
public interface OrderService {
	
	public String orderSubmit(HttpSession session);
	
	public String pay(HttpSession session);
	
}
