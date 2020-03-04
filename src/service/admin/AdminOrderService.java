package service.admin;

import org.springframework.ui.Model;

public interface AdminOrderService {
	
	public String orderInfo(Model model,Integer pageNo);
	
	public String deleteorderManager(String orderId);
}
