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
	 * ��ҳ
	 */
	@RequestMapping("/before")
	public String before(Model model,HttpSession session, Goods goods) {
		return indexService.before(model, session, goods);
	}
	/**
	 * ת��ע��ҳ��
	 */
	@RequestMapping("/toRegister")
	public String toRegister(Model model) {
		return indexService.toRegister(model);
	}
	/**
	 * ת����¼ҳ��
	 */
	@RequestMapping("/toLogin")
	public String toLogin(Model model) {
		return indexService.toLogin(model);
	}
	/**
	 * ת����Ʒ����ҳ
	 */
	@RequestMapping("/goodsDetail")
	public String goodsDetail(Model model,String id,HttpSession session) {
		userCenterService.findgoodCommenBygoodId(id, model);
		return indexService.goodsDetail(model, id,MyUtil.getUserId(session));
	}
	/**
	 * ת������ҳ��
	 */
	@RequestMapping("/selectANotice")
	public String selectANotice(Model model,String noticeId) {
		return indexService.selectANotice(model, noticeId);
	}
	/**
	 * ��ҳ����
	 */
	@RequestMapping("/search")
	public String search(Model model,String mykey) {
		return indexService.search(model, mykey);
	}
	/**
	 * ����������Ʒ
	 */
	@RequestMapping("/goodsbyType")
	public String selectGoodsByType(Model model,String typeCode) {
		return indexService.selectGoodsByType(model, typeCode);
	}
	
}
