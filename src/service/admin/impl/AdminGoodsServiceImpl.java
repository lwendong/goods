package service.admin.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import dao.admin.AdminGoodsDao;
import dao.admin.AdminTypeDao;
import po.Goods;
import po.GoodsType;
import service.admin.AdminGoodsService;
import util.MyUtil;
@Service("adminGoodsService")
@Transactional
public class AdminGoodsServiceImpl implements AdminGoodsService{
	@Autowired
	private AdminGoodsDao adminGoodsDao;
	@Autowired
	private AdminTypeDao adminTypeDao;
	/**
	 * 添加或更新
	 */
	public String addOrUpdateGoods(Goods goods, HttpServletRequest request, String updateAct) {
		/*上传文件的保存位置"/logos"，该位置是指
		workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps，
		发布后使用*/
		//防止文件名重名
		String newFileName = "";
		String fileName = goods.getLogoImage().getOriginalFilename(); 
		//选择了文件
		if(fileName.length() > 0){
			String realpath = request.getServletContext().getRealPath("img");
			//实现文件上传
			String fileType = fileName.substring(fileName.lastIndexOf('.'));
			//防止文件名重名
			newFileName = MyUtil.getStringID() + fileType;
			goods.setImg(newFileName);
			File targetFile = new File(realpath, newFileName); 
			if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        } 
			//上传 
	        try {   
	        	goods.getLogoImage().transferTo(targetFile);
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
		}
		//修改
		if("update".equals(updateAct)){//updateAct不能与act重名，因为使用了转发
			//修改到数据库
	       if(adminGoodsDao.updateGoodsById(goods) > 0){
	        	return "forward:/adminGoods/selectGoods?act=updateSelect";
	        }else{
	        	return "/adminGoods/updateAgoods";
	       }
		}else{
			goods.setId(MyUtil.getUUID());
			//保存到数据库
			if(adminGoodsDao.addGoods(goods) > 0){
				//转发到查询的controller
				return "forward:/adminGoods/selectGoods";
			}else{
				return "card/addCard";
			}
		}
	}
	/**
	 * 查询商品
	 */
	public String selectGoods(Model model, Integer pageNo, String delAndUp) {
		List<Goods> allGoods = adminGoodsDao.selectGoods();
		int temp = allGoods.size();
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
		map.put("pageSize", 10);//每页10个
		
		allGoods = adminGoodsDao.selectAllGoodsByPage(map);
		model.addAttribute("allGoods", allGoods);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageNo", pageNo);
		return "admin/selectGoods";
	}
	/**
	 * 查询一个商品
	 */
	public String selectGoodsOne(Model model, String goodsId, String act) {
		Goods goods = adminGoodsDao.selectGoodsById(goodsId);
		model.addAttribute("goods", goods);
		//详情页面
		if("act".equals(act)) {
			List<GoodsType> goodsType = adminTypeDao.selectGoodsType();
			model.addAttribute("goodsType",goodsType);
			return "admin/updateAgoods";
		}else {
			return "admin/goodsDetail";
		}
	}
	/**
	 * 删除多个商品
	 */
	public Map<String, Object> deleteGoods(String[] goodsIds, Model model) {
		Map<String, Object> map=new HashMap<String,Object>();
		List<String> list = new ArrayList<String>();
		List<String> list2 = new ArrayList<String>();
		for (int i = 0; i < goodsIds.length; i++) {
			//商品有关联
			if(adminGoodsDao.selectCartGoods(goodsIds[i]).size() > 0 ||
				adminGoodsDao.selectFocusGoods(goodsIds[i]).size() > 0 ) {
				list2.add(goodsIds[i]);
			}else {
				list.add(goodsIds[i]);
			}
		}
		
		if(list2.size()!= 0) {
			map.put("message", list2);
		}else {
			if(list.size()!= 0) {
				adminGoodsDao.deleteGoods(list);
				map.put("message", 0);
			}
		}
		
		return map;
	}
	/**
	 * 删除一个商品
	 */
	public Map<String, Object> deleteGoodsOne(String goodsId, Model model) {
		Map<String, Object> map=new HashMap<String,Object>();
		//商品有关联
		if(adminGoodsDao.selectCartGoods(goodsId).size() > 0 ||
			adminGoodsDao.selectFocusGoods(goodsId).size() > 0) {
			map.put("message", "商品有关联，不允许删除！");
		}else {
			adminGoodsDao.deleteGoodsOne(goodsId);
			map.put("message", "删除成功");
		}
		return map;
	}

	
}
