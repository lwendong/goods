package service.before;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import po.Goods;

public interface IndexService {
	
	public String before(Model model,HttpSession session, Goods goods);
	
	public String toRegister(Model model);
	
	public String toLogin(Model model);
	
	public String goodsDetail(Model model,String goodsId,String userId);
	
	public String selectANotice(Model model,String noticeId);
	
	public String search(Model model,String mykey);
	
	public String selectGoodsByType(Model model,String typeCode);
}
