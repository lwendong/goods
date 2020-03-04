package service.before.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import dao.admin.AdminNoticeDao;
import dao.admin.AdminTypeDao;
import dao.before.IndexDao;
import dao.before.UserCenterDao;
import po.User;
import po.Goods;
import po.Notice;
import service.before.IndexService;
import util.MyUtil;

@Service("indexService")
@Transactional
public class IndexServiceImpl implements IndexService{
	
	@Autowired
	private IndexDao indexDao;
	@Autowired
	private AdminTypeDao adminTypeDao;
	@Autowired
	private AdminNoticeDao adminNoticeDao;
	@Autowired
	private UserCenterDao userCenterDao;
	
	public String before(Model model, HttpSession session, Goods goods) {
		session.setAttribute("goodsType", adminTypeDao.selectGoodsType());
		model.addAttribute("salelist", indexDao.getSaleOrder());//销售排行
		model.addAttribute("focuslist", indexDao.getFocusOrder());//人气排行
		model.addAttribute("noticelist", indexDao.selectNotice());//公告栏
		model.addAttribute("lastedlist", indexDao.getLastedGoods(goods));//最新商品
		return "before/index";
	}

	public String toRegister(Model model) {
//		model.addAttribute("user", new User());
		return "before/register";
	}

	public String toLogin(Model model) {
		return "before/login";
	}

	public String goodsDetail(Model model, String goodsId,String userId) {
		Goods goods = indexDao.selectGoodsById(goodsId);
		model.addAttribute("goods", goods);
		int isFocus = userCenterDao.selectGoodsByUserIdOnOrder(userId,goodsId);
		if(isFocus>0) {
			model.addAttribute("isFocus", 1);
		}
		return "before/goodsdetail";
	}

	public String selectANotice(Model model, String noticeId) {
		Notice notice = adminNoticeDao.selectNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		return "before/noticedetail";
	}

	public String search(Model model, String mykey) {
		List<Goods> list = null;
		if(StringUtils.isNotEmpty(mykey)) {
			list = indexDao.search(mykey);
		}
		model.addAttribute("searchlist",list);
		return "before/searchResult";
	}

	@Override
	public String selectGoodsByType(Model model,String typeCode) {
		List<Goods> goods = indexDao.selectGoodsByType(typeCode);
		model.addAttribute("goodsBytype",goods);
		return "before/goodstypeshow";
	}
	
}
