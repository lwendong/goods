package controller.admin;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import exception.AdminLoginNoException;
@Controller
public class BaseController {
	/**
	 * ��¼Ȩ�޿��ƣ�������ִ��ǰִ�и÷���
	 * @throws AdminLoginNoException 
	 */
	/*@ModelAttribute  
    public void isLogin(HttpSession session, HttpServletRequest request) throws AdminLoginNoException {      
       if(session.getAttribute("user") == null){  
            throw new AdminLoginNoException("û�е�¼");
       }  
    } */
}
