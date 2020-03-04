package controller.admin;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.admin.AdminTypeDao;
import po.Goods;
import po.GoodsType;
import service.admin.AdminGoodsService;

@Controller
@RequestMapping("/admin")
public class AdminGoodsController{
	
	@Autowired
	private AdminGoodsService adminGoodsService;
	@Autowired
	private AdminTypeDao adminTypeDao;
	
	@RequestMapping("/selectGoods")
	public String selectGoods(Model model, Integer pageNo, String delAndUp) {
		return adminGoodsService.selectGoods(model, pageNo, delAndUp);
	}
	
	/**
	 * add页面初始化
	 */
	@RequestMapping("/toAddGoods")
	public String toAddGoods(Model model){
		model.addAttribute("goods", new Goods());
		List<GoodsType> goodsType = adminTypeDao.selectGoodsType();
		model.addAttribute("goodsType",goodsType);
		return "admin/addGoods";
	}
	
	/**
	 * 添加与修改
	 */
	@RequestMapping("/addAupGoods")
	public String addAupGoods(@ModelAttribute Goods goods,MultipartFile fil, HttpServletRequest request, String updateAct){
		return adminGoodsService.addOrUpdateGoods(goods, fil,request, updateAct);
		
	}
	/**
	 * 跳转修改页面
	 */
	@RequestMapping("/updateJsp")
	public String updateJsp(String goodsId, HttpServletRequest request, Model model){
		return adminGoodsService.selectGoodsOne(model, goodsId, "act");
		
	}
	/**
	 * 查询一个名片
	 */
	@RequestMapping("/selectGoodsOne")
	public String selectAGoods(Model model, String id, String act){
		return adminGoodsService.selectGoodsOne(model, id, act);
	}
	/**
	 * 删除多个商品
	 */
	@ResponseBody
	@RequestMapping("/deleteGoods")
	public Map<String, Object> deleteGoods(String[] goodsIds, Model model) {
		return adminGoodsService.deleteGoods(goodsIds, model);	
	}
	/**
	 * 删除单个商品
	 */
	@ResponseBody
	@RequestMapping("/deleteGoodsOne")
	public Map<String, Object> deleteGoodsOne(String goodsId, Model model) {
		Map<String, Object> map = adminGoodsService.deleteGoodsOne(goodsId, model);
		return map;
	}
}
