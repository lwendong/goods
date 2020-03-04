package service.admin;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface AdminTypeService {
	
	public String toAddType(Model model);
	
	public String addType(String typeName,String code,Model model,HttpSession session);
	
	public String toDeleteType(Model model);
	
	public Map<String, Object> deleteType(String typeCode,Model model);
}
