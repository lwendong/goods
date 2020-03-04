package service.admin.impl;

import java.util.HashMap;
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
	
	public String orderInfo(Model model,Integer pageNo) {
		List<Map<String,Object>> list = adminOrderDao.orderInfo();
		int temp = list.size();
		model.addAttribute("totalCount", temp);
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//总页数
		} else {
			//返回大于或者等于指定表达式的最小整数
			totalPage = (int) Math.ceil((double) temp / 10);
		}
		if (pageNo == null) {
			pageNo = 1;
		}
		//分页查询
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", (pageNo - 1) * 10);//起始位置
		map.put("pageSize", 10);//每页10个
		
		model.addAttribute("orderList", adminOrderDao.orderInfoBypage(map));
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageNo", pageNo);
		return "admin/orderManager";
	}
	
	public String deleteorderManager(String orderId) {
		adminOrderDao.deleteOrderBase(orderId);
		return "forward:/admin/orderInfo";
	}

}
