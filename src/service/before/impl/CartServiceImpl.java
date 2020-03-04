package service.before.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.alibaba.fastjson.JSONObject;

import dao.before.CartDao;
import dao.before.IndexDao;
import po.Goods;
import service.before.CartService;
import util.MyUtil;

@Service("cartService")
@Transactional
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDao cartDao;
	@Autowired
	private  IndexDao indexDao;
	
	public String focus(Model model, String goodsId, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", MyUtil.getUserId(session));
		map.put("gid", goodsId);
		map.put("id", MyUtil.getUUID());
		List<Map<String, Object>> list = cartDao.isFocus(map);
		if(list.size() > 0) {
			model.addAttribute("msg", "已关注该商品！");
		}else {
			int n = cartDao.focus(map);
			if(n > 0) {
				cartDao.updateGoodsPopularityNum(goodsId);
				model.addAttribute("msg", "成功关注该商品！");
			}else {
				model.addAttribute("msg", "关注失败！");
			}
		}
		return "forward:/goodsDetail?id=" + goodsId;
	}
	public String putCart(Model model, Integer num, String goodsId, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Goods goods = indexDao.selectGoodsById(goodsId);
		map.put("price", goods.getPrice());
		map.put("uid", MyUtil.getUserId(session));
		map.put("gid", goodsId);
		map.put("id", MyUtil.getUUID());
		map.put("num", num);
		//是否已添加购物车
		List<Map<String, Object>> list = cartDao.isPutCart(map);
		if(list.size() > 0){
			cartDao.updateCart(map);
		}else{
			cartDao.putCart(map);
		}
		//减去商品库存
		cartDao.updateGoodsInventory(map);
		model.addAttribute("jump", "cart");
		return "before/userControllerCenter";
	}
	public String selectCart(Model model, HttpSession session) {
		List<Map<String, Object>> list = cartDao.selectCart(MyUtil.getUserId(session));
		Double sum = 0.0;
		for (Map<String, Object> map : list) {
			sum = sum + (Double)map.get("smallsum");
		}
		model.addAttribute("total", sum);
		model.addAttribute("cartlist", list);
		return "before/userDetail/myinfo-shopcar";
	}
	
	public String deleteGoodsOne(String goodsId,String num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", MyUtil.getUserId(session));
		map.put("gid", goodsId);
		map.put("num", num);
		cartDao.deleteGoodsOne(map);
		cartDao.addGoodsInventory(map);
		return "forward:/cart/selectCart";
	}
	public String clear(HttpSession session) {
		String userId = MyUtil.getUserId(session);
		cartDao.clear(userId);
		return "forward:/cart/selectCart";
	}
	
	public String orderConfirm(Model model, HttpSession session) {
		List<Map<String, Object>> list = cartDao.selectCart(MyUtil.getUserId(session));
		Double sum = 0.0;
		for (Map<String, Object> map : list) {
			sum = sum + (Double)map.get("smallsum");
			
		}
		model.addAttribute("total", sum);
		model.addAttribute("cartlist", list);
		return "before/orderconfirm";
	}
	@Override
	public Map<String, Object> nofocus(Model model, String goodsId, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map1 = new HashMap<String, Object>();
		map.put("uid", MyUtil.getUserId(session));
		map.put("gid", goodsId);
		cartDao.nofocus(map);
		map1.put("message", "取消成功");
		return map1;
	}
	
}
