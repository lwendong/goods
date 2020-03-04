package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import po.User;

public class MyInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,Object handler) throws Exception {
		HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
        	String homeUrl = httpServletRequest.getContextPath();
        	if (httpServletRequest.getHeader("x-requested-with") != null 
        			&& httpServletRequest.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
        		
                httpServletResponse.setHeader("SESSIONSTATUS", "TIMEOUT");
                httpServletResponse.setHeader("CONTEXTPATH", homeUrl+"/toLogin");
                httpServletResponse.setStatus(HttpServletResponse.SC_FORBIDDEN); 
            }else{
            	 httpServletResponse.sendRedirect(homeUrl+"/toLogin");
            }
            return false;
        }
		return true;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exception) throws Exception { 
		HttpSession session = request.getSession();
		session.setAttribute("msg", "");
	}

}
