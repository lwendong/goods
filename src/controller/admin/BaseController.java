package controller.admin;

import org.springframework.stereotype.Controller;

@Controller
public class BaseController {
	/**
	 * 登录权限控制，处理方法执行前执行该方法
	 * @throws AdminLoginNoException 
	 */
	/*@ModelAttribute  
    public void isLogin(HttpSession session, HttpServletRequest request) throws AdminLoginNoException {      
       if(session.getAttribute("user") == null){  
            throw new AdminLoginNoException("没有登录");
       }  
    } */
}
