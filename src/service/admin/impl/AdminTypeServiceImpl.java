package service.admin.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import dao.admin.AdminTypeDao;
import po.GoodsType;
import service.admin.AdminTypeService;
import util.MyUtil;

@Service("adminTypeService")
@Transactional
public class AdminTypeServiceImpl implements AdminTypeService{
	@Autowired
	private AdminTypeDao adminTypeDao;

	public String toAddType(Model model,Integer pageNo) {
		List<GoodsType> list = adminTypeDao.selectGoodsType();
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
		map.put("pageSize", 8);//每页8个
		model.addAttribute("allTypes", adminTypeDao.selectGoodsTypeByPage(map));
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageNo", pageNo);
		return "admin/addType";
	}

	public String addType(String typeName, String code,Model model, HttpSession session) {
		adminTypeDao.addType(MyUtil.getUUID(),typeName,code);
		session.setAttribute("goodsType", adminTypeDao.selectGoodsType());
		return "forward:/admin/toAddType";
	}

	public String toDeleteType(Model model) {
		model.addAttribute("allTypes", adminTypeDao.selectGoodsType());
		return "admin/deleteType";
	}

	public Map<String, Object> deleteType(String id, Model model) {
		Map<String, Object> map=new HashMap<String,Object>();
		//类型有关联
		if(adminTypeDao.selectGoodsByType(id).size() > 0) {
			map.put("message", "类型有关联，不允许删除！");
		}else {
			adminTypeDao.deleteType(id);
			map.put("message", "类型成功删除！");
		}
		//回到删除页面
		return map;
	}
	
}
