package service.admin.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import dao.admin.AdminTypeDao;
import service.admin.AdminTypeService;
import util.MyUtil;

@Service("adminTypeService")
@Transactional
public class AdminTypeServiceImpl implements AdminTypeService{
	@Autowired
	private AdminTypeDao adminTypeDao;

	public String toAddType(Model model) {
		model.addAttribute("allTypes", adminTypeDao.selectGoodsType());
		return "admin/addType";
	}

	public String addType(String typeName, String code,Model model, HttpSession session) {
		adminTypeDao.addType(MyUtil.getUUID(),typeName,code);
		session.setAttribute("goodsType", adminTypeDao.selectGoodsType());
		return "forward:/adminType/toAddType";
	}

	public String toDeleteType(Model model) {
		model.addAttribute("allTypes", adminTypeDao.selectGoodsType());
		return "admin/deleteType";
	}

	public Map<String, Object> deleteType(String id, Model model) {
		Map<String, Object> map=new HashMap<String,Object>();
		//�����й���
		if(adminTypeDao.selectGoodsByType(id).size() > 0) {
			map.put("message", "�����й�����������ɾ����");
		}else {
			adminTypeDao.deleteType(id);
			map.put("message", "���ͳɹ�ɾ����");
		}
		//�ص�ɾ��ҳ��
		return map;
	}
	
}
