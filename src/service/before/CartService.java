package service.before;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.alibaba.fastjson.JSONObject;

public interface CartService {
	
	public String focus(Model model,String goodsId, HttpSession session);
	
	public String putCart(Model model,Integer num, String goodsId, HttpSession session);
	
	public String selectCart(Model model, HttpSession session);
	
	public String deleteGoodsOne(String goodsId,String num,HttpSession session);
	
	public String clear(HttpSession session);
	
	public String orderConfirm(Model model, HttpSession session);
	
}
