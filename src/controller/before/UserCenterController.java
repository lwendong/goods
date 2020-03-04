package controller.before;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import po.User;
import po.Comment;
import service.before.UserCenterService;
import util.MyUtil;

@Controller
public class UserCenterController extends BaseBeforeController{
	
	@Autowired
	private UserCenterService userCenterService;
	
	@RequestMapping("/userCenter")
	public String userCenter(HttpSession session, Model model) {
		return userCenterService.userCenter(session, model);
	}
	@RequestMapping("/orderDetail")
	public String orderDetail(Model model, String orderId) {
		return userCenterService.orderDetail(model, orderId);
	}
	@RequestMapping("/userControllerCenter")
	public String userControllerCenter(HttpSession session, Model model) {
		return userCenterService.userControllerCenter(session, model);
	}
	
	/**
	 * 我的信息
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/userMyInfo")
	public String userMyInfo(HttpSession session, Model model) {
		return userCenterService.userMyInfo(session, model);
	}
	
	/**
	 * 我的信息管理显示
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/myinfoManager")
	public String myinfoManager(HttpSession session, Model model) {
		return userCenterService.myinfoManager(session, model);
	}
	
	/**
	 * 我的信息管理显示
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/myinfoPassword")
	public String myinfoPassword(HttpSession session, Model model) {
		return userCenterService.myinfoPassword(session, model);
	}
	
	/**
	 * 修改我的信息
	 */
	@RequestMapping(value="/updateInfo",method=RequestMethod.POST)
	@ResponseBody
	public int updateInfo(@RequestBody User user,HttpSession session) {
		user.setId(MyUtil.getUserId(session));
		userCenterService.updateInfo(user);
		userCenterService.disposeUser(session, user);
		return 1;
	}
	
	/**
	 * 修改我的密码
	 */
	@RequestMapping(value="/updatePassWordInfo",method=RequestMethod.POST)
	@ResponseBody
	public int updatePassWordInfo(@RequestBody User user,HttpSession session,HttpServletResponse response) throws IOException {
		user.setId(MyUtil.getUserId(session));
		userCenterService.updateUserPassword(user);
		userCenterService.disposeUser(session, user);
		return 1;
	}
	
	@RequestMapping("/addComment")
	@ResponseBody
	public int addComment(@RequestBody Comment comment,HttpSession session) {
		userCenterService.addComment(comment, session);
		return 1;
	}
	
	@RequestMapping("/myComment")
	public String myComment(HttpSession session, Model model) {
		return userCenterService.myComment(session,model);
	}
	
	@RequestMapping("/deleteComment")
	@ResponseBody
	public int deleteComment(@RequestBody String commentId) {
		userCenterService.removeCommentById(commentId);
		return 1;
	}
	
	@RequestMapping("/updateCommentByid")
	@ResponseBody
	public int updateCommentByid(@RequestBody Map<String, Object> data) {
		String comment=(String)data.get("comment");
		String id=(String)data.get("commentId");
		userCenterService.updateCommentById(comment,id);
		return 1;
	}
	
	@RequestMapping("/commentById")
	@ResponseBody
	public Comment commentById(@RequestBody String commentId) {
		return userCenterService.commentById(commentId);
	}
	
}
