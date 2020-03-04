package controller.before;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import service.before.CartService;

@Controller
@RequestMapping("/cart")
public class CartController extends BaseBeforeController{
	@Autowired
	private CartService cartService;
	/**
	 * ��ע��Ʒ
	 */
	@RequestMapping("/focus")
	public String focus(Model model,String goodsId, HttpSession session) {
		return cartService.focus(model, goodsId, session);
	}
	
	/**
	 * ȡ����ע��Ʒ
	 */
	@RequestMapping("/nofocus")
	public String nofocus(Model model,String goodsId, HttpSession session) {
		return cartService.nofocus(model, goodsId, session);
	}
	
	/**
	 * ��ӹ��ﳵ
	 */
	@RequestMapping("/putCart")
	public String putCart(Model model,Integer shoppingnum, String goodsId, HttpSession session) {
		return cartService.putCart(model, shoppingnum, goodsId, session);
	}
	/**
	 * ��ѯ���ﳵ
	 */
	@RequestMapping("/selectCart")
	public String selectCart(Model model, HttpSession session) {
		return cartService.selectCart(model, session);
	}
	/**
	 * ɾ�����ﳵ
	 */
	@RequestMapping("/deleteAgoods")
	public String deleteAgoods(String id,String num,HttpSession session) {
		return cartService.deleteGoodsOne(id,num, session);
	}
	/**
	 * ��չ��ﳵ
	 */
	@RequestMapping("/clear")
	public String clear(HttpSession session) {
		return cartService.clear(session);
	}
	
	/**
	 * ȥ����
	 */
	@RequestMapping("/orderConfirm")
	public String orderConfirm(Model model, HttpSession session) {
		return cartService.orderConfirm(model, session);
	}
	
}
