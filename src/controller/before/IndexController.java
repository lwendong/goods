package controller.before;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import po.Goods;
import service.before.IndexService;
import service.before.UserCenterService;
import util.MyUtil;
@Controller
public class IndexController {
	@Autowired
	private IndexService indexService;
	@Autowired
	private UserCenterService userCenterService;
	/**
	 * 首页
	 */
	@RequestMapping("/before")
	public String before(Model model,HttpSession session, Goods goods) {
		return indexService.before(model, session, goods);
	}
	/**
	 * 转到注册页面
	 */
	@RequestMapping("/toRegister")
	public String toRegister(Model model) {
		return indexService.toRegister(model);
	}
	/**
	 * 转到登录页面
	 */
	@RequestMapping("/toLogin")
	public String toLogin(Model model) {
		return indexService.toLogin(model);
	}
	/**
	 * 转到商品详情页
	 */
	@RequestMapping("/goodsDetail")
	public String goodsDetail(Model model,String id,HttpSession session) {
		userCenterService.findgoodCommenBygoodId(id, model);
		return indexService.goodsDetail(model, id,MyUtil.getUserId(session));
	}
	/**
	 * 转到公告页面
	 */
	@RequestMapping("/selectANotice")
	public String selectANotice(Model model,String noticeId) {
		return indexService.selectANotice(model, noticeId);
	}
	/**
	 * 首页搜索
	 */
	@RequestMapping("/search")
	public String search(Model model,String mykey) {
		return indexService.search(model, mykey);
	}
	/**
	 * 根据类别查商品
	 */
	@RequestMapping("/goodsbyType")
	public String selectGoodsByType(Model model,String typeCode) {
		return indexService.selectGoodsByType(model, typeCode);
	}
	
}
