package service.admin;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import po.Goods;
public interface AdminGoodsService {
	
	public String selectGoodsOne(Model model, String goodsI, String act);
	
	public Map<String, Object> deleteGoods(String[] goodsIds, Model model);
	
	public Map<String, Object> deleteGoodsOne(String goodsId, Model model);
	
	public String addOrUpdateGoods(Goods goods, MultipartFile fil,HttpServletRequest request, String updateAct);
	
	public String selectGoods(Model model, Integer pageNo, String delAndUp);
}
